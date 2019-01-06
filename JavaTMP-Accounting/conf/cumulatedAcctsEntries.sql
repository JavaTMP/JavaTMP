CREATE OR REPLACE VIEW transactionEntries AS
select entries.*,
SUM(entryBalance) OVER(PARTITION BY accountId ORDER BY entryDate, acctTransId
) AS accountBalance
from (
select trans.transactionDate as entryDate, acctTrans.id as acctTransId, trans.id as transId,
acct.id as accountId, acct.accountCode as accountCode, acct.name as acctName, acct.parentAccountId as parentAccountId,
acctTrans.amount as amount,
(case when acctTrans.amount > 0 then acctTrans.amount else 0 end) as debit,
(case when acctTrans.amount < 0 then acctTrans.amount*-1 else 0 end) as credit,
(case when coalesce(acctTrans.amount, 0) > 0 then abs(coalesce(acctTrans.amount, 0)) * coalesce(acctt.debitSign, 0)
else abs(coalesce(acctTrans.amount, 0)) * coalesce(acctt.creditSign, 0) end) as entryBalance,
acct.accountGroup as accountGroup, acct.cashFlowId as cashFlowId, acctgrp.name as acctGrpName,
acctt.name as accttName, acctt.debitSign as debitSign, acctt.creditSign as creditSign
from account acct
left outer join accounttransaction acctTrans on (acct.id=acctTrans.accountId)
left outer join transaction trans on (acctTrans.transactionId=trans.id)
left outer join accountgroup acctgrp on (acct.accountGroup=acctgrp.id)
left outer join accounttype acctt on (acctt.id = acctgrp.accountType)
) entries;
select te.*
from transactionEntries te where accountid = 31;
-- where
-- entryDate between STR_TO_DATE('01/12/2018 20:00:00', '%d/%m/%Y %H:%i:%s')
--                 and STR_TO_DATE('30/12/2018 20:00:00', '%d/%m/%Y %H:%i:%s') limit 1000000;




