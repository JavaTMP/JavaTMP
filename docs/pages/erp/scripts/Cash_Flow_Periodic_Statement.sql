/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  JavaTMP
 * Created: Oct 17, 2018
 */
select 'Cash from Operating Activities :' as 'Cash Flow',
 sum(case when Cash_Type_VC = 'aaa' then Journal_T.Amount_NU else
 0 end) as 'Period 01',
 sum(case when Cash_Type_VC = 'aaa' then Journal_T.Amount_NU else
 0 end) as 'Period 02',
 sum(case when Cash_Type_VC = 'aaa' then Journal_T.Amount_NU else
 0 end) as 'Period 03',
 sum(case when Cash_Type_VC = 'aaa' then Journal_T.Amount_NU else
 0 end) as 'Period 04',
 sum(case when Cash_Type_VC = 'aaa' then Journal_T.Amount_NU else
 0 end) as 'Period 05',
 sum(case when Cash_Type_VC = 'aaa' then Journal_T.Amount_NU else
 0 end) as 'Period 06',
sum(case when Cash_Type_VC = 'aaa' then Journal_T.Amount_NU else 0 end)
 as 'Period 07',
 sum(case when Cash_Type_VC = 'aaa' then Journal_T.Amount_NU else
 0 end) as 'Period 08',
 sum(case when Cash_Type_VC = 'aaa' then Journal_T.Amount_NU else
 0 end) as 'Period 09',
 sum(case when Cash_Type_VC = 'aaa' then Journal_T.Amount_NU else
 0 end) as 'Period 10',
 sum(case when Cash_Type_VC = 'aaa' then Journal_T.Amount_NU else
 0 end) as 'Period 11',
 sum(case when Cash_Type_VC = 'aaa' then Journal_T.Amount_NU else
 0 end) as 'Period 12',
 sum(case when Cash_Type_VC = 'aaa' then Journal_T.Amount_NU else
 0 end) as 'YTD'
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
union all
select Descrip_VC,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Deb' and
 Period_TI = 1 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Deb' and
 Period_TI = 2 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Deb' and
 Period_TI = 3 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Deb' and
 Period_TI = 4 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Deb' and
 Period_TI = 5 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Deb' and
 Period_TI = 6 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Deb' and
 Period_TI = 7 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Deb' and
 Period_TI = 8 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Deb' and
 Period_TI = 9 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Deb' and
 Period_TI = 10 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Deb' and

 Period_TI = 11 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Deb' and
 Period_TI = 12 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Deb' and
 Year_SI = 2007 then Journal_T.Amount_NU else 0 end
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
where Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Deb' and Year_SI =
2007 and GL_ID = 2002

union all
select Descrip_VC,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Sup' and
 Period_TI = 1 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Sup' and
 Period_TI = 2 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Sup' and
 Period_TI = 3 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Sup' and
 Period_TI = 4 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Sup' and
 Period_TI = 5 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Sup' and
 Period_TI = 6 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Sup' and
 Period_TI = 7 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Sup' and
 Period_TI = 8 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Sup' and
 Period_TI = 9 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Sup' and
 Period_TI = 10 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Sup' and
 Period_TI = 11 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Sup' and
 Period_TI = 12 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Sup' and
 Year_SI = 2007 then Journal_T.Amount_NU else 0 end
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
where Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Sup' and Year_SI =
2007 and GL_ID = 2002
union all
select 'Cash generated from Operations',
 sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC in
 ('OA_Deb','OA_Sup')and Period_TI = 1 and Year_SI = 2007 and
 GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC in
 ('OA_Deb','OA_Sup')and Period_TI = 2 and Year_SI = 2007 and
 GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC in
 ('OA_Deb','OA_Sup')and Period_TI = 3 and Year_SI = 2007 and
 GL_ID = 2002 then Journal_T.Amount_NU else 0 end),

 sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC in
 ('OA_Deb','OA_Sup')and Period_TI = 4 and Year_SI = 2007 and
 GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC in
 ('OA_Deb','OA_Sup')and Period_TI = 5 and Year_SI = 2007 and
 GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC in
 ('OA_Deb','OA_Sup')and Period_TI = 6 and Year_SI = 2007 and
 GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC in
 ('OA_Deb','OA_Sup')and Period_TI = 7 and Year_SI = 2007 and
 GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC in
 ('OA_Deb','OA_Sup')and Period_TI = 8 and Year_SI = 2007 and
 GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC in
 ('OA_Deb','OA_Sup')and Period_TI = 9 and Year_SI = 2007 and
 GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC in
 ('OA_Deb','OA_Sup')and Period_TI = 10 and Year_SI = 2007 and
 GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC in
 ('OA_Deb','OA_Sup')and Period_TI = 11 and Year_SI = 2007 and
 GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC in
 ('OA_Deb','OA_Sup')and Period_TI = 12 and Year_SI = 2007 and
 GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC in
 ('OA_Deb','OA_Sup')and Year_SI = 2007 and GL_ID = 2002
 then Journal_T.Amount_NU else 0 end)
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC

