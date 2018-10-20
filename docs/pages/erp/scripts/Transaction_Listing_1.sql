/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  JavaTMP
 * Created: Oct 16, 2018
 */
select Journal_T.GL_ID as accountId,GL_Name_VC as acctName, BS_Category_VC as acctCat, journal_t.`Doc_No_VC`,
 sum(case when BS_Category_VC in ('FA_Cost','FA','CA','Cos','Otc','Tax') and Amount_NU > 0 then Amount_NU
else case when BS_Category_VC not in ('FA_Cost','FA','CA','Cos','Otc','Tax') and Amount_NU < 0 then (Amount_NU * -1) else 0 end end) as debits,
 sum(case when BS_Category_VC in ('FA_Cost','FA','CA','Cos','Otc','Tax') and Amount_NU < 0 then (Amount_NU * -1)
else case when BS_Category_VC not in ('FA_Cost','FA','CA','Cos','Otc','Tax') and Amount_NU > 0 then (Amount_NU) else 0 end end) as credits

from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID
where Journal_T.GL_ID IN (5002)