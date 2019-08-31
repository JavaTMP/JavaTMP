
CREATE OR REPLACE VIEW Entry AS
select acctTrans.id as id, trans.id as transactionId, acctTrans.moduleId as moduleId,
acctTrans.moduleTypeId as moduleTypeId, acctTrans.moduleRefId as moduleRefId, acctTrans.accountId as accountId,
acctTrans.description as description, acctTrans.status as status, trans.transactionDate as entryDate,
acctTrans.amount as amount,
(case when acctTrans.amount > 0 then acctTrans.amount else 0 end) as debit,
(case when acctTrans.amount < 0 then acctTrans.amount * -1 else 0 end) as credit,
(case when coalesce(acctTrans.amount, 0) > 0 then abs(coalesce(acctTrans.amount, 0)) * coalesce(acctt.debitSign, 0)
else abs(coalesce(acctTrans.amount, 0)) * coalesce(acctt.creditSign, 0) end) as entryAmount,
trans.`voucherTypeId` as sourceDocument, trans.code as code
from accountTransaction acctTrans
join account acct on (acct.id = acctTrans.accountId)
join `transaction` trans on (acctTrans.transactionId = trans.id)
join accountGroup acctgrp on (acct.accountGroup = acctgrp.id)
join accountType acctt on (acctt.id = acctgrp.accountType);

CREATE OR REPLACE VIEW transactionEntryVI AS
select entry.*,
SUM(entryAmount)
OVER(PARTITION BY accountId ORDER BY entryDate, id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
AS accountBalance
-- ,
-- SUM(entryAmount) OVER(PARTITION BY moduleId ORDER BY entryDate
-- ) AS moduleIdBalance,
-- SUM(entryAmount) OVER(PARTITION BY moduleId,moduleTypeId,moduleRefId ORDER BY entryDate
-- ) AS entityBalance
from entry;

DROP TABLE IF EXISTS transactionEntry;
CREATE TABLE transactionEntry AS SELECT * FROM transactionEntryVI;

ALTER TABLE transactionEntry ADD CONSTRAINT transactionEntry_pk PRIMARY KEY (id);
-- ALTER TABLE transactionEntry ADD CONSTRAINT transactionEntry_pk PRIMARY KEY (id) AUTO_INCREMENT;
-- ALTER TABLE transactionEntry ADD CONSTRAINT transactionEntry_pk PRIMARY KEY (id) AUTO_INCREMENT;
-- ALTER TABLE transactionEntry MODIFY id BIGINT AUTO_INCREMENT;
ALTER TABLE transactionEntry ADD CONSTRAINT transactionEntry_accountId_fk FOREIGN KEY (accountId) REFERENCES account(id);
ALTER TABLE transactionEntry ADD CONSTRAINT transactionEntry_transactionId_fk FOREIGN KEY (transactionId) REFERENCES transaction(id);

CREATE INDEX transactionEntry_dateASC_ind ON transactionEntry (entryDate ASC);
CREATE INDEX transactionEntry_dateDESC_ind ON transactionEntry (entryDate DESC);

INSERT INTO transactionEntry SELECT * FROM transactionEntryVI;

DROP TABLE IF EXISTS log;

CREATE TABLE log (
    id BIGINT UNSIGNED not null AUTO_INCREMENT,
    creationDate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
    description varchar(1024),
    CONSTRAINT acctTrans_id_pk PRIMARY KEY (id)
) ENGINE=InnoDB;