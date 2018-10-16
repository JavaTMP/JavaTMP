/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  JavaTMP
 * Created: Oct 16, 2018
 */
Select Pdt_ID_VC as 'Product Code', Date_DT as
 'Date',Qty_NU as 'Qty', Unit_Price_TI as 'Unit Price',
 (case when DATEDIFF(now(), (Date_DT)) between 0 and 29.99
 then (Unit_Price_TI * Qty_NU) else 0 end) as '0 - 30 Days',
 (case when DATEDIFF(now(), (Date_DT)) between 30 and 59.99
 then (Unit_Price_TI * Qty_NU) else 0 end) as '31 - 60 Days',
 (case when DATEDIFF(now(), (Date_DT)) between 60 and 89.99
 then (Unit_Price_TI * Qty_NU) else 0 end) as '61 - 90 Days',
 (case when DATEDIFF(now(), (Date_DT)) >= 90
 then (Unit_Price_TI * Qty_NU) else 0 end) as ' > 90 Days'
from Stock_Balance_T
group by Date_DT,Pdt_ID_VC,Qty_NU,Unit_Price_TI
union all
select 0,'0',0,'Total',
 sum(case when DATEDIFF(now(), (Date_DT)) between 0 and 29.99
 then (Unit_Price_TI * Qty_NU) else 0 end)as '0 - 30 Days',
 sum(case when DATEDIFF(now(), (Date_DT)) between 30 and 59.99
 then (Unit_Price_TI * Qty_NU) else 0 end)as '31 - 60 Days',
 sum(case when DATEDIFF(now(), (Date_DT)) between 60 and 89.99
 then (Unit_Price_TI * Qty_NU) else 0 end)as '61 - 90 Days',
 sum(case when DATEDIFF(now(), (Date_DT)) >= 90
 then (Unit_Price_TI * Qty_NU) else 0 end)as ' > 90 Days'
from Stock_Balance_T

