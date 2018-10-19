select accountId, acctName, acctCat, debits, credits,(debits - credits) as balance
from (
select Journal_T.GL_ID as accountId,GL_Name_VC as acctName, BS_Category_VC as acctCat,
 sum(case when BS_Category_VC in ('FA_Cost','FA','CA','Cos','Otc','Tax') and Amount_NU > 0 then Amount_NU
else case when BS_Category_VC not in ('FA_Cost','FA','CA','Cos','Otc','Tax') and Amount_NU < 0 then (Amount_NU * -1) else 0 end end) as debits,
 sum(case when BS_Category_VC in ('FA_Cost','FA','CA','Cos','Otc','Tax') and Amount_NU < 0 then (Amount_NU * -1)
else case when BS_Category_VC not in ('FA_Cost','FA','CA','Cos','Otc','Tax') and Amount_NU > 0 then (Amount_NU) else 0 end end) as credits
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID
--where BS_Category_VC in ('FA_Cost', 'FA', 'CA', 'CL', 'SF', 'Rev', 'Cos', 'Otc', 'Oic', 'Tax')
group by Journal_T.GL_ID, GL_Name_VC, BS_Category_VC) acctList;


-- cat increase on debit : 'FA_Cost','FA','CA','Cos','Otc','Tax'