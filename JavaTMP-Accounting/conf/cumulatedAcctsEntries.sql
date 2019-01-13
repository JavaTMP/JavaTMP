CREATE OR REPLACE VIEW transactionEntry AS
select entries.*,
SUM(entryAmount) OVER(PARTITION BY accountId ORDER BY entryDate, id
) AS accountBalance
from (
select acctTrans.id as id, trans.id as transactionId, acctTrans.moduleId as moduleId, acctTrans.moduleTypeId as moduleTypeId,
acctTrans.moduleRefId as moduleRefId, acctTrans.accountId as accountId, acctTrans.description as description, acctTrans.status as status,
trans.transactionDate as entryDate,
acctTrans.amount as amount,
(case when acctTrans.amount > 0 then acctTrans.amount else 0 end) as debit,
(case when acctTrans.amount < 0 then acctTrans.amount * -1 else 0 end) as credit,
(case when coalesce(acctTrans.amount, 0) > 0 then abs(coalesce(acctTrans.amount, 0)) * coalesce(acctt.debitSign, 0)
else abs(coalesce(acctTrans.amount, 0)) * coalesce(acctt.creditSign, 0) end) as entryAmount
from accounttransaction acctTrans
left outer join account acct on (acct.id = acctTrans.accountId)
left outer join transaction trans on (acctTrans.transactionId = trans.id)
left outer join accountgroup acctgrp on (acct.accountGroup = acctgrp.id)
left outer join accounttype acctt on (acctt.id = acctgrp.accountType)
) entries;
select te.*
from transactionEntry te where te.`accountId` = 10 order by te.id;
-- and
-- entryDate between STR_TO_DATE('16/12/2018 20:00:00', '%d/%m/%Y %H:%i:%s')
--                 and STR_TO_DATE('31/12/2018 20:00:00', '%d/%m/%Y %H:%i:%s') order by entryDate desc;




