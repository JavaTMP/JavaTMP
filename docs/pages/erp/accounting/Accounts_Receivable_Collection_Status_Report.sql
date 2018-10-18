/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  JavaTMP
 * Created: Oct 17, 2018
 */
select Customer_T.Cust_Name_VC as 'Customer Name',Sale_T.Inv_ID_VC as
 'Inv No',Credit_Term_TI as 'Credit Term',
 case when Status_BT = 1 then '$' + Amount_NU  + ' Paid' else '0' end as 'Invoice Amount'
from Customer_T,Sale_T,Journal_T
where Customer_T.Cust_ID_VC = Sale_T.Cust_ID_VC
and Journal_T.Doc_No_VC = Sale_T.Doc_No_VC
and Journal_T.GL_ID = 2003
and Sale_T.Status_BT = 1
union all
select Customer_T.Cust_Name_VC,Sale_T.Inv_ID_VC,Credit_Term_TI,
 case when Status_BT = 0 then '$' + Amount_NU
 + ' Unpaid' else '0' end as 'Invoice Amount'
from Customer_T,Sale_T,Journal_T
where Customer_T.Cust_ID_VC = Sale_T.Cust_ID_VC
and Journal_T.Doc_No_VC = Sale_T.Doc_No_VC
and Journal_T.GL_ID = 2003
and Sale_T.Status_BT = 0

