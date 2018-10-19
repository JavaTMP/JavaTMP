/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  JavaTMP
 * Created: Oct 17, 2018
 */
select Date_DT as 'Date',Chq_No_VC,
 Descrip_VC as 'Add Back Unpresented Cheques',
 case when Cash_T.Chq_No_VC Not in (Select Bank_Statement.Chq_No
 From Bank_Statement) and Journal_T.Amount_NU < 0 and GL_ID = 2002
 then Journal_T.Amount_NU*-1 else 0 end as '$'
from Cash_T join Journal_T on
Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
where Cash_T.Chq_No_VC Not in (Select Bank_Statement.Chq_No From
Bank_Statement) and Journal_T.Amount_NU < 0 and GL_ID = 2002

union all
select Date_DT as 'Date',Chq_No_VC,
 Descrip_VC as 'Less Amount not credited in Bank',
 case when Cash_T.Chq_No_VC Not in (Select Bank_Statement.Chq_No
 From Bank_Statement) and Journal_T.Amount_NU > 0 and GL_ID = 2002
 then Journal_T.Amount_NU*-1 else 0 end as '$'
from Cash_T join Journal_T on Cash_T.Doc_No_VC = Journal_T.Doc_No_VC
where Cash_T.Chq_No_VC Not in (Select Bank_Statement.Chq_No From
Bank_Statement) and Journal_T.Amount_NU > 0 and GL_ID = 2002

union all
select 'Date' as 'Date',Chq_No,
 Detail as 'Add credited Amount not taken in GL',
 case when Bank_Statement.Chq_No Not in (Select Cash_T.Chq_No_VC
from Cash_T join Journal_T on Cash_T.Doc_No_VC = Journal_T.Doc_No_VC)
and Bank_Statement.Amt < 0
then Amt*-1 else 0 end as '$'
from Bank_Statement
where Bank_Statement.Chq_No Not in (Select Cash_T.Chq_No_VC from Cash_T
join Journal_T on Cash_T.Doc_No_VC = Journal_T.Doc_No_VC)
and Bank_Statement.Amt < 0

union all
select `Date` as 'Date',Chq_No,
 Detail as 'Less Amount debited not taken in GL',
 case when Bank_Statement.Chq_No Not in (Select Cash_T.Chq_No_VC
 From Cash_T join Journal_T on
 Cash_T.Doc_No_VC = Journal_T.Doc_No_VC) and Bank_Statement.Amt > 0
 then Amt*-1 else 0 end as '$'
from Bank_Statement
where Bank_Statement.Chq_No Not in (Select Cash_T.Chq_No_VC From Cash_T
join Journal_T on Cash_T.Doc_No_VC = Journal_T.Doc_No_VC)
and Bank_Statement.Amt > 0 ;