union all
select Descrip_VC,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Int' and
 Period_TI = 1 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Int' and
 Period_TI = 2 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Int' and
 Period_TI = 3 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Int' and
 Period_TI = 4 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Int' and
 Period_TI = 5 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Int' and
 Period_TI = 6 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Int' and
 Period_TI = 7 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Int' and
 Period_TI = 8 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Int' and
 Period_TI = 9 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Int' and

 Period_TI = 10 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Int' and
 Period_TI = 11 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Int' and
 Period_TI = 12 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Int' and
 Year_SI = 2007 then Journal_T.Amount_NU else 0 end
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
where Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Int' and
Year_SI = 2007 and GL_ID = 2002
union all
select Descrip_VC,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Tax' and
 Period_TI = 1 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Tax' and
 Period_TI = 2 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Tax' and
 Period_TI = 3 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Tax' and
 Period_TI = 4 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Tax' and
 Period_TI = 5 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Tax' and
 Period_TI = 6 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Tax' and
 Period_TI = 7 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Tax' and
 Period_TI = 8 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Tax' and
 Period_TI = 9 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Tax' and
 Period_TI = 10 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Tax' and
 Period_TI = 11 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Tax' and
 Period_TI = 12 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Tax' and
 Year_SI = 2007 then Journal_T.Amount_NU else 0 end
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
where Cash_Type_VC = 'OA' and Cash_Category_VC = 'OA_Tax' and Year_SI =
2007 and GL_ID = 2002
union all
select 'Net Cash Flow from Operating Activities',
 sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC in
 ('OA_Deb','OA_Sup','OA_Int','OA_Tax')and Period_TI = 1 and
 Year_SI = 2007 and GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC in
 ('OA_Deb','OA_Sup','OA_Int','OA_Tax')and Period_TI = 2 and
 Year_SI = 2007 and GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC in
 ('OA_Deb','OA_Sup','OA_Int','OA_Tax')and Period_TI = 3 and
 Year_SI = 2007 and GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC in
 ('OA_Deb','OA_Sup','OA_Int','OA_Tax')and Period_TI = 4 and
 Year_SI = 2007 and GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC in
