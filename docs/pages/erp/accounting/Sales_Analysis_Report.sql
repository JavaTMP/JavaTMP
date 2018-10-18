/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  JavaTMP
 * Created: Oct 17, 2018
 */
select Category_Name_VC as 'Product Type',Sale_T.Inv_ID_VC as
 'Inv No',Cust_Name_VC as 'Cust_Name', Journal_T.Date_DT as 'Invoice
 Date',Journal_T.Descrip_VC as 'Description',
 Journal_T.Amount_NU as 'Sales',
 Stock_Movement_T.Qty_NU * Stock_Movement_T.Unit_Price_TI * -1 as 'Cost',
 Journal_T.Amount_NU - (Stock_Movement_T.Qty_NU *
 Stock_Movement_T.Unit_Price_TI) as 'GP',
 ((Journal_T.Amount_NU - (Stock_Movement_T.Qty_NU * Stock_Movement_T.Unit_Price_TI))/Journal_T.Amount_NU * 100) as
 'GP%'
from Stock_Movement_T,Journal_T,Product_Category_T,Customer_T,Sale_T
where
Customer_T.Cust_ID_VC = Sale_T.Cust_ID_VC and
Sale_T.Doc_No_VC = Stock_Movement_T.Doc_No_VC and
Stock_Movement_T.Doc_No_VC = Journal_T.Doc_No_VC and
Journal_T.GL_ID = Product_Category_T.GL_ID and
Journal_T.GL_ID IN (5001,5002) and
Journal_T.Year_SI = 2007
union all
select '','','','','Total',
 sum(case when Journal_T.GL_ID in ('5001','5002') and
 Journal_T.Year_SI = 2007 then Journal_T.Amount_NU else 0 end),
 sum(case when Journal_T.GL_ID in ('6001','6002') and
 Journal_T.Year_SI = 2007 then Journal_T.Amount_NU else 0 end),
 sum(case when Journal_T.GL_ID in ('5001','5002') and
 Journal_T.Year_SI = 2007 then Journal_T.Amount_NU else 0 end) +
 sum(case when Journal_T.GL_ID in ('6001','6002') and Journal_T.Year_SI
 = 2007 then Journal_T.Amount_NU else 0 end),0
from Journal_T

