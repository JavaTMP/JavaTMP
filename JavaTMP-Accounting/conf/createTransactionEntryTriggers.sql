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

    Declare debitSign int(1);
    Declare creditSign int(1);

    select trans.transactionDate, trans.voucherTypeId, trans.code
    into transactionDate, voucherTypeId, code
    from `transaction` trans
    where trans.id = new.transactionId;

    select acctt.debitSign,acctt.creditSign
    into debitSign, creditSign
    from accountType acctt
    join accountGroup acctgrp on (acctt.id = acctgrp.accountType)
    join account acct on (acct.accountGroup = acctgrp.id)
    where acct.id = new.accountId;

    INSERT INTO transactionentry
        (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`,
        description, status, `entryDate`, amount, debit, credit, `entryAmount`,
        `sourceDocument`, code, `accountBalance`)
	VALUES
        (new.transactionId, new.moduleId, new.moduleTypeId, new.moduleRefId, new.accountId,
        new.description, new.status, transactionDate, new.amount,
        (case when new.amount > 0 then new.amount else 0 end),
        (case when new.amount < 0 then new.amount * -1 else 0 end),
        (case when coalesce(new.amount, 0) > 0 then abs(coalesce(new.amount, 0)) * coalesce(debitSign, 0)
        else abs(coalesce(new.amount, 0)) * coalesce(creditSign, 0) end),
        voucherTypeId, code, -1);
END;
$$
DELIMITER ;