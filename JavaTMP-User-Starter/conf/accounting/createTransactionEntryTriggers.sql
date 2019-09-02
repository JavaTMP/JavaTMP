DROP PROCEDURE IF EXISTS refresh_transactionEntry_now;
DELIMITER $$
CREATE PROCEDURE refresh_transactionEntry_now()
BEGIN
  TRUNCATE TABLE transactionEntry;
  INSERT INTO transactionEntry SELECT * FROM transactionEntryVI;
END;
$$
DELIMITER ;

-- To check if it works the following statement were used:
-- CALL refresh_transactionEntry_now();

-- On every INSERT on the transactionEntry table we have to update our Materialized View.
-- We can implement this transparently by INSERT/UPDATE/DELETE triggers on the sales table:
-- Now let us create the needed triggers:

DROP TRIGGER IF EXISTS accountTransaction_ins_tri;
DELIMITER $$
CREATE TRIGGER accountTransaction_ins_tri
AFTER INSERT ON accountTransaction
FOR EACH ROW
BEGIN
    DECLARE transactionDate DATETIME;
    Declare voucherTypeId int;
    Declare code varchar(1024);
    Declare entryAmount DECIMAL(33,8);
    Declare accountBalance DECIMAL(33,8) DEFAULT 0;

    select trans.transactionDate, trans.voucherTypeId, trans.code
    into transactionDate, voucherTypeId, code
    from `transaction` trans
    where trans.id = new.transactionId;

    select (case when coalesce(new.amount, 0) > 0 then abs(coalesce(new.amount, 0)) * coalesce(acctt.debitSign, 0)
        else abs(coalesce(new.amount, 0)) * coalesce(acctt.creditSign, 0) end)
    into entryAmount
    from accountType acctt
    join accountGroup acctgrp on (acctt.id = acctgrp.accountType)
    join account acct on (acct.accountGroup = acctgrp.id)
    where acct.id = new.accountId;

    update transactionentry t set t.accountBalance = t.accountBalance + entryAmount
    where entryDate > transactionDate and `accountId` = new.accountId;

    select coalesce(transactionentry.`accountBalance`, 0)
    into accountBalance
    from transactionentry
    where entryDate <= transactionDate and `accountId` = new.accountId
    order by `entryDate` desc, id desc
    limit 1
    for update;

    INSERT INTO transactionentry
        (id, `transactionId`, `accountId`, description, status, `entryDate`, amount, debit, credit, `entryAmount`,
        `sourceDocument`, code, `accountBalance`)
	VALUES
        (new.id, new.transactionId, new.accountId,
        new.description, new.status, transactionDate, new.amount,
        (case when new.amount > 0 then new.amount else 0 end),
        (case when new.amount < 0 then new.amount * -1 else 0 end),
        entryAmount,
        voucherTypeId, code, accountBalance  + entryAmount);
END
$$
DELIMITER ;



DROP TRIGGER IF EXISTS accountTransaction_del_tri;
DELIMITER $$
CREATE TRIGGER accountTransaction_del_tri
AFTER DELETE ON accountTransaction
FOR EACH ROW
BEGIN
    Declare entryAmount DECIMAL(33,8);
    DECLARE transactionDate DATETIME;

    select te.entryAmount, te.`entryDate`
    into entryAmount, transactionDate
    from transactionentry te
    where te.id = old.id
    for update;

    update transactionentry t
    set t.accountBalance = t.accountBalance - entryAmount
    where ( (entryDate > transactionDate) or (entryDate = transactionDate and id > old.id))
    and `accountId` = old.accountId;

    delete from transactionentry where id = old.id;
END
$$
DELIMITER ;

DROP TRIGGER IF EXISTS transaction_update_tri;
DELIMITER $$
CREATE TRIGGER transaction_update_tri
AFTER UPDATE ON `transaction`
FOR EACH ROW
BEGIN
    -- Declare loop constructs --
    DECLARE done INT DEFAULT FALSE;

    -- Declare Transaction variables --
    DECLARE currentTransactionId BIGINT UNSIGNED;
    Declare id BIGINT UNSIGNED;
    Declare accountId BIGINT UNSIGNED;
    Declare entryAmount DECIMAL(33,8);
    DECLARE oldTransactionEntryDate DATETIME;
    Declare accountBalance DECIMAL(33,8) DEFAULT 0;

    DECLARE transactionEntriesCursor CURSOR FOR
    select te.id,te.`accountId`, te.entryAmount
    from transactionentry te
    where te.`transactionId` = currentTransactionId
    for update;
    -- Declare Continue Handler --
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

insert into log (description) values (CONCAT('start trigger for transactionId=', old.id,
', oldDate=', old.transactionDate, ' newDate=', NEW.transactionDate));
    IF (OLD.transactionDate <> NEW.transactionDate) THEN
        set currentTransactionId = old.id;
        OPEN transactionEntriesCursor;
        read_loop: LOOP
            set done = false;
            -- Fetch data from cursor --
            FETCH transactionEntriesCursor
            INTO id, accountId, entryAmount;
            -- Exit loop if finished --
            IF done THEN
                LEAVE read_loop;
            END IF;
            insert into log (description) values (CONCAT('transactionId=', old.id, ',entryId=', id, ',accountid=', accountId));
            -- update current transactionEntry record
            update transactionentry t
            set t.accountBalance = t.accountBalance - entryAmount
            where ( (t.entryDate > OLD.transactionDate) or (t.entryDate = OLD.transactionDate and t.id > id))
--             and t.id != id
            and t.`accountId` = accountId;

            insert into log (description) values (CONCAT('after update old entries transactionId=', old.id, ',entryId=', id, ',accountid=', accountId));

            update transactionentry t set t.accountBalance = t.accountBalance + entryAmount
            where ((t.entryDate > NEW.transactionDate) or (t.entryDate = NEW.transactionDate and t.id > id) )
--             and t.id != id
            and t.`accountId` = accountId;

            insert into log (description) values (CONCAT('after update new entries transactionId=', old.id, ',entryId=', id, ',accountid=', accountId));

            set accountBalance = 0;
            select IFNULL(t.`accountBalance`, 0)
            into accountBalance
            from transactionentry t
            where ((t.entryDate < NEW.transactionDate) or (t.entryDate = NEW.transactionDate and t.id < id) )
            and t.`accountId` = accountId
--             and t.id != id
            order by t.`entryDate` desc, t.id desc
            limit 1
            for update;

            insert into log (description) values (CONCAT('after select  accountBalance', accountBalance, ', transactionId=', old.id, ',entryId=', id, ',accountid=', accountId));

            update transactionentry t
            set t.accountBalance = accountBalance + entryAmount, t.entryDate = new.transactionDate
            where t.id = id and t.`accountId` = accountId;

            insert into log (description) values (CONCAT('after update current with accountBalance', (accountBalance + entryAmount), ', transactionId=', old.id, ',entryId=', id, ',accountid=', accountId));

        END LOOP read_loop;
        CLOSE transactionEntriesCursor;
    END IF;
END
$$
DELIMITER ;
