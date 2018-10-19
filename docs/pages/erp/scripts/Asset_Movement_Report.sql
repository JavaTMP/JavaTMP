/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  JavaTMP
 * Created: Oct 17, 2018
 */
select FA_Type_VC + ' Addition' as 'Cost Description',
 FA_ID_IN as 'FA Code',
 sum(case when FA_Category_VC = 'Cost' and Period_TI = '1' and
 Year_SI = 2007 then Amount_NU else 0 end) as 'Period 01',
 sum(case when FA_Category_VC = 'Cost' and Period_TI = '2' and
 Year_SI = 2007 then Amount_NU else 0 end) as 'Period 02',
 sum(case when FA_Category_VC = 'Cost' and Period_TI = '3' and
 Year_SI = 2007 then Amount_NU else 0 end) as 'Period 03',
 sum(case when FA_Category_VC = 'Cost' and Period_TI = '4' and
 Year_SI = 2007 then Amount_NU else 0 end) as 'Period 04',
 sum(case when FA_Category_VC = 'Cost' and Period_TI = '5' and
 Year_SI = 2007 then Amount_NU else 0 end) as 'Period 05',
 sum(case when FA_Category_VC = 'Cost' and Period_TI = '6' and
 Year_SI = 2007 then Amount_NU else 0 end) as 'Period 06',
 sum(case when FA_Category_VC = 'Cost' and Period_TI = '7' and
 Year_SI = 2007 then Amount_NU else 0 end) as 'Period 07',
 sum(case when FA_Category_VC = 'Cost' and Period_TI = '8' and
 Year_SI = 2007 then Amount_NU else 0 end) as 'Period 08',
 sum(case when FA_Category_VC = 'Cost' and Period_TI = '9' and
 Year_SI = 2007 then Amount_NU else 0 end) as 'Period 09',
 sum(case when FA_Category_VC = 'Cost' and Period_TI = '10' and
 Year_SI = 2007 then Amount_NU else 0 end) as 'Period 10',
 sum(case when FA_Category_VC = 'Cost' and Period_TI = '11' and
 Year_SI = 2007 then Amount_NU else 0 end) as 'Period 11',
 sum(case when FA_Category_VC = 'Cost' and Period_TI = '12' and
 Year_SI = 2007 then Amount_NU else 0 end) as 'Period 12',
 sum(case when FA_Category_VC = 'Cost' and Year_SI = 2007
 then Amount_NU else 0 end) as 'YTD'

from FixedAsset_T join Journal_T on
FixedAsset_T.Doc_No_VC = Journal_T.Doc_No_VC
where FA_Type_VC ='CE'
and Descrip_VC = 'Purchase CompEquip'
group by FA_Type_VC,FA_ID_IN
union all
select FA_Type_VC + ' Disposal' as 'Description',FA_ID_IN,
 sum(case when FA_Category_VC = 'DispCost' and Period_TI = '1' and
 Year_SI = 2007 then Amount_NU else 0 end) as 'Period 01',
 sum(case when FA_Category_VC = 'DispCost' and Period_TI = '2' and
 Year_SI = 2007 then Amount_NU else 0 end) as 'Period 02',
 sum(case when FA_Category_VC = 'DispCost' and Period_TI = '3' and
Year_SI = 2007 then Amount_NU else 0 end) as 'Period 03',
 sum(case when FA_Category_VC = 'DispCost' and Period_TI = '4' and
 Year_SI = 2007 then Amount_NU else 0 end) as 'Period 04',
 sum(case when FA_Category_VC = 'DispCost' and Period_TI = '5' and
 Year_SI = 2007 then Amount_NU else 0 end) as 'Period 05',
 sum(case when FA_Category_VC = 'DispCost' and Period_TI = '6' and
 Year_SI = 2007 then Amount_NU else 0 end) as 'Period 06',
 sum(case when FA_Category_VC = 'DispCost' and Period_TI = '7' and
 Year_SI = 2007 then Amount_NU else 0 end) as 'Period 07',
 sum(case when FA_Category_VC = 'DispCost' and Period_TI = '8' and
 Year_SI = 2007 then Amount_NU else 0 end) as 'Period 08',
 sum(case when FA_Category_VC = 'DispCost' and Period_TI = '9' and
 Year_SI = 2007 then Amount_NU else 0 end) as 'Period 09',
 sum(case when FA_Category_VC = 'DispCost' and Period_TI = '10' and
 Year_SI = 2007 then Amount_NU else 0 end) as 'Period 10',
 sum(case when FA_Category_VC = 'DispCost' and Period_TI = '11' and
 Year_SI = 2007 then Amount_NU else 0 end) as 'Period 11',
 sum(case when FA_Category_VC = 'DispCost' and Period_TI = '12' and
 Year_SI = 2007 then Amount_NU else 0 end) as 'Period 12',
 sum(case when FA_Category_VC = 'DispCost' and Year_SI = 2007
 then Amount_NU else 0 end) as 'YTD'
