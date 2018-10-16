/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  JavaTMP
 * Created: Oct 16, 2018
 */
select Journal_T.GL_ID as 'Acct Code', GL_Name_VC as 'Revenue',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Rev' and
 Segment_VC = 'BU1' then Amount_NU else 0 end) as 'BU1',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Rev' and
 Segment_VC = 'BU2' then Amount_NU else 0 end) as 'BU2',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Rev' and
 Segment_VC = 'BU3' then Amount_NU else 0 end) as 'BU3',
 sum(case when Year_SI = 2007 then Amount_NU else 0 end)
 as 'Year to Date'
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID
where BS_Category_VC = 'Rev'
group by GL_Name_VC,Journal_T.GL_ID

union all
select 0 ,'Total Revenue',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Rev' and
 Segment_VC = 'BU1' then Amount_NU else 0 end) as 'BU1',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Rev' and
 Segment_VC = 'BU2' then Amount_NU else 0 end) as 'BU2',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Rev' and
 Segment_VC = 'BU3' then Amount_NU else 0 end) as 'BU3',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Rev' then
 Amount_NU else 0 end) as 'Year to Date'
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID

union all

select Journal_T.GL_ID as 'Acct Code', GL_Name_VC as 'Cost of Sales',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Cos' and
 Segment_VC = 'BU1' then Amount_NU else 0 end) as 'BU1',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Cos' and
 Segment_VC = 'BU2' then Amount_NU else 0 end) as 'BU2',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Cos' and
 Segment_VC = 'BU3' then Amount_NU else 0 end) as 'BU3',
 sum(case when Year_SI = 2007 then Amount_NU else 0 end)
 as 'Year to Date'
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID
where BS_Category_VC = 'Cos'
group by GL_Name_VC,Journal_T.GL_ID

union all
select 0 ,'Total Cost of Sales',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Cos' and
 Segment_VC = 'BU1' then Amount_NU else 0 end) as 'BU1',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Cos' and
 Segment_VC = 'BU2' then Amount_NU else 0 end) as 'BU2',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Cos' and
 Segment_VC = 'BU3' then Amount_NU else 0 end) as 'BU3',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Cos' then
 Amount_NU else 0 end) as 'Year to Date'
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID

union all
select 0,'Gross Profit',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Rev' and
 Segment_VC = 'BU1' then Amount_NU else 0 end)+
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Cos' and
 Segment_VC = 'BU1' then Amount_NU else 0 end)as 'BU1',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Rev' and
 Segment_VC = 'BU2' then Amount_NU else 0 end)+
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Cos' and
 Segment_VC = 'BU2' then Amount_NU else 0 end)as 'BU2',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Rev' and
 Segment_VC = 'BU3' then Amount_NU else 0 end)+
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Cos' and
 Segment_VC = 'BU3' then Amount_NU else 0 end)as 'BU3',
 sum(case when Year_SI = 2007 and BS_Category_VC in ('Rev','Cos')
 then Amount_NU else 0 end)as 'Year to Date'
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID

union all
select Journal_T.GL_ID as 'Acct Code', GL_Name_VC as 'Less Other Cost',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Otc' and
 Segment_VC = 'BU1' then Amount_NU else 0 end) as 'BU1',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Otc' and
 Segment_VC = 'BU2' then Amount_NU else 0 end) as 'BU2',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Otc' and
 Segment_VC = 'BU3' then Amount_NU else 0 end) as 'BU3',
 sum(case when Year_SI = 2007 then Amount_NU else 0 end)
 as 'Year to Date'
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID
where BS_Category_VC = 'Otc'
group by GL_Name_VC,Journal_T.GL_ID

union all
select 0 ,'Total Other Cost',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Otc' and
 Segment_VC = 'BU1' then Amount_NU else 0 end) as 'BU1',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Otc' and
 Segment_VC = 'BU2' then Amount_NU else 0 end) as 'BU2',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Otc' and
 Segment_VC = 'BU3' then Amount_NU else 0 end) as 'BU3',
 sum(case when Year_SI = 2007 then Amount_NU else 0 end)
 as 'Year to Date'
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID
where BS_Category_VC = 'Otc'

