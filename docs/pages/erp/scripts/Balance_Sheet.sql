/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  JavaTMP
 * Created: Oct 16, 2018
 */
select 'Cur_yr_Earnings' as 'Share Capital & Earnings',
 sum(case when COA_T.BS_Category_VC in ('Rev','Cos','Otc','Oic','Tax')
 and Journal_T.Year_SI = 2007
 then Journal_T.Amount_NU else 0 end) as '$'
from COA_T join Journal_T
on COA_T.GL_ID = Journal_T.GL_ID
union all
select GL_Name_VC,
 sum(case when Year_SI = 2007 and BS_Category_VC in ('SF') then
 Amount_NU else 0 end) as '$'
from COA_T join Journal_T
on COA_T.GL_ID = Journal_T.GL_ID
where Year_SI = 2007
and BS_Category_VC in ('SF')
group by GL_Name_VC

union all
select 'Total Shareholder Funds' as 'Liabilities and Capital',
 sum(case when BS_Category_VC in ('Rev','Cos','Otc','Oic','Tax') and
 Year_SI = 2007
 then Amount_NU else 0 end) +
 sum(case when Year_SI = 2007 and BS_Category_VC in ('SF') then
 Amount_NU else 0 end) as '$'
from COA_T join Journal_T
on COA_T.GL_ID = Journal_T.GL_ID

union all
select IFNULL(GL_Name_VC, 'Total Current Liability')as 'Current
Liabilities', sum(Amount_NU)as '$'
from COA_T join Journal_T
on COA_T.GL_ID = Journal_T.GL_ID
where BS_Category_VC = 'CL'
group by GL_Name_VC
with rollup

union all
select 'Total Liabilities', SUM(case when BS_Category_VC ='CL' or BS_Category_VC='SF'
 then Amount_NU else 0 end) +
 sum(case when BS_Category_VC in ('Rev','Cos','Otc','Oic','Tax') and
 Year_SI = 2007
 then Amount_NU else 0 end) AS 'Total Liabilities'
from COA_T join Journal_T
on COA_T.GL_ID = Journal_T.GL_ID

union all
select IFNULL(GL_Name_VC, 'Total Net Book Value')as 'Fixed Assets',
 sum(Amount_NU)as '$'
from COA_T join Journal_T
on COA_T.GL_ID = Journal_T.GL_ID
where BS_Category_VC in ('FA','FA_Cost')
group by GL_Name_VC
with rollup

union all
select IFNULL(GL_Name_VC, 'Total Current Asset')as 'Current Asset',
 sum(Amount_NU)as '$'
from COA_T join Journal_T
on COA_T.GL_ID = Journal_T.GL_ID
where BS_Category_VC='CA'
group by GL_Name_VC
with rollup

union all
select 'Total Assets', SUM(Amount_NU)AS 'Total Assets'
from COA_T join Journal_T
on COA_T.GL_ID = Journal_T.GL_ID
where BS_Category_VC='CA' or BS_Category_VC in ('FA','FA_Cost')