/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  JavaTMP
 * Created: Oct 15, 2018
 */
-- 1) Using SQL to produce Trial Balance
select Journal_T.GL_ID as 'Acct Code',GL_Name_VC as 'Acct Name',
 case when sum(Amount_NU) > 0 then sum(Amount_NU) else 0 end as 'Debit Bal',
 case when sum(Amount_NU) < 0 then (sum(Amount_NU)) else 0 end as 'Credit Bal'
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID
where BS_Category_VC in ('FA_Cost', 'FA', 'CA', 'CL', 'SF', 'Rev', 'Cos', 'Otc', 'Oic', 'Tax')
group by GL_Name_VC,Journal_T.GL_ID

union all
select '','Total',
 sum(case when Amount_NU > 0 then Amount_NU else 0 end) as 'Debit Bal',
 sum(case when Amount_NU < 0 then (Amount_NU) else 0 end) as 'Credit Bal'
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID
where
BS_Category_VC in ('FA_Cost', 'FA', 'CA', 'CL', 'SF', 'Rev', 'Cos', 'Otc', 'Oic', 'Tax')

union all
select '','Total BS Movement in YR 2007',
 sum( case when Amount_NU > 0 and BS_Category_VC in
 ('FA_Cost','FA','CA','CL','SF') then Amount_NU else 0 end) +
 sum( case when Amount_NU <0 and BS_Category_VC in
 ('FA_Cost','FA','CA','CL','SF') then Amount_NU else 0 end),0
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID

union all
select '','Total PL Movement in YR 2007',
 sum( case when Amount_NU <0 and Year_SI = '2007' and BS_Category_VC in
 ('Rev','Cos','Otc','Oic','Tax') then Amount_NU else 0 end) +
 sum( case when Amount_NU >0 and Year_SI = '2007' and BS_Category_VC in
 ('Rev','Cos','Otc','Oic','Tax') then Amount_NU else 0 end),0
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID

