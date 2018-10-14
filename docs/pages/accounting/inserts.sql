delete from coa_t;

INSERT INTO coa_t (`GL_ID`, `GL_Name_VC`, `BS_Category_VC`, `Segment_VC`, `Status_BT`)
	VALUES
(1000, 'PPE', 'FA_Cost', null, true), -- Asset - Fixed Asset Cost
(1001, 'Acc_Deprn', 'FA', null, true),
(2000, 'Stock', 'CA', null, true), -- Asset - current asset
(2001, 'Prov_Stk_Obsolete', 'CA', null, true), -- Asset Current Asset
(2002, 'Bank', 'CA', null, true), -- Asset Current Asset
(2003, 'Debtor', 'CA', null, true), -- Asset Current Asset
(3000, 'Creditors', 'CL', null, true), -- Liabilities - Current Liability
(4000, 'Share_Cap', 'SF', null, true),
(4001, 'RE b/f', 'SF', null, true),
(5001, 'Revenue_Hardware', 'Rev', 'BU1', true), -- Revenue
(5002, 'Revenue_Software', 'Rev', 'BU2', true), -- Revenue
(6001, 'Cost_Hardware', 'Cos', 'BU1', true), -- Cost or Expenses
(6002, 'Cost_Software', 'Cos', 'BU2', true), -- Cost or Expenses
(7001, 'Admin & Utility', 'Otc', 'BU3', true), -- Over the counter Cost or Expenses
(7002, 'Prov-Stk', 'Otc', 'BU1', true), -- Over the counter Cost or Expenses
(8001, 'Interest From Bank', 'Oic', 'BU2', true),
(9001, 'Tax', 'Tax', 'BU1', true); -- Expense

delete from journal_t;
INSERT INTO journal_t (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`)
	VALUES (NULL, NULL, NULL, NULL, NULL, CURRENT_DATE, NULL, NULL)
