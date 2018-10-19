select accountId, acctName, acctCat, debits, credits,(
case when acctCat in ('FA_Cost','FA','CA','Cos','Otc','Tax') then (debits - credits) else (credits - debits) end
) as balance
from (
select Journal_T.GL_ID as accountId,GL_Name_VC as acctName, BS_Category_VC as acctCat,
 sum(case when Amount_NU > 0 then Amount_NU else 0 end) as debits,
 sum(case when Amount_NU < 0 then (Amount_NU * -1) else 0 end) as credits
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID
--where BS_Category_VC in ('FA_Cost', 'FA', 'CA', 'CL', 'SF', 'Rev', 'Cos', 'Otc', 'Oic', 'Tax')
group by GL_Name_VC,Journal_T.GL_ID) acctList ;


-- cat increase on debit : 'FA_Cost','FA','CA','Cos','Otc','Tax'