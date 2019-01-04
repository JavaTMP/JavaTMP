select * from (select entryDate, transId, acctTransId, accountId, debit, credit, entryBalance,
SUM(entryBalance) OVER(PARTITION BY accountId ORDER BY entryDate, acctTransId
) AS cumulative_sum
from (
select transactio2_.transactionDate as entryDate, accounttra1_.id as acctTransId, transactio2_.id as transId, account0_.id as accountId, account0_.accountCode as accountCode, account0_.name as col_2_0_, account0_.parentAccountId as col_3_0_,
(case when accounttra1_.amount>0 then accounttra1_.amount else 0 end) as debit,
(case when accounttra1_.amount<0 then accounttra1_.amount*-1 else 0 end) as credit,
(case when coalesce(accounttra1_.amount, 0)>0 then abs(coalesce(accounttra1_.amount, 0))*coalesce(accounttyp4_.debitSign, 0) else abs(coalesce(accounttra1_.amount, 0))*coalesce(accounttyp4_.creditSign, 0) end) as entryBalance,
account0_.accountGroup as col_7_0_, account0_.cashFlowId as col_8_0_, accountgro3_.name as col_9_0_, accounttyp4_.name as col_10_0_, accounttyp4_.debitSign as col_11_0_, accounttyp4_.creditSign as col_12_0_
from accounttransaction accounttra1_
join account account0_ on (account0_.id=accounttra1_.accountId)
left outer join transaction transactio2_ on (accounttra1_.transactionId=transactio2_.id)
left outer join accountgroup accountgro3_ on (account0_.accountGroup=accountgro3_.id)
left outer join accounttype accounttyp4_ on (accounttyp4_.id=accountgro3_.accountType)
) entries
) cumulative
where

entryDate between STR_TO_DATE('30/12/2018 00:00:00', '%d/%m/%Y %H:%i:%s')
                and STR_TO_DATE('31/12/2018 23:59:00', '%d/%m/%Y %H:%i:%s') ;




