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
 case when sum(Amount_NU) < 0 then sum(Amount_NU) else 0 end as 'Credit Bal'
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID
group by GL_Name_VC,Journal_T.GL_ID

union all
select '', 'Grand Total',
sum(case when Amount_NU > 0 then Amount_NU else 0 end) as 'Debit Bal',
sum(case when Amount_NU < 0 then Amount_NU else 0 end) as 'Credit Bal'
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID

