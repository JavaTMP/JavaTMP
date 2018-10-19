/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  JavaTMP
 * Created: Oct 16, 2018
 */
SELECT
 Cred_Name_VC as 'Creditor Name', Purchase_T.Inv_ID_VC as 'Inv No', Credit_Term_TI
 as 'Credit Term',Journal_T.Doc_No_VC as 'Doc No',
 Purchase_T.Date_DT as InvoiceDate,
 DATEDIFF(now(), DATE_ADD(Purchase_T.Date_DT, interval Credit_Term_TI day)) as
 'Days Overdue',
 DATE_ADD(Purchase_T.Date_DT, interval Credit_Term_TI DAY) as
 Due_date,
 (CASE WHEN DATEDIFF(now(), DATE_ADD(Purchase_T.Date_DT, interval Credit_Term_TI day))
 BETWEEN -100 AND 29.99 THEN Journal_T.Amount_NU ELSE 0 END) AS
 Less_than_30_DYS,
 (CASE WHEN DATEDIFF(now(), DATE_ADD(Purchase_T.Date_DT, interval Credit_Term_TI day))
 BETWEEN 30 AND 59.99 THEN Journal_T.Amount_NU ELSE 0 END) AS
 '> 30 DYS',
 (CASE WHEN DATEDIFF(now(), DATE_ADD(Purchase_T.Date_DT, interval Credit_Term_TI day))
 BETWEEN 60 AND 89.99 THEN Journal_T.Amount_NU ELSE 0 END) AS
 '> 60 DYS',
 (CASE WHEN DATEDIFF(now(), DATE_ADD(Purchase_T.Date_DT, interval Credit_Term_TI day))
 >= 90 THEN Journal_T.Amount_NU ELSE 0 END) '> 90 DYS'
from Creditor_T,Purchase_T,Journal_T where
Creditor_T.Cred_ID_VC = Purchase_T.Cred_ID_VC and
Purchase_T.Doc_No_VC = Journal_T.Doc_No_VC and
Journal_T.GL_ID = 3000 and
Status_BT = 0
union all

SELECT '','','','','','', 'Total Balance',
 SUM(CASE WHEN DATEDIFF(now(), DATE_ADD(Purchase_T.Date_DT, interval Credit_Term_TI day))
 BETWEEN -100 AND 29.99 THEN Journal_T.Amount_NU ELSE 0 END),
 SUM(CASE WHEN DATEDIFF(now(), DATE_ADD(Purchase_T.Date_DT, interval Credit_Term_TI day))
 BETWEEN 30 AND 59.99 THEN Journal_T.Amount_NU ELSE 0 END),
 SUM(CASE WHEN DATEDIFF(now(), DATE_ADD(Purchase_T.Date_DT, interval Credit_Term_TI day))
 BETWEEN 60 AND 89.99 THEN Journal_T.Amount_NU ELSE 0 END),
 SUM(CASE WHEN DATEDIFF(now(), DATE_ADD(Purchase_T.Date_DT, interval Credit_Term_TI day))
 >= 90 THEN Journal_T.Amount_NU ELSE 0 END)
from Creditor_T,Purchase_T,Journal_T where
Creditor_T.Cred_ID_VC = Purchase_T.Cred_ID_VC and
Purchase_T.Doc_No_VC = Journal_T.Doc_No_VC and
Journal_T.GL_ID = 3000 and
Status_BT = 0

