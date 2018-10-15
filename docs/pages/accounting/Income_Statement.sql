/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  JavaTMP
 * Created: Oct 16, 2018
 */

select Journal_T.GL_ID as 'Acct Code',GL_Name_VC as
 'Revenue', sum(Amount_NU) as 'YTD'
 from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID
where Year_SI = 2007
and BS_Category_VC ='Rev'
GROUP by GL_Name_VC,Journal_T.GL_ID

union all
select 0, 'Total Revenue',sum(Amount_NU)
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID
where Year_SI = 2007
and BS_Category_VC = 'Rev'

union all
select Journal_T.GL_ID as 'Acct Code',GL_Name_VC as 'Cost of Sales',
 sum(Amount_NU) as 'YTD'
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID
where Year_SI = 2007
and BS_Category_VC
= 'Cos'
GROUP by GL_Name_VC,Journal_T.GL_ID

union all
select 0, 'Total Cost of Sales',sum(Amount_NU) as 'YTD'
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID
where Year_SI = 2007
and BS_Category_VC = 'Cos'

union all
select 0,'Gross Profit',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Rev' then Amount_NU
 else 0 end)+
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Cos' then Amount_NU
 else 0 end)AS 'YTD'
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID

union all
select Journal_T.GL_ID as 'Acct Code', GL_Name_VC as 'Less Other Cost',
sum(Amount_NU) as 'YTD'
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID
where Year_SI = 2007
and BS_Category_VC = 'Otc'
GROUP by Journal_T.GL_ID,GL_Name_VC

union all
select 0, 'Total Other Cost', sum(Amount_NU) as 'YTD'
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID
where Year_SI = 2007
and BS_Category_VC = 'Otc'

union all
select Journal_T.GL_ID as 'Acct Code',GL_Name_VC as 'Add Other Income',
 sum(Amount_NU)as 'YTD'
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID
where Year_SI = 2007
and BS_Category_VC = 'Oic'
GROUP by Journal_T.GL_ID,GL_Name_VC

union all
select 0, 'Total Other Income',sum(Amount_NU) as 'YTD'
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID
where Year_SI = 2007
and BS_Category_VC = 'Oic'

union all
select 0, 'Total Operating Cost/Income',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Otc' then Amount_NU
 else 0 end)+
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Oic' then Amount_NU
 else 0 end)
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID

union all
select 0, 'Profit Before Tax (PBT)',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Rev' then Amount_NU
 else 0 end)+
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Cos' then Amount_NU
 else 0 end)+
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Otc' then Amount_NU
 else 0 end)+
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Oic' then Amount_NU
 else 0 end)
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID

union all
select Journal_T.GL_ID as 'Acct Code',GL_Name_VC as 'Income Tax',
 sum(Amount_NU)as 'YTD'
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID
where Year_SI = 2007
and BS_Category_VC = 'Tax'
GROUP by Journal_T.GL_ID,GL_Name_VC

union all
select 0, 'Profit After Tax (PAT)',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Rev' then Amount_NU
 else 0 end)+
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Cos' then Amount_NU
 else 0 end)+
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Otc' then Amount_NU
 else 0 end)+
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Oic' then Amount_NU
 else 0 end)+
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Tax' then Amount_NU
 else 0 end)
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID
