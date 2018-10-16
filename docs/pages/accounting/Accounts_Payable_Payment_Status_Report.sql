/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  JavaTMP
 * Created: Oct 16, 2018
 */

Select Creditor_T.Cred_Name_VC as 'Creditor Name',Purchase_T.Inv_ID_VC as
 'Inv No',Credit_Term_TI as 'Credit Term',
 case when Status_BT = 1 then Journal_T.Amount_NU else '0' end as
 'Invoice Amount'
from Creditor_T,Purchase_T,Journal_T where
Creditor_T.Cred_ID_VC = Purchase_T.Cred_ID_VC and
Purchase_T.Doc_No_VC = Journal_T.Doc_No_VC and
Journal_T.GL_ID = 3000 and
Status_BT = 1

union all
select Cred_Name_VC,Purchase_T.Inv_ID_VC,Credit_Term_TI,
 case when Status_BT = 0 then Journal_T.Amount_NU else 0 end
 as 'Invoice Amount'
from Creditor_T,Purchase_T,Journal_T where
Creditor_T.Cred_ID_VC = Purchase_T.Cred_ID_VC and
Purchase_T.Doc_No_VC = Journal_T.Doc_No_VC and
Journal_T.GL_ID = 3000 and
Status_BT = 0

union all
select '', '', 'Total Unpaid' as 'Creditors Bal',
 sum(Journal_T.Amount_NU)as 'Invoice Amount'
from Creditor_T,Purchase_T,Journal_T where
Creditor_T.Cred_ID_VC = Purchase_T.Cred_ID_VC and
Purchase_T.Doc_No_VC = Journal_T.Doc_No_VC and
Journal_T.GL_ID = 3000 and
Status_BT = 0

union all
select '', '', 'Total paid' as 'Creditors Bal',
 sum(Journal_T.Amount_NU)as 'Invoice Amount'
from Creditor_T,Purchase_T,Journal_T where
Creditor_T.Cred_ID_VC = Purchase_T.Cred_ID_VC and
Purchase_T.Doc_No_VC = Journal_T.Doc_No_VC and
Journal_T.GL_ID = 3000 and
Status_BT = 1