('OA_Deb','OA_Sup','OA_Int','OA_Tax')and Period_TI = 5 and
Year_SI = 2007 and GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC in
('OA_Deb','OA_Sup','OA_Int','OA_Tax')and Period_TI = 6 and
Year_SI = 2007 and GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC in
('OA_Deb','OA_Sup','OA_Int','OA_Tax')and Period_TI = 7 and
Year_SI = 2007 and GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC in
('OA_Deb','OA_Sup','OA_Int','OA_Tax')and Period_TI = 8 and
Year_SI = 2007 and GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC in
('OA_Deb','OA_Sup','OA_Int','OA_Tax')and Period_TI = 9 and
Year_SI = 2007 and GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC in
('OA_Deb','OA_Sup','OA_Int','OA_Tax')and Period_TI = 10 and
Year_SI = 2007 and GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC in
('OA_Deb','OA_Sup','OA_Int','OA_Tax')and Period_TI = 11 and
Year_SI = 2007 and GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC in
('OA_Deb','OA_Sup','OA_Int','OA_Tax')and Period_TI = 12 and
Year_SI = 2007 and GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
sum(case when Cash_Type_VC = 'OA' and Cash_Category_VC in
('OA_Deb','OA_Sup','OA_Int','OA_Tax')and Year_SI = 2007 and
GL_ID = 2002 then Journal_T.Amount_NU else 0 end)
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
union all
select 'Cash from Investing Activities :' as 'Cash Flow',
 sum(case when Cash_Type_VC = 'aaa' then
 Amount_NU else 0 end) as 'Period 01',
 sum(case when Cash_Type_VC = 'aaa' then
 Amount_NU else 0 end) as 'Period 02',
 sum(case when Cash_Type_VC = 'aaa' then
 Amount_NU else 0 end) as 'Period 03',
 sum(case when Cash_Type_VC = 'aaa' then
 Amount_NU else 0 end) as 'Period 04',
 sum(case when Cash_Type_VC = 'aaa' then
 Amount_NU else 0 end) as 'Period 05',
 sum(case when Cash_Type_VC = 'aaa' then
 Amount_NU else 0 end) as 'Period 06',
 sum(case when Cash_Type_VC = 'aaa' then
 Amount_NU else 0 end) as 'Period 07',
 sum(case when Cash_Type_VC = 'aaa' then
 Amount_NU else 0 end) as 'Period 08',
 sum(case when Cash_Type_VC = 'aaa' then
 Amount_NU else 0 end) as 'Period 09',

 sum(case when Cash_Type_VC = 'aaa' then
 Amount_NU else 0 end) as 'Period 10',
 sum(case when Cash_Type_VC = 'aaa' then
 Amount_NU else 0 end) as 'Period 11',
 sum(case when Cash_Type_VC = 'aaa' then
 Amount_NU else 0 end) as 'Period 12',
 sum(case when Cash_Type_VC = 'aaa' then
 Amount_NU else 0 end) as 'YTD'
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
union all

select Descrip_VC,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pur' and
 Period_TI = 1 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pur' and
 Period_TI = 2 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pur' and
 Period_TI = 3 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pur' and
 Period_TI = 4 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pur' and
 Period_TI = 5 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pur' and
 Period_TI = 6 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pur' and
 Period_TI = 7 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pur' and
 Period_TI = 8 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pur' and
 Period_TI = 9 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pur' and
 Period_TI = 10 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pur' and
 Period_TI = 11 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pur' and
 Period_TI = 12 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pur' and
 Year_SI = 2007 then Journal_T.Amount_NU else 0 end
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
where Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pur' and Year_SI =
2007 and GL_ID = 2002
union all

select Descrip_VC,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pro' and
 Period_TI = 1 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pro' and
 Period_TI = 2 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pro' and
 Period_TI = 3 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pro' and

 Period_TI = 4 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pro' and
 Period_TI = 5 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pro' and
 Period_TI = 6 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pro' and
 Period_TI = 7 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pro' and
 Period_TI = 8 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pro' and
 Period_TI = 9 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pro' and
 Period_TI = 10 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pro' and
 Period_TI = 11 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pro' and
 Period_TI = 12 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pro' and
 Year_SI = 2007 then Journal_T.Amount_NU else 0 end
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
where Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Pro' and Year_SI =
2007 and GL_ID = 2002

union all
select Descrip_VC,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Int' and
 Period_TI = 1 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Int' and
 Period_TI = 2 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Int' and
 Period_TI = 3 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Int' and
 Period_TI = 4 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Int' and
 Period_TI = 5 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Int' and
 Period_TI = 6 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Int' and
 Period_TI = 7 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Int' and
 Period_TI = 8 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Int' and
 Period_TI = 9 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Int' and
 Period_TI = 10 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Int' and
 Period_TI = 11 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Int' and
 Period_TI = 12 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Int' and
 Year_SI = 2007 then Journal_T.Amount_NU else 0 end

from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
where Cash_Type_VC = 'IA' and Cash_Category_VC = 'IA_Int' and Year_SI =
2007 and GL_ID = 2002
union all
select 'Net Cash Flow from Investing Activities',
 sum(case when Cash_Type_VC = 'IA' and Cash_Category_VC in
 ('IA_Pur','IA_Pro','IA_Int')and Period_TI = 1 and Year_SI = 2007 and
 GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'IA' and Cash_Category_VC in
 ('IA_Pur','IA_Pro','IA_Int')and Period_TI = 2 and Year_SI = 2007 and
 GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'IA' and Cash_Category_VC in
 ('IA_Pur','IA_Pro','IA_Int')and Period_TI = 3 and Year_SI = 2007 and
 GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'IA' and Cash_Category_VC in
 ('IA_Pur','IA_Pro','IA_Int')and Period_TI = 4 and Year_SI = 2007 and
 GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'IA' and Cash_Category_VC in
 ('IA_Pur','IA_Pro','IA_Int')and Period_TI = 5 and Year_SI = 2007 and
 GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'IA' and Cash_Category_VC in
 ('IA_Pur','IA_Pro','IA_Int')and Period_TI = 6 and Year_SI = 2007 and
 GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'IA' and Cash_Category_VC in
 ('IA_Pur','IA_Pro','IA_Int')and Period_TI = 7 and Year_SI = 2007 and
 GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'IA' and Cash_Category_VC in
 ('IA_Pur','IA_Pro','IA_Int')and Period_TI = 8 and Year_SI = 2007 and
 GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'IA' and Cash_Category_VC in
 ('IA_Pur','IA_Pro','IA_Int')and Period_TI = 9 and Year_SI = 2007 and
 GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'IA' and Cash_Category_VC in
 ('IA_Pur','IA_Pro','IA_Int')and Period_TI = 10 and Year_SI = 2007 and
 GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'IA' and Cash_Category_VC in
 ('IA_Pur','IA_Pro','IA_Int')and Period_TI = 11 and Year_SI = 2007 and
 GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'IA' and Cash_Category_VC in
 ('IA_Pur','IA_Pro','IA_Int')and Period_TI = 12 and Year_SI = 2007 and
 GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'IA' and Cash_Category_VC in
 ('IA_Pur','IA_Pro','IA_Int')and Year_SI = 2007 and GL_ID = 2002
 then Journal_T.Amount_NU else 0 end)
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
union all
select 'Cash from Financing Activities :' as 'Cash Flow',
 sum(case when Cash_Type_VC = 'aaa' then
 Amount_NU else 0 end) as 'Period 01',
 sum(case when Cash_Type_VC = 'aaa' then
 Amount_NU else 0 end) as 'Period 02',
 sum(case when Cash_Type_VC = 'aaa' then
 Amount_NU else 0 end) as 'Period 03',
 sum(case when Cash_Type_VC = 'aaa' then
 Amount_NU else 0 end) as 'Period 04',
 sum(case when Cash_Type_VC = 'aaa' then
 Amount_NU else 0 end) as 'Period 05',
 sum(case when Cash_Type_VC = 'aaa' then
 Amount_NU else 0 end) as 'Period 06',
 sum(case when Cash_Type_VC = 'aaa' then
 Amount_NU else 0 end) as 'Period 07',
 sum(case when Cash_Type_VC = 'aaa' then
 Amount_NU else 0 end) as 'Period 08',
 sum(case when Cash_Type_VC = 'aaa' then
 Amount_NU else 0 end) as 'Period 09',
 sum(case when Cash_Type_VC = 'aaa' then
 Amount_NU else 0 end) as 'Period 10',
 sum(case when Cash_Type_VC = 'aaa' then
 Amount_NU else 0 end) as 'Period 11',
 sum(case when Cash_Type_VC = 'aaa' then
 Amount_NU else 0 end) as 'Period 12',
 sum(case when Cash_Type_VC = 'aaa' then
 Amount_NU else 0 end) as 'YTD'
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
union all
select Descrip_VC,
 case when Cash_Type_VC = 'FA' and Cash_Category_VC = 'FA_Cap' and
 Period_TI = 1 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'FA' and Cash_Category_VC = 'FA_Cap' and
 Period_TI = 2 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'FA' and Cash_Category_VC = 'FA_Cap' and
 Period_TI = 3 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'FA' and Cash_Category_VC = 'FA_Cap' and
 Period_TI = 4 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'FA' and Cash_Category_VC = 'FA_Cap' and
 Period_TI = 5 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'FA' and Cash_Category_VC = 'FA_Cap' and
 Period_TI = 6 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'FA' and Cash_Category_VC = 'FA_Cap' and
 Period_TI = 7 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'FA' and Cash_Category_VC = 'FA_Cap' and
 Period_TI = 8 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'FA' and Cash_Category_VC = 'FA_Cap' and
 Period_TI = 9 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'FA' and Cash_Category_VC = 'FA_Cap' and
 Period_TI = 10 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'FA' and Cash_Category_VC = 'FA_Cap' and
 Period_TI = 11 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,

 case when Cash_Type_VC = 'FA' and Cash_Category_VC = 'FA_Cap' and
 Period_TI = 12 and Year_SI = 2007 then Journal_T.Amount_NU else 0 end,
 case when Cash_Type_VC = 'FA' and Cash_Category_VC = 'FA_Cap' and
 Year_SI = 2007 then Journal_T.Amount_NU else 0 end
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
where Cash_Type_VC = 'FA' and Cash_Category_VC = 'FA_Cap' and Year_SI =
2007 and GL_ID = 2002
union all
select 'Net Cash Flow from Financing Activities',
 sum(case when Cash_Type_VC = 'FA' and Cash_Category_VC in
 ('FA_Cap')and Period_TI = 1 and Year_SI = 2007 and GL_ID = 2002
 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'FA' and Cash_Category_VC in
 ('FA_Cap')and Period_TI = 2 and Year_SI = 2007 and GL_ID = 2002
 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'FA' and Cash_Category_VC in
 ('FA_Cap')and Period_TI = 3 and Year_SI = 2007 and GL_ID = 2002
 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'FA' and Cash_Category_VC in
 ('FA_Cap')and Period_TI = 4 and Year_SI = 2007 and GL_ID = 2002
 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'FA' and Cash_Category_VC in
 ('FA_Cap')and Period_TI = 5 and Year_SI = 2007 and GL_ID = 2002
 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'FA' and Cash_Category_VC in
 ('FA_Cap')and Period_TI = 6 and Year_SI = 2007 and GL_ID = 2002
 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'FA' and Cash_Category_VC in
 ('FA_Cap')and Period_TI = 7 and Year_SI = 2007 and GL_ID = 2002
 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'FA' and Cash_Category_VC in
 ('FA_Cap')and Period_TI = 8 and Year_SI = 2007 and GL_ID = 2002
 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'FA' and Cash_Category_VC in
 ('FA_Cap')and Period_TI = 9 and Year_SI = 2007 and GL_ID = 2002
 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'FA' and Cash_Category_VC in
 ('FA_Cap')and Period_TI = 10 and Year_SI = 2007 and GL_ID = 2002
 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'FA' and Cash_Category_VC in
 ('FA_Cap')and Period_TI = 11 and Year_SI = 2007 and GL_ID = 2002
 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'FA' and Cash_Category_VC in
 ('FA_Cap')and Period_TI = 12 and Year_SI = 2007 and GL_ID = 2002
 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC = 'FA' and Cash_Category_VC in
 ('FA_Cap')and Year_SI = 2007 and GL_ID = 2002
 then Journal_T.Amount_NU else 0 end)
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
union all
select 'Net Increase/(Decrease) in Cash & Cash equivalent',
 sum(case when Cash_Type_VC in ('OA','IA','FA') and Period_TI = 1 and
 Year_SI = 2007 and GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC in ('OA','IA','FA') and Period_TI = 2 and
 Year_SI = 2007 and GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC in ('OA','IA','FA') and Period_TI = 3 and
 Year_SI = 2007 and GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC in ('OA','IA','FA') and Period_TI = 4 and
 Year_SI = 2007 and GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC in ('OA','IA','FA') and Period_TI = 5 and
 Year_SI = 2007 and GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC in ('OA','IA','FA') and Period_TI = 6 and
 Year_SI = 2007 and GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC in ('OA','IA','FA') and Period_TI = 7 and
 Year_SI = 2007 and GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC in ('OA','IA','FA') and Period_TI = 8 and
 Year_SI = 2007 and GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC in ('OA','IA','FA') and Period_TI = 9 and
 Year_SI = 2007 and GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC in ('OA','IA','FA') and Period_TI = 10 and
 Year_SI = 2007 and GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC in ('OA','IA','FA') and Period_TI = 11 and
 Year_SI = 2007 and GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC in ('OA','IA','FA') and Period_TI = 12 and
 Year_SI = 2007 and GL_ID = 2002 then Journal_T.Amount_NU else 0 end),
 sum(case when Cash_Type_VC in ('OA','IA','FA')and Year_SI = 2007 and
 GL_ID = 2002 then Journal_T.Amount_NU else 0 end)
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC












