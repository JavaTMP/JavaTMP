/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  JavaTMP
 * Created: Oct 17, 2018
 */
select Descrip_VC as 'Collection Forecast',
 Journal_T.Doc_No_VC as 'Doc No',Cust_Name_VC as 'Customer Name',
 sum(case when MONTH(DATE_ADD(Sale_T.Date_DT, interval Customer_T.Credit_Term_TI day))
 BETWEEN 0 AND 1
 then Journal_T.Amount_NU else 0 end) as 'Period 01',
 sum(case when MONTH(DATE_ADD(Sale_T.Date_DT, interval Customer_T.Credit_Term_TI day))
 BETWEEN 1.99 AND 2
 then Journal_T.Amount_NU else 0 end) as 'Period 02',
 sum(case when MONTH(DATE_ADD(Sale_T.Date_DT, interval Customer_T.Credit_Term_TI day))
 BETWEEN 2.99 AND 3
 then Journal_T.Amount_NU else 0 end) as 'Period 03',
 sum(case when MONTH(DATE_ADD(Sale_T.Date_DT, interval Customer_T.Credit_Term_TI day))
 BETWEEN 3.99 AND 4
 then Journal_T.Amount_NU else 0 end) as 'Period 04',
 sum(case when MONTH(DATE_ADD(Sale_T.Date_DT, interval Customer_T.Credit_Term_TI day))
 BETWEEN 4.99 AND 5
 then Journal_T.Amount_NU else 0 end) as 'Period 05',
 sum(case when MONTH(DATE_ADD(Sale_T.Date_DT, interval Customer_T.Credit_Term_TI day))
 BETWEEN 5.99 AND 6
 then Journal_T.Amount_NU else 0 end) as 'Period 06',
 sum(case when MONTH(DATE_ADD(Sale_T.Date_DT, interval Customer_T.Credit_Term_TI day))
 BETWEEN 6.99 AND 7
 then Journal_T.Amount_NU else 0 end) as 'Period 07',
 sum(case when MONTH(DATE_ADD(Sale_T.Date_DT, interval Customer_T.Credit_Term_TI day))
 BETWEEN 7.99 AND 8
 then Journal_T.Amount_NU else 0 end) as 'Period 08',
 sum(case when MONTH(DATE_ADD(Sale_T.Date_DT, interval Customer_T.Credit_Term_TI day))
 BETWEEN 8.99 AND 9
 then Journal_T.Amount_NU else 0 end) as 'Period 09',
 sum(case when MONTH(DATE_ADD(Sale_T.Date_DT, interval Customer_T.Credit_Term_TI day))
 BETWEEN 9.99 AND 10
 then Journal_T.Amount_NU else 0 end) as 'Period 10',
 sum(case when MONTH(DATE_ADD(Sale_T.Date_DT, interval Customer_T.Credit_Term_TI day))
 BETWEEN 10.99 AND 11
 then Journal_T.Amount_NU else 0 end) as 'Period 11',
 sum(case when MONTH(DATE_ADD(Sale_T.Date_DT, interval Customer_T.Credit_Term_TI day))
 BETWEEN 11.99 AND 12
 then Journal_T.Amount_NU else 0 end) as 'Period 12'
from Customer_T,Sale_T,Journal_T
where
Customer_T.Cust_ID_VC = Sale_T.Cust_ID_VC and
Sale_T.Doc_No_VC = Journal_T.Doc_No_VC
and Journal_T.GL_ID = 2003
and Status_BT = 0
group by Descrip_VC,Journal_T.Doc_No_VC,Cust_Name_VC

union all

select 'Total Collection Forecast','','',
 sum(case when MONTH(DATE_ADD(Sale_T.Date_DT, interval Customer_T.Credit_Term_TI day))
 BETWEEN 0 AND 1
 then Journal_T.Amount_NU else 0 end) as 'Period 01',
 sum(case when MONTH(DATE_ADD(Sale_T.Date_DT, interval Customer_T.Credit_Term_TI day))
 BETWEEN 1.99 AND 2
 then Journal_T.Amount_NU else 0 end) as 'Period 02',
 sum(case when MONTH(DATE_ADD(Sale_T.Date_DT, interval Customer_T.Credit_Term_TI day))
 BETWEEN 2.99 AND 3
 then Journal_T.Amount_NU else 0 end) as 'Period 03',
 sum(case when MONTH(DATE_ADD(Sale_T.Date_DT, interval Customer_T.Credit_Term_TI day))
 BETWEEN 3.99 AND 4
 then Journal_T.Amount_NU else 0 end) as 'Period 04',
 sum(case when MONTH(DATE_ADD(Sale_T.Date_DT, interval Customer_T.Credit_Term_TI day))
 BETWEEN 4.99 AND 5
 then Journal_T.Amount_NU else 0 end) as 'Period 05',
 sum(case when MONTH(DATE_ADD(Sale_T.Date_DT, interval Customer_T.Credit_Term_TI day))
 BETWEEN 5.99 AND 6
 then Journal_T.Amount_NU else 0 end) as 'Period 06',
 sum(case when MONTH(DATE_ADD(Sale_T.Date_DT, interval Customer_T.Credit_Term_TI day))
 BETWEEN 6.99 AND 7
 then Journal_T.Amount_NU else 0 end) as 'Period 07',
 sum(case when MONTH(DATE_ADD(Sale_T.Date_DT, interval Customer_T.Credit_Term_TI day))
 BETWEEN 7.99 AND 8
 then Journal_T.Amount_NU else 0 end) as 'Period 08',
 sum(case when MONTH(DATE_ADD(Sale_T.Date_DT, interval Customer_T.Credit_Term_TI day))
 BETWEEN 8.99 AND 9
 then Journal_T.Amount_NU else 0 end) as 'Period 09',
 sum(case when MONTH(DATE_ADD(Sale_T.Date_DT, interval Customer_T.Credit_Term_TI day))
 BETWEEN 9.99 AND 10
 then Journal_T.Amount_NU else 0 end) as 'Period 10',
 sum(case when MONTH(DATE_ADD(Sale_T.Date_DT, interval Customer_T.Credit_Term_TI day))
 BETWEEN 10.99 AND 11
 then Journal_T.Amount_NU else 0 end) as 'Period 11',
 sum(case when MONTH(DATE_ADD(Sale_T.Date_DT, interval Customer_T.Credit_Term_TI day))
 BETWEEN 11.99 AND 12
 then Journal_T.Amount_NU else 0 end) as 'Period 12'

from Customer_T,Sale_T,Journal_T
where
Customer_T.Cust_ID_VC = Sale_T.Cust_ID_VC and
Sale_T.Doc_No_VC = Journal_T.Doc_No_VC
and Journal_T.GL_ID = 2003
and Status_BT = 0

union all

select Descrip_VC as 'Payment Forecast',
 Journal_T.Doc_No_VC as 'Doc No',Cred_Name_VC as 'Creditor Name',
 sum(case when MONTH(Purchase_T.Date_DT+Creditor_T.Credit_Term_TI)
 BETWEEN 0 AND 1
 then Journal_T.Amount_NU else 0 end) as 'Period 01',
 sum(case when MONTH(Purchase_T.Date_DT+Creditor_T.Credit_Term_TI)
 BETWEEN 1.99 AND 2
 then Journal_T.Amount_NU else 0 end) as 'Period 02',
 sum(case when MONTH(Purchase_T.Date_DT+Creditor_T.Credit_Term_TI)
 BETWEEN 2.99 AND 3
 then Journal_T.Amount_NU else 0 end) as 'Period 03',
 sum(case when MONTH(Purchase_T.Date_DT+Creditor_T.Credit_Term_TI)
 BETWEEN 3.99 AND 4
 then Journal_T.Amount_NU else 0 end) as 'Period 04',
 sum(case when MONTH(Purchase_T.Date_DT+Creditor_T.Credit_Term_TI)
 BETWEEN 4.99 AND 5
 then Journal_T.Amount_NU else 0 end) as 'Period 05',
 sum(case when MONTH(Purchase_T.Date_DT+Creditor_T.Credit_Term_TI)
 BETWEEN 5.99 AND 6
 then Journal_T.Amount_NU else 0 end) as 'Period 06',
 sum(case when MONTH(Purchase_T.Date_DT+Creditor_T.Credit_Term_TI)
 BETWEEN 6.99 AND 7
 then Journal_T.Amount_NU else 0 end) as 'Period 07',
 sum(case when MONTH(Purchase_T.Date_DT+Creditor_T.Credit_Term_TI)
 BETWEEN 7.99 AND 8
 then Journal_T.Amount_NU else 0 end) as 'Period 08',
 sum(case when MONTH(Purchase_T.Date_DT+Creditor_T.Credit_Term_TI)
 BETWEEN 8.99 AND 9
 then Journal_T.Amount_NU else 0 end) as 'Period 09',
 sum(case when MONTH(Purchase_T.Date_DT+Creditor_T.Credit_Term_TI)
 BETWEEN 9.99 AND 10
 then Journal_T.Amount_NU else 0 end) as 'Period 10',
 sum(case when MONTH(Purchase_T.Date_DT+Creditor_T.Credit_Term_TI)
 BETWEEN 10.99 AND 11
 then Journal_T.Amount_NU else 0 end) as 'Period 11',
 sum(case when MONTH(Purchase_T.Date_DT+Creditor_T.Credit_Term_TI)
 BETWEEN 11.99 AND 12
 then Journal_T.Amount_NU else 0 end) as 'Period 12'

