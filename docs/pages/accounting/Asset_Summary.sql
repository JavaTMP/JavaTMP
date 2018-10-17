/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  JavaTMP
 * Created: Oct 17, 2018
 */
select 'Opening Balance' as 'Cost',
 sum(case when FA_ID_IN = 100 and Descrip_VC in
 ('Purchase CompEquip','CE DispCost')
 and Year_SI < 2007 and GL_ID = 1000 and FA_Category_VC in
 ('Cost','DispCost')then Amount_NU else 0 end) as 'CE',
 sum(case when FA_ID_IN = 101 and Descrip_VC in
 ('Purchase OfficeEquip','OE DispCost')
 and Year_SI < 2007 and GL_ID = 1000 and FA_Category_VC in
 ('Cost','DispCost')then Amount_NU else 0 end) as 'OE',
 sum(case when FA_ID_IN = 102 and Descrip_VC in ('Purchase
 Furniture','FF DispCost')
 and Year_SI < 2007 and GL_ID = 1000 and FA_Category_VC in
 ('Cost','DispCost')then Amount_NU else 0 end) as 'FF',
 sum(case when FA_ID_IN = 100 and Descrip_VC in
 ('Purchase CompEquip','CE DispCost')and Year_SI < 2007 and
 GL_ID = 1000 and FA_Category_VC in ('Cost','DispCost')
 then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 101 and Descrip_VC in
 ('Purchase OfficeEquip','OE DispCost')
 and Year_SI < 2007 and GL_ID = 1000 and FA_Category_VC in
 ('Cost','DispCost')then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 102 and Descrip_VC in
 ('Purchase Furniture','FF DispCost')
 and Year_SI < 2007 and GL_ID = 1000 and FA_Category_VC in
 ('Cost','DispCost')then Amount_NU else 0 end) as 'Total'
from FixedAsset_T join Journal_T on
FixedAsset_T.Doc_No_VC = Journal_T.Doc_No_VC
union all

select 'Addition' as 'Description',
 sum(case when FA_ID_IN = 100 and Descrip_VC in ('Purchase CompEquip')
 and Year_SI = 2007 and GL_ID = 1000 and FA_Category_VC in ('Cost')
 then Amount_NU else 0 end) as 'CE',
 sum(case when FA_ID_IN = 101 and Descrip_VC in
 ('Purchase OfficeEquip')and Year_SI = 2007 and GL_ID = 1000 and
 FA_Category_VC in ('Cost')then Amount_NU else 0 end) as 'OE',
 sum(case when FA_ID_IN = 102 and Descrip_VC in ('Purchase Furniture')
 and Year_SI = 2007 and GL_ID = 1000 and FA_Category_VC in ('Cost')
 then Amount_NU else 0 end) as 'FF',
 sum(case when FA_ID_IN = 100 and Descrip_VC in ('Purchase CompEquip')
 and Year_SI = 2007 and GL_ID = 1000 and FA_Category_VC in ('Cost')
 then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 101 and Descrip_VC in
 ('Purchase OfficeEquip')and Year_SI = 2007 and GL_ID = 1000 and
 FA_Category_VC in ('Cost') then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 102 and Descrip_VC in ('Purchase Furniture')
 and Year_SI = 2007 and GL_ID = 1000 and FA_Category_VC in ('Cost')
 then Amount_NU else 0 end)
from FixedAsset_T join Journal_T on
FixedAsset_T.Doc_No_VC = Journal_T.Doc_No_VC

union all
select 'Disposal' as 'Description',
 sum(case when FA_ID_IN = 100 and Descrip_VC in ('CE DispCost')
 and Year_SI = 2007 and GL_ID = 1000 and FA_Category_VC in ('DispCost')
 then Amount_NU else 0 end) as 'CE',
 sum(case when FA_ID_IN = 101 and Descrip_VC in ('OE DispCost')
 and Year_SI = 2007 and GL_ID = 1000 and FA_Category_VC in ('DispCost')
 then Amount_NU else 0 end) as 'OE',
 sum(case when FA_ID_IN = 102 and Descrip_VC in ('FF DispCost')
 and Year_SI = 2007 and GL_ID = 1000 and FA_Category_VC in ('DispCost')
 then Amount_NU else 0 end) as 'FF',
 sum(case when FA_ID_IN = 100 and Descrip_VC in ('CE DispCost')
 and Year_SI = 2007 and GL_ID = 1000 and FA_Category_VC in ('DispCost')
 then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 101 and Descrip_VC in ('OE DispCost')
 and Year_SI = 2007 and GL_ID = 1000 and FA_Category_VC in ('DispCost')
 then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 102 and Descrip_VC in ('FF DispCost')
 and Year_SI = 2007 and GL_ID = 1000 and FA_Category_VC in ('DispCost')
 then Amount_NU else 0 end)
from FixedAsset_T join Journal_T on
FixedAsset_T.Doc_No_VC = Journal_T.Doc_No_VC

union all
select 'Closing Balance',
 sum(case when FA_ID_IN = 100 and Descrip_VC in
 ('Purchase CompEquip','CE DispCost')
 and Year_SI < 2007 and GL_ID = 1000 and FA_Category_VC in
 ('Cost','DispCost')then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 100 and Descrip_VC in
 ('Purchase CompEquip','CE DispCost')and Year_SI = 2007 and
 GL_ID = 1000 and FA_Category_VC in ('Cost','DispCost')
 then Amount_NU else 0 end) as 'CE',
 sum(case when FA_ID_IN = 101 and Descrip_VC in
 ('Purchase OfficeEquip','OE DispCost')
 and Year_SI < 2007 and GL_ID = 1000 and FA_Category_VC in
 ('Cost','DispCost')then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 101 and Descrip_VC in ('Purchase
 OfficeEquip','OE DispCost')and Year_SI = 2007 and GL_ID = 1000 and
 FA_Category_VC in ('Cost','DispCost')then
 Amount_NU else 0 end) as 'OE',
 sum(case when FA_ID_IN = 102 and Descrip_VC in
 ('Purchase Furniture','FF DispCost')and Year_SI < 2007 and
 GL_ID = 1000 and FA_Category_VC in ('Cost','DispCost')
 then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 102 and Descrip_VC in
 ('Purchase Furniture','FF DispCost')and Year_SI = 2007 and
 GL_ID = 1000 and FA_Category_VC in ('Cost','DispCost')
 then Amount_NU else 0 end) as 'FF',
 sum(case when FA_ID_IN = 100 and Descrip_VC in
 ('Purchase CompEquip','CE DispCost')and Year_SI < 2007 and
 GL_ID = 1000 and FA_Category_VC in ('Cost','DispCost')
 then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 101 and Descrip_VC in

('Purchase OfficeEquip','OE DispCost')and Year_SI < 2007 and GL_ID =
 1000 and FA_Category_VC in ('Cost','DispCost')
 then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 102 and Descrip_VC in
 ('Purchase Furniture','FF DispCost')and Year_SI < 2007 and GL_ID =
 1000 and FA_Category_VC in ('Cost','DispCost')
 then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 100 and Descrip_VC in
 ('Purchase CompEquip','CE DispCost')and Year_SI = 2007 and GL_ID =
 1000 and FA_Category_VC in ('Cost','DispCost')
 then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 101 and Descrip_VC in
 ('Purchase OfficeEquip','OE DispCost')and Year_SI = 2007 and GL_ID =
 1000 and FA_Category_VC in ('Cost','DispCost')
 then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 102 and Descrip_VC in
 ('Purchase Furniture','FF DispCost')and Year_SI = 2007 and
 GL_ID = 1000 and FA_Category_VC in ('Cost','DispCost')
 then Amount_NU else 0 end) as 'Total'
from FixedAsset_T join Journal_T on
FixedAsset_T.Doc_No_VC = Journal_T.Doc_No_VC

union all
select 'Opening Balance' as 'Acc Deprn',
 sum(case when FA_ID_IN = 100 and Descrip_VC in
 ('CE Deprn','CE DispDeprn')
 and Year_SI < 2007 and GL_ID = 1001 and FA_Category_VC in
 ('Deprn','DispDeprn')then Amount_NU else 0 end) as 'CE',
 sum(case when FA_ID_IN = 101 and Descrip_VC in
 ('OE Deprn','OE DispDeprn')
 and Year_SI < 2007 and GL_ID = 1001 and FA_Category_VC in
 ('Deprn','DispDeprn')then Amount_NU else 0 end) as 'OE',
 sum(case when FA_ID_IN = 102 and Descrip_VC in
 ('FF Deprn','FF DispDeprn')
 and Year_SI < 2007 and GL_ID = 1001 and FA_Category_VC in
 ('Deprn','DispDeprn')then Amount_NU else 0 end) as 'FF',
 sum(case when FA_ID_IN = 100 and Descrip_VC in
 ('CE Deprn','CE DispDeprn')
 and Year_SI < 2007 and GL_ID = 1001 and FA_Category_VC in
 ('Deprn','DispDeprn')then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 101 and Descrip_VC in
 ('OE Deprn','OE DispDeprn')
 and Year_SI < 2007 and GL_ID = 1001 and FA_Category_VC in
 ('Deprn','DispDeprn')then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 102 and Descrip_VC in
 ('FF Deprn','FF DispDeprn')
 and Year_SI < 2007 and GL_ID = 1001 and FA_Category_VC in
 ('Deprn','DispDeprn')then Amount_NU else 0 end) as 'Total'
from FixedAsset_T join Journal_T on
FixedAsset_T.Doc_No_VC = Journal_T.Doc_No_VC
union all

select 'Addition' as 'Description',
 sum(case when FA_ID_IN = 100 and Descrip_VC in ('CE Deprn')
 and Year_SI = 2007 and GL_ID = 1001 and FA_Category_VC in ('Deprn')
 then Amount_NU else 0 end) as 'CE',

sum(case when FA_ID_IN = 101 and Descrip_VC in ('OE Deprn')
 and Year_SI = 2007 and GL_ID = 1001 and FA_Category_VC in ('Deprn')
 then Amount_NU else 0 end) as 'OE',
 sum(case when FA_ID_IN = 102 and Descrip_VC in ('FF Deprn')
 and Year_SI = 2007 and GL_ID = 1001 and FA_Category_VC in ('Deprn')
 then Amount_NU else 0 end) as 'FF',
 sum(case when FA_ID_IN = 100 and Descrip_VC in ('CE Deprn')
 and Year_SI = 2007 and GL_ID = 1001 and FA_Category_VC in ('Deprn')
 then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 101 and Descrip_VC in ('OE Deprn')
 and Year_SI = 2007 and GL_ID = 1001 and FA_Category_VC in ('Deprn')
 then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 102 and Descrip_VC in ('FF Deprn')
 and Year_SI = 2007 and GL_ID = 1001 and FA_Category_VC in ('Deprn')
 then Amount_NU else 0 end)
from FixedAsset_T join Journal_T on
FixedAsset_T.Doc_No_VC = Journal_T.Doc_No_VC
union all

select 'Disposal' as 'Description',
 sum(case when FA_ID_IN = 100 and Descrip_VC in ('CE DispDeprn')
 and Year_SI = 2007 and GL_ID = 1001 and FA_Category_VC in
 ('DispDeprn')then Amount_NU else 0 end) as 'CE',
 sum(case when FA_ID_IN = 101 and Descrip_VC in ('OE DispDeprn')
 and Year_SI = 2007 and GL_ID = 1001 and FA_Category_VC in
 ('DispDeprn')then Amount_NU else 0 end) as 'OE',
 sum(case when FA_ID_IN = 102 and Descrip_VC in ('FF DispDeprn')
 and Year_SI = 2007 and GL_ID = 1001 and FA_Category_VC in
 ('DispDeprn')then Amount_NU else 0 end) as 'FF',
 sum(case when FA_ID_IN = 100 and Descrip_VC in ('CE DispDeprn')
 and Year_SI = 2007 and GL_ID = 1001 and FA_Category_VC in
 ('DispDeprn')then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 101 and Descrip_VC in ('OE DispDeprn')
 and Year_SI = 2007 and GL_ID = 1001 and FA_Category_VC in
 ('DispDeprn')then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 102 and Descrip_VC in ('FF DispDeprn')
 and Year_SI = 2007 and GL_ID = 1001 and FA_Category_VC in
 ('DispDeprn')then Amount_NU else 0 end)
from FixedAsset_T join Journal_T on
FixedAsset_T.Doc_No_VC = Journal_T.Doc_No_VC

union all
select 'Closing Balance',
 sum(case when FA_ID_IN = 100 and Descrip_VC in
 ('CE Deprn','CE DispDeprn')
 and Year_SI < 2007 and GL_ID = 1001 and FA_Category_VC in
 ('Deprn','DispDeprn')then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 100 and Descrip_VC in
 ('CE Deprn','CE DispDeprn')
 and Year_SI = 2007 and GL_ID = 1001 and FA_Category_VC in
 ('Deprn','DispDeprn')then Amount_NU else 0 end) as 'CE',
 sum(case when FA_ID_IN = 101 and Descrip_VC in
 ('OE Deprn','OE DispDeprn')and Year_SI < 2007 and GL_ID = 1001 and
 FA_Category_VC in ('Deprn','DispDeprn')then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 101 and Descrip_VC in
 ('OE Deprn','OE DispDeprn')
 and Year_SI = 2007 and GL_ID = 1001 and FA_Category_VC in
 ('Deprn','DispDeprn')then Amount_NU else 0 end) as 'OE',
 sum(case when FA_ID_IN = 102 and Descrip_VC in
 ('FF Deprn','FF DispDeprn')
 and Year_SI < 2007 and GL_ID = 1001 and FA_Category_VC in
 ('Deprn','DispDeprn')then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 102 and Descrip_VC in
 ('FF Deprn','FF DispDeprn')
 and Year_SI = 2007 and GL_ID = 1001 and FA_Category_VC in
 ('Deprn','DispDeprn')then Amount_NU else 0 end) as 'FF',
 sum(case when FA_ID_IN = 100 and Descrip_VC in
 ('CE Deprn','CE DispDeprn')
 and Year_SI < 2007 and GL_ID = 1001 and FA_Category_VC in
 ('Deprn','DispDeprn')then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 101 and Descrip_VC in
 ('OE Deprn','OE DispDeprn')
 and Year_SI < 2007 and GL_ID = 1001 and FA_Category_VC in
 ('Deprn','DispDeprn')then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 102 and Descrip_VC in
 ('FF Deprn','FF DispDeprn')
 and Year_SI < 2007 and GL_ID = 1001 and FA_Category_VC in
 ('Deprn','DispDeprn')then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 100 and Descrip_VC in
 ('CE Deprn','CE DispDeprn')
 and Year_SI = 2007 and GL_ID = 1001 and FA_Category_VC in
 ('Deprn','DispDeprn')then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 101 and Descrip_VC in
 ('OE Deprn','OE DispDeprn')
 and Year_SI = 2007 and GL_ID = 1001 and FA_Category_VC in
 ('Deprn','DispDeprn')then Amount_NU else 0 end) +
 sum(case when FA_ID_IN = 102 and Descrip_VC in
 ('FF Deprn','FF DispDeprn')
 and Year_SI = 2007 and GL_ID = 1001 and FA_Category_VC in
 ('Deprn','DispDeprn')then Amount_NU else 0 end) as 'Total'
from FixedAsset_T join Journal_T on
FixedAsset_T.Doc_No_VC = Journal_T.Doc_No_VC









