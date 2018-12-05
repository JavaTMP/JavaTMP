select acct.id, acct.accountCode, acct.name, acct.`parentAccountId`, sum(case when att.amount > 0 then att.amount else 0 end) as 'Debit',
sum(case when att.amount < 0 then (att.amount * -1) else 0 end) as 'credit', sum(att.amount) balance
from account acct
left outer join accounttransaction att on acct.id = att.accountId
left outer join transaction trans on att.transactionId = trans.id
group by acct.id, acct.accountCode, acct.name, acct.parentAccountId;

select acctt.id, acctt.`transactionId`, acctt.`accountId`, acct.`name`, acctt.amount
from accounttransaction acctt
left join account acct on acct.id = acctt.`accountId`
left join `transaction` t on t.id = acctt.`transactionId`;

select acctt.*
from accounttransaction acctt
left join account acct on acct.id = acctt.`accountId`
left join `transaction` t on t.id = acctt.`transactionId`;