from Creditor_T,Purchase_T,Journal_T
where
Creditor_T.Cred_ID_VC = Purchase_T.Cred_ID_VC and
Purchase_T.Doc_No_VC = Journal_T.Doc_No_VC
and Journal_T.GL_ID = 3000
and Status_BT = 0
group by Descrip_VC, Journal_T.Doc_No_VC, Cred_Name_VC

union all

select 'Total Payment Forecast','','',
 sum(case when MONTH(Purchase_T.Date_DT+Creditor_T.Credit_Term_TI)
 BETWEEN 0 AND 1
 then Journal_T.Amount_NU else 0 end) as 'Period 01',
 sum(case when MONTH(Purchase_T.Date_DT+Creditor_T.Credit_Term_TI)
 BETWEEN 1.99 AND 2
 then Journal_T.Amount_NU else 0 end) as 'Period 02',
 sum(case when MONTH(Purchase_T.Date_DT+Creditor_T.Credit_Term_TI)
 BETWEEN 2.99 AND 3
 then Journal_T.Amount_NU else 0 end) as 'Period 03',
 sum(case when MONTH(Purchase_T.Date_DT+Creditor_T.Credit_Term_TI)
 BETWEEN 3.99 AND 4
 then Journal_T.Amount_NU else 0 end) as 'Period 04',
 sum(case when MONTH(Purchase_T.Date_DT+Creditor_T.Credit_Term_TI)
 BETWEEN 4.99 AND 5
 then Journal_T.Amount_NU else 0 end) as 'Period 05',
 sum(case when MONTH(Purchase_T.Date_DT+Creditor_T.Credit_Term_TI)
 BETWEEN 5.99 AND 6
 then Journal_T.Amount_NU else 0 end) as 'Period 06',
 sum(case when MONTH(Purchase_T.Date_DT+Creditor_T.Credit_Term_TI)
 BETWEEN 6.99 AND 7
 then Journal_T.Amount_NU else 0 end) as 'Period 07',
 sum(case when MONTH(Purchase_T.Date_DT+Creditor_T.Credit_Term_TI)
 BETWEEN 7.99 AND 8
 then Journal_T.Amount_NU else 0 end) as 'Period 08',
 sum(case when MONTH(Purchase_T.Date_DT + Creditor_T.Credit_Term_TI)
 BETWEEN 8.99 AND 9
 then Journal_T.Amount_NU else 0 end) as 'Period 09',
 sum(case when MONTH(Purchase_T.Date_DT+Creditor_T.Credit_Term_TI)
 BETWEEN 9.99 AND 10
 then Journal_T.Amount_NU else 0 end) as 'Period 10',
 sum(case when MONTH(Purchase_T.Date_DT+Creditor_T.Credit_Term_TI)
 BETWEEN 10.99 AND 11
 then Journal_T.Amount_NU else 0 end) as 'Period 11',
 sum(case when MONTH(Purchase_T.Date_DT+Creditor_T.Credit_Term_TI)
 BETWEEN 11.99 AND 12
 then Journal_T.Amount_NU else 0 end) as 'Period 12'
from Creditor_T,Purchase_T,Journal_T
where
Creditor_T.Cred_ID_VC = Purchase_T.Cred_ID_VC and
Purchase_T.Doc_No_VC = Journal_T.Doc_No_VC
and Journal_T.GL_ID = 3000
and Status_BT = 0;