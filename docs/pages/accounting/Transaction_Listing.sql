/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  JavaTMP
 * Created: Oct 16, 2018
 */
select '' as 'Date','' as 'Acct Code', 'Opening Balance' as
 'Acct Name',
 Descrip_VC as 'Description',0 as 'Period Dr',0 as 'Period Cr',0 as
 'Net Change',sum(Amount_NU)as 'Closing Bal'
from COA_T join Journal_T
on COA_T.GL_ID = Journal_T.GL_ID
where Year_SI < 2007
and BS_Category_VC in ('CA')
and Journal_T.GL_ID = 2003
group by Descrip_VC

union all
select
 Date_DT,Journal_T.GL_ID,GL_Name_VC,Descrip_VC,
 sum( case when Amount_NU >0 and Year_SI = 2007 then
 Amount_NU else 0 end) as 'Period Dr',
 sum( case when Amount_NU <0 and Year_SI = 2007 then
 Amount_NU else 0 end) as 'Period Cr',
 sum(Amount_NU) as 'Net Change',
 'Closing Bal' = sum(Amount_NU)
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID
where Year_SI = 2007 and Journal_T.GL_ID = 2003
group by Journal_T.GL_ID,Date_DT,GL_Name_VC,Descrip_VC
union all
select '','', 'Total Balance','',
 sum(case when Year_SI = 2007 and Amount_NU > 0 then Amount_NU else 0 end),
 sum(case when Year_SI = 2007 and Amount_NU < 0 then Amount_NU else 0 end),
 sum(case when Year_SI = 2007 then Amount_NU else 0 end),
 sum(Amount_NU)
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID
where Year_SI = 2007 and Journal_T.GL_ID = 2003 OR
Year_SI < 2007 and Journal_T.GL_ID = 2003 and BS_Category_VC in ('CA')

