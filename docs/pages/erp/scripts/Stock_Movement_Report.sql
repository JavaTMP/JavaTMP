/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  JavaTMP
 * Created: Oct 16, 2018
 */
select Date_DT as 'Transaction date', Pdt_ID_VC as
 'Product Code',Descrip_VC as 'Doc Number',Qty_NU as
 'Qty',Unit_Price_TI as 'Unit Price',
 sum(case when Qty_NU > 0 then Qty_NU * Unit_Price_TI else 0 end) as
 'Debit',
 sum(case when Qty_NU < 0 then Qty_NU * Unit_Price_TI else 0 end)as
 'Credit'
from Stock_Movement_T
group by Date_DT,Pdt_ID_VC,Descrip_VC,Qty_NU,Unit_Price_TI
union all
select '','','Balance Qty: ' + Pdt_ID_VC,
 sum(Qty_NU),0,0,0
from Stock_Movement_T
where Pdt_ID_VC = 1234
group by Pdt_ID_VC
union all
select '','','Balance Qty: ' + Pdt_ID_VC,
 sum(Qty_NU),0,0,0
from Stock_Movement_T
where Pdt_ID_VC = 1235
group by Pdt_ID_VC
union all
select '','','Closing Stock Value for: ' + Pdt_ID_VC,
 sum(case when Qty_NU > 0 then Qty_NU * Unit_Price_TI else 0 end) +
 sum(case when Qty_NU < 0 then Qty_NU * Unit_Price_TI else 0 end),0,0,0
from Stock_Movement_T
where Pdt_ID_VC = 1234
group by Pdt_ID_VC
union all
select '','','Closing Stock Value for: ' + Pdt_ID_VC,
 sum(case when Qty_NU > 0 then Qty_NU * Unit_Price_TI else 0 end) +
 sum(case when Qty_NU < 0 then Qty_NU * Unit_Price_TI else 0 end),0,0,0
from Stock_Movement_T
where Pdt_ID_VC = 1235
group by Pdt_ID_VC
