/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  JavaTMP
 * Created: Oct 17, 2018
 */
SELECT Cust_Name_VC as 'Customer Name',Sale_T.Inv_ID_VC as
 'Inv No',Credit_Term_TI as 'Credit Term', Sale_T.Date_DT as InvoiceDate,
 DATEDIFF(now(), DATE_ADD(Sale_T.Date_DT, interval Credit_Term_TI day)) as
 'Days Overdue', DATE_ADD(Sale_T.Date_DT, interval Credit_Term_TI day) as Due_date,
 (CASE WHEN (now() - DATE_ADD(Sale_T.Date_DT, interval Credit_Term_TI day)) BETWEEN
 -100 AND 29.99
 THEN Amount_NU ELSE 0 END) AS '< 30 DYS',
 (CASE WHEN (now() - DATE_ADD(Sale_T.Date_DT, interval Credit_Term_TI day)) BETWEEN
 30 AND 59.99 THEN Amount_NU ELSE 0 END) AS '> 30 DYS',
 (CASE WHEN (now() - DATE_ADD(Sale_T.Date_DT, interval Credit_Term_TI day)) >= 60
 THEN Amount_NU ELSE 0 END) '> 60 DYS'
from Customer_T,Sale_T,Journal_T
where Customer_T.Cust_ID_VC = Sale_T.Cust_ID_VC
and Journal_T.Doc_No_VC = Sale_T.Doc_No_VC
and Journal_T.GL_ID = 2003
and Sale_T.Status_BT = 0
union all

SELECT '','',0,'',0, 'Total Balance',
 SUM(CASE WHEN (now() - DATE_ADD(Sale_T.Date_DT, interval Credit_Term_TI day)) BETWEEN
 -100 AND 29.99 THEN Amount_NU ELSE 0 END),
 SUM(CASE WHEN (now() - DATE_ADD(Sale_T.Date_DT, interval Credit_Term_TI day)) BETWEEN
 30 AND 59.99 THEN Amount_NU ELSE 0 END),
 SUM(CASE WHEN (now() - DATE_ADD(Sale_T.Date_DT, interval Credit_Term_TI day)) >= 60 THEN Amount_NU ELSE 0 END)
from Customer_T,Sale_T,Journal_T
where Customer_T.Cust_ID_VC = Sale_T.Cust_ID_VC
and Journal_T.Doc_No_VC = Sale_T.Doc_No_VC
and Journal_T.GL_ID = 2003
and Sale_T.Status_BT = 0;

