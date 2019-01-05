CREATE OR REPLACE VIEW transactionEntries AS
select entryDate, transId, acctTransId, accountId, debit, credit, entryBalance,
SUM(entryBalance) OVER(PARTITION BY accountId ORDER BY entryDate, acctTransId
) AS accountBalance
from (
select trans.transactionDate as entryDate, acctTrans.id as acctTransId, trans.id as transId,
acct.id as accountId, acct.accountCode as accountCode, acct.name as acctName, acct.parentAccountId as parentAccountId,
(case when acctTrans.amount>0 then acctTrans.amount else 0 end) as debit,
(case when acctTrans.amount<0 then acctTrans.amount*-1 else 0 end) as credit,
(case when coalesce(acctTrans.amount, 0) > 0 then abs(coalesce(acctTrans.amount, 0))*coalesce(acctt.debitSign, 0) else abs(coalesce(acctTrans.amount, 0))*coalesce(acctt.creditSign, 0) end) as entryBalance,
acct.accountGroup as col_7_0_, acct.cashFlowId as col_8_0_, acctgrp.name as col_9_0_, acctt.name as col_10_0_, acctt.debitSign as col_11_0_, acctt.creditSign as col_12_0_
from accounttransaction acctTrans
join account acct on (acct.id=acctTrans.accountId)
left outer join transaction trans on (acctTrans.transactionId=trans.id)
left outer join accountgroup acctgrp on (acct.accountGroup=acctgrp.id)
left outer join accounttype acctt on (acctt.id = acctgrp.accountType)
) entries;
select te.*, last_VALUE(accountBalance) OVER(PARTITION BY accountId ORDER BY entryDate, acctTransId) AS balance
from transactionEntries te;
-- where
-- entryDate between STR_TO_DATE('01/12/2018 20:00:00', '%d/%m/%Y %H:%i:%s')
--                 and STR_TO_DATE('30/12/2018 20:00:00', '%d/%m/%Y %H:%i:%s') limit 1000000;