from FixedAsset_T join Journal_T on
FixedAsset_T.Doc_No_VC = Journal_T.Doc_No_VC
where FA_Type_VC ='CE'
and Descrip_VC = 'CE DispCost'
group by FA_Type_VC,FA_ID_IN
union all
select FA_Type_VC + ' Net Cost' as 'Description',FA_ID_IN,
 sum(case when FA_Category_VC in ('Cost','DispCost') and
 Period_TI = '1' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 01',
 sum(case when FA_Category_VC in ('Cost','DispCost') and
 Period_TI = '2' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 02',
 sum(case when FA_Category_VC in ('Cost','DispCost') and
 Period_TI = '3' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 03',
 sum(case when FA_Category_VC in ('Cost','DispCost') and
 Period_TI = '4' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 04',
 sum(case when FA_Category_VC in ('Cost','DispCost') and
 Period_TI = '5' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 05',
 sum(case when FA_Category_VC in ('Cost','DispCost') and
 Period_TI = '6' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 06',
 sum(case when FA_Category_VC in ('Cost','DispCost') and
 Period_TI = '7' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 07',
 sum(case when FA_Category_VC in ('Cost','DispCost') and
 Period_TI = '8' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 08',
 sum(case when FA_Category_VC in ('Cost','DispCost') and
 Period_TI = '9' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 09',
 sum(case when FA_Category_VC in ('Cost','DispCost') and
 Period_TI = '10' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 10',
 sum(case when FA_Category_VC in ('Cost','DispCost') and
 Period_TI = '11' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 11',
 sum(case when FA_Category_VC in ('Cost','DispCost') and
 Period_TI = '12' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 12',
 sum(case when FA_Category_VC in ('Cost','DispCost') and
 Year_SI = 2007 then Amount_NU else 0 end) as 'YTD'
from FixedAsset_T join Journal_T on
FixedAsset_T.Doc_No_VC = Journal_T.Doc_No_VC
where FA_Type_VC ='CE'
and Descrip_VC in ('Purchase CompEquip','CE DispCost')
group by FA_Type_VC,FA_ID_IN
union all
select FA_Type_VC + ' Addition' as 'Deprn Description',
 FA_ID_IN as 'FA Code',
 sum(case when FA_Category_VC = 'Deprn' and
 Period_TI = '1' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 01',
 sum(case when FA_Category_VC = 'Deprn' and
 Period_TI = '2' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 02',
 sum(case when FA_Category_VC = 'Deprn' and
 Period_TI = '3' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 03',
 sum(case when FA_Category_VC = 'Deprn' and
 Period_TI = '4' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 04',
 sum(case when FA_Category_VC = 'Deprn' and
 Period_TI = '5' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 05',
 sum(case when FA_Category_VC = 'Deprn' and
 Period_TI = '6' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 06',
 sum(case when FA_Category_VC = 'Deprn' and
 Period_TI = '7' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 07',
 sum(case when FA_Category_VC = 'Deprn' and
 Period_TI = '8' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 08',
 sum(case when FA_Category_VC = 'Deprn' and
 Period_TI = '9' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 09',
 sum(case when FA_Category_VC = 'Deprn' and
 Period_TI = '10' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 10',
 sum(case when FA_Category_VC = 'Deprn' and
 Period_TI = '11' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 11',
 sum(case when FA_Category_VC = 'Deprn' and
 Period_TI = '12' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 12',
 sum(case when FA_Category_VC = 'Deprn' and Year_SI = 2007
 then Amount_NU else 0 end) as 'YTD'
from FixedAsset_T join Journal_T on
FixedAsset_T.Doc_No_VC = Journal_T.Doc_No_VC
where FA_Type_VC ='CE'
and Descrip_VC in ('CE Deprn')
group by FA_Type_VC,FA_ID_IN
union all
select FA_Type_VC + ' Disposal' as 'Description',FA_ID_IN,
 sum(case when FA_Category_VC = 'DispDeprn' and
 Period_TI = '1' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 01',
 sum(case when FA_Category_VC = 'DispDeprn' and
 Period_TI = '2' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 02',
 sum(case when FA_Category_VC = 'DispDeprn' and
 Period_TI = '3' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 03',
 sum(case when FA_Category_VC = 'DispDeprn' and
 Period_TI = '4' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 04',
 sum(case when FA_Category_VC = 'DispDeprn' and
 Period_TI = '5' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 05',
 sum(case when FA_Category_VC = 'DispDeprn' and
 Period_TI = '6' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 06',
 sum(case when FA_Category_VC = 'DispDeprn' and
 Period_TI = '7' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 07',
 sum(case when FA_Category_VC = 'DispDeprn' and
 Period_TI = '8' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 08',
 sum(case when FA_Category_VC = 'DispDeprn' and
 Period_TI = '9' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 09',
 sum(case when FA_Category_VC = 'DispDeprn' and
 Period_TI = '10' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 10',
 sum(case when FA_Category_VC = 'DispDeprn' and
 Period_TI = '11' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 11',
 sum(case when FA_Category_VC = 'DispDeprn' and
 Period_TI = '12' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 12',
 sum(case when FA_Category_VC = 'DispDeprn' and Year_SI = 2007
 then Amount_NU else 0 end) as 'YTD'
from FixedAsset_T join Journal_T on
FixedAsset_T.Doc_No_VC = Journal_T.Doc_No_VC
where FA_Type_VC ='CE'
and Descrip_VC in ('CE DispDeprn')
group by FA_Type_VC,FA_ID_IN
union all
select FA_Type_VC + ' Net Deprn' as 'Description',FA_ID_IN,
 sum(case when FA_Category_VC in ('Deprn','DispDeprn') and
 Period_TI = '1' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 01',
 sum(case when FA_Category_VC in ('Deprn','DispDeprn') and
 Period_TI = '2' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 02',
 sum(case when FA_Category_VC in ('Deprn','DispDeprn') and
 Period_TI = '3' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 03',
 sum(case when FA_Category_VC in ('Deprn','DispDeprn') and
 Period_TI = '4' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 04',
 sum(case when FA_Category_VC in ('Deprn','DispDeprn') and
 Period_TI = '5' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 05',
 sum(case when FA_Category_VC in ('Deprn','DispDeprn') and
 Period_TI = '6' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 06',
 sum(case when FA_Category_VC in ('Deprn','DispDeprn') and
 Period_TI = '7' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 07',
 sum(case when FA_Category_VC in ('Deprn','DispDeprn') and
 Period_TI = '8' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 08',
 sum(case when FA_Category_VC in ('Deprn','DispDeprn') and
 Period_TI = '9' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 09',
 sum(case when FA_Category_VC in ('Deprn','DispDeprn') and
 Period_TI = '10' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 10',
 sum(case when FA_Category_VC in ('Deprn','DispDeprn') and
 Period_TI = '11' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 11',
 sum(case when FA_Category_VC in ('Deprn','DispDeprn') and
 Period_TI = '12' and Year_SI = 2007
 then Amount_NU else 0 end) as 'Period 12',
 sum(case when FA_Category_VC in ('Deprn','DispDeprn') and
 Year_SI = 2007
 then Amount_NU else 0 end) as 'YTD'
from FixedAsset_T join Journal_T on
FixedAsset_T.Doc_No_VC = Journal_T.Doc_No_VC
where FA_Type_VC ='CE'
and Descrip_VC in ('CE Deprn','CE DispDeprn')
group by FA_Type_VC,FA_ID_IN
