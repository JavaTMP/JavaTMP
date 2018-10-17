/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  JavaTMP
 * Created: Oct 17, 2018
 */
select 'Cash from Operating Activities :' as 'Cash Flow Statement',
 sum(case when Cash_Type_VC = 'aaa' then Journal_T.Amount_NU else
 0 end) as '$'
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
union all
select 'Cash receipt from Customer',
 sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Deb' and
 Year_SI = 2007 and GL_ID = 2002
 then Journal_T.Amount_NU else 0 end)
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
union all
select 'Cash paid to Supplier',
 sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Sup' and
 Year_SI = 2007 and GL_ID = 2002
 then Journal_T.Amount_NU else 0 end)
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
union all
select 'Cash generated from Operations',
 sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Deb' and
 Year_SI = 2007 and GL_ID = 2002
 then Journal_T.Amount_NU else 0 end) +
 sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Sup' and
 Year_SI = 2007 and GL_ID = 2002
 then Journal_T.Amount_NU else 0 end)
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
union all
select 'Interest paid',
 sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Int' and
 Year_SI = 2007 and GL_ID = 2002
 then Journal_T.Amount_NU else 0 end)
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
union all
select 'Income taxes paid',
 sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Tax' and
 Year_SI = 2007 and GL_ID = 2002
 then Journal_T.Amount_NU else 0 end)
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
union all
select 'Net Cash Outflow from Operating Activities :' ,
 sum(Journal_T.Amount_NU)
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC where
Cash_Type_VC = 'OA' and Cash_Category_VC in
('OA_Deb','OA_Sup','OA_Int','OA_Tax') and Year_SI = 2007 and
GL_ID = 2002
having sum(Journal_T.Amount_NU) < 0
union all
select 'Net Cash Inflow from Operating Activities :' ,
 sum(Journal_T.Amount_NU)
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC where
Cash_Type_VC = 'OA' and Cash_Category_VC in
('OA_Deb','OA_Sup','OA_Int','OA_Tax') and Year_SI = 2007 and
GL_ID = 2002
having sum(Journal_T.Amount_NU) > 0
union all
select 'Cash from Investing Activities :',
 sum(case when Cash_Type_VC = 'aaa' then Journal_T.Amount_NU else
 0 end) as '$'
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
union all
select 'Purchase of PPE',
 sum(case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pur' and
 Year_SI = 2007 and GL_ID = 2002
 then Journal_T.Amount_NU else 0 end)
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
union all
select 'Proceeds from disposal of PPE',
 sum(case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pro' and
 Year_SI = 2007 and GL_ID = 2002
 then Journal_T.Amount_NU else 0 end)
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
union all
select 'Interest received',
 sum(case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Int' and
 Year_SI = 2007 and GL_ID = 2002
 then Journal_T.Amount_NU else 0 end)
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
union all
select 'Net Cash Outflow from Investing Activities :' ,
 sum(Journal_T.Amount_NU)
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC where
Cash_Type_VC = 'IA' and Cash_Category_VC in
('IA_Int','IA_Pur','IA_Pro') and Year_SI = 2007 and GL_ID = 2002
having sum(Journal_T.Amount_NU) < 0
union all
select 'Net Cash Inflow from Investing Activities :' ,
 sum(Journal_T.Amount_NU)
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC where
Cash_Type_VC = 'IA' and Cash_Category_VC in
('IA_Int','IA_Pur','IA_Pro') and Year_SI = 2007 and GL_ID = 2002
having sum(Journal_T.Amount_NU) > 0
union all
select 'Cash from Financing Activities :',
 sum(case when Cash_Type_VC = 'aaa' then Journal_T.Amount_NU else
 0 end) as '$'
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
union all
select 'Proceeds from issue of share capital',
 sum(case when Cash_Type_VC = 'FA' and Cash_Category_VC = 'FA_Cap' and
 Year_SI = 2007 and GL_ID = 2002
 then Journal_T.Amount_NU else 0 end)
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
union all
select 'Net Cash Outflow from Financing Activities :' ,
 sum(Journal_T.Amount_NU)
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC where
Cash_Type_VC = 'FA' and Cash_Category_VC in ('FA_Cap') and Year_SI =
2007 and GL_ID = 2002
having sum(Journal_T.Amount_NU) < 0
union all
select 'Net Cash Inflow from Financing Activities :' ,
 sum(Journal_T.Amount_NU)
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC where
Cash_Type_VC = 'FA' and Cash_Category_VC in ('FA_Cap') and Year_SI =
2007 and GL_ID = 2002
having sum(Journal_T.Amount_NU) > 0
union all
select 'Net Decrease in Cash & Cash equivalent :' ,
 sum(Journal_T.Amount_NU)
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC where
Cash_Type_VC in ('OA','IA','FA') and Year_SI = 2007 and GL_ID = 2002
having sum(Journal_T.Amount_NU) < 0
union all
select 'Net Increase in Cash & Cash equivalent :' ,
 sum(Journal_T.Amount_NU)
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC where
Cash_Type_VC in ('OA','IA','FA') and Year_SI = 2007 and GL_ID = 2002
having sum(Journal_T.Amount_NU) > 0