union all
select Journal_T.GL_ID as 'Acct Code', GL_Name_VC
 as 'Add Other Income',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Oic' and
 Segment_VC = 'BU1' then Amount_NU else 0 end) as 'BU1',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Oic' and
 Segment_VC = 'BU2' then Amount_NU else 0 end) as 'BU2',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Oic' and
 Segment_VC = 'BU3' then Amount_NU else 0 end) as 'BU3',
 sum(case when Year_SI = 2007 then Amount_NU else 0 end)
 as 'Year to Date'
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID
where BS_Category_VC = 'Oic'
group by GL_Name_VC,Journal_T.GL_ID

union all
select 0 ,'Total Other Income',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Oic' and
 Segment_VC = 'BU1' then Amount_NU else 0 end) as 'BU1',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Oic' and
 Segment_VC = 'BU2' then Amount_NU else 0 end) as 'BU2',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Oic' and
 Segment_VC = 'BU3' then Amount_NU else 0 end) as 'BU3',
 sum(case when Year_SI = 2007 then Amount_NU else 0 end)
 as 'Year to Date'
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID
where BS_Category_VC = 'Oic'
union all
select 0,'Total Operating Cost/Income',
 sum(case when Year_SI = 2007 and BS_Category_VC in ('Otc','Oic') and
 Segment_VC = 'BU1' then Amount_NU else 0 end),
 sum(case when Year_SI = 2007 and BS_Category_VC in ('Otc','Oic') and
 Segment_VC = 'BU2' then Amount_NU else 0 end),
 sum(case when Year_SI = 2007 and BS_Category_VC in ('Otc','Oic') and
 Segment_VC = 'BU3' then Amount_NU else 0 end),
 sum(case when Year_SI = 2007 and BS_Category_VC in ('Otc','Oic')
 then Amount_NU else 0 end)as 'Year to Date'
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID

union all
select 0, 'Profit Before Tax (PBT)',
 sum(case when Year_SI = 2007 and
 BS_Category_VC in ('Rev','Cos','Otc','Oic') and
 Segment_VC = 'BU1' then Amount_NU else 0 end),
 sum(case when Year_SI = 2007 and
 BS_Category_VC in ('Rev','Cos','Otc','Oic') and
 Segment_VC = 'BU2' then Amount_NU else 0 end),
 sum(case when Year_SI = 2007 and
 BS_Category_VC in ('Rev','Cos','Otc','Oic') and
 Segment_VC = 'BU3' then Amount_NU else 0 end),
 sum(case when Year_SI = 2007 and
 BS_Category_VC in ('Rev','Cos','Otc','Oic')
 then Amount_NU else 0 end)as 'Year to Date'
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID

union all
select Journal_T.GL_ID as 'Acct Code', GL_Name_VC as 'Income Tax',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Tax' and
 Segment_VC = 'BU1' then Amount_NU else 0 end) as 'BU1',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Tax' and
 Segment_VC = 'BU2' then Amount_NU else 0 end) as 'BU2',
 sum(case when Year_SI = 2007 and BS_Category_VC = 'Tax' and
 Segment_VC = 'BU3' then Amount_NU else 0 end) as 'BU3',
 sum(case when Year_SI = 2007 then Amount_NU else 0 end)
 as 'Year to Date'
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID
where BS_Category_VC = 'Tax'
group by GL_Name_VC,Journal_T.GL_ID

union all
select 0, 'Profit After Tax (PAT)',
 sum(case when Year_SI = 2007 and
 BS_Category_VC in ('Rev','Cos','Otc','Oic','Tax') and
 Segment_VC = 'BU1' then Amount_NU else 0 end),
 sum(case when Year_SI = 2007 and
 BS_Category_VC in ('Rev','Cos','Otc','Oic','Tax') and
 Segment_VC = 'BU2' then Amount_NU else 0 end),
 sum(case when Year_SI = 2007 and
 BS_Category_VC in ('Rev','Cos','Otc','Oic','Tax') and
 Segment_VC = 'BU3' then Amount_NU else 0 end),
 sum(case when Year_SI = 2007 and
 BS_Category_VC in ('Rev','Cos','Otc','Oic','Tax')
 then Amount_NU else 0 end)as 'Year to Date'
from Journal_T join COA_T
on Journal_T.GL_ID = COA_T.GL_ID