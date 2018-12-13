select account0_.id, account0_.accountCode, account0_.name, account0_.parentAccountId,
sum(case when accounttra1_.amount > 0 then accounttra1_.amount else 0 end) as debit,
sum(case when accounttra1_.amount < 0 then accounttra1_.amount * -1 else 0 end) as credit,
sum(case when coalesce(accounttra1_.amount, 0) > 0 then (abs(coalesce(accounttra1_.amount, 0)) * coalesce(at.debitSign, 0)) else (abs(coalesce(accounttra1_.amount, 0)) * coalesce(at.creditSign, 0)) end),
account0_.accountGroup, account0_.cashFlowId, ag.`name`, at.name, at.debitSign, at.creditSign
from account account0_
left outer join accounttransaction accounttra1_ on (account0_.id=accounttra1_.accountId)
left outer join transaction transactio2_ on (accounttra1_.transactionId=transactio2_.id)
left outer join accountgroup ag on account0_.`accountGroup` = ag.id
left outer join accounttype at on at.id = ag.`accountType`
group by account0_.id , account0_.accountCode , account0_.name ,
account0_.parentAccountId, account0_.accountGroup, account0_.cashFlowId
,ag.`name`, at.name, at.debitSign, at.creditSign;
