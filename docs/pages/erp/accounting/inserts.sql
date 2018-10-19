delete from coa_t;
INSERT INTO coa_t (`GL_ID`, `GL_Name_VC`, `BS_Category_VC`, `Segment_VC`, `Status_BT`) VALUES
(1000, 'PPE', 'FA_Cost', null, true), -- Asset - Fixed Asset. Debit +
(1001, 'Acc_Deprn', 'FA', null, true), -- Asset - Fixed Asset. Debit +
(2000, 'Stock', 'CA', null, true), -- Asset - current asset. Debit +
(2001, 'Prov_Stk_Obsolete', 'CA', null, true), -- Asset Current Asset. Debit +
(2002, 'Bank', 'CA', null, true), -- Asset Current Asset. Debit +
(2003, 'Debtor', 'CA', null, true), -- Asset Current Asset. Debit +
(3000, 'Creditors', 'CL', null, true), -- Liabilities - Current Liability
(4000, 'Share_Cap', 'SF', null, true),  -- Owner's equity Shareholder Funds
(4001, 'RE b/f', 'SF', null, true), -- -- Owner's equity Shareholder Funds
(5001, 'Revenue_Hardware', 'Rev', 'BU1', true), -- Revenue
(5002, 'Revenue_Software', 'Rev', 'BU2', true), -- Revenue
(6001, 'Cost_Hardware', 'Cos', 'BU1', true), -- Cost or Expenses. Debit +
(6002, 'Cost_Software', 'Cos', 'BU2', true), -- Cost or Expenses. Debit +
(7001, 'Admin & Utility', 'Otc', 'BU3', true), -- Operating Cost or Expenses. Debit +
(7002, 'Prov-Stk', 'Otc', 'BU1', true), -- Operation cost or Expenses. Debit +
(8001, 'Interest From Bank', 'Oic', 'BU2', true), -- Operating Income
(9001, 'Tax', 'Tax', 'BU1', true); -- Expense. Debit +

delete from journal_t;
INSERT INTO journal_t (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES
('JV1000', 2003, NULL, 2000, 'HP Presario-TX 101 p4', '2007-05-12', 5, 2007),
('JV1000', 5001, NULL, -2000, 'HP Presario-TX 101 p4', '2007-05-12', 5, 2007),

('JV1001', 2003, NULL, 2000, 'HP Presario-TX 101 p4', '2007-08-22', 8, 2007),
('JV1001', 5001, NULL, -2000, 'HP Presario-TX 101 p4', '2007-08-22', 8, 2007),

('JV1002', 2003, NULL, 2500, 'Red Hat-version 2.0', '2007-06-03', 6, 2007),
('JV1002', 5002, NULL, -2500, 'Red Hat-version 2.0', '2007-06-03', 6, 2007),

('JV1003', 2000, NULL, 300, 'HP Presario-TX 101 P4', '2006-07-20', 7, 2006),
('JV1003', 3000, NULL, -300, 'HP Presario-TX 101 P4', '2006-07-20', 7, 2006),

('JV1004', 2000, NULL, 180, 'HP Presario - TX 101 P4', '2006-07-20', 7, 2006),
('JV1004', 3000, NULL, -180, 'HP Presario - TX 101 P4', '2006-07-20', 7, 2006),

('JV1005', 2000, NULL, 220, 'Red Hat-version 2.0', '2006-07-20', 7, 2006),
('JV1005', 3000, NULL, -220, 'Red Hat-version 2.0', '2006-07-20', 7, 2006),

('JV1002', 2000, NULL, -100, 'Red Hat-version 2.0', '2007-06-03', 6, 2007),
('JV1002', 6002, NULL, 100, 'Red Hat-version 2.0', '2007-06-03', 6, 2007),

('JV1000', 2000, NULL, -150, 'HP Presario - TX 101 P4', '2007-05-12', 5, 2007),
('JV1000', 6001, NULL, 150, 'HP Presario - TX 101 P4', '2007-05-12', 5, 2007),

('JV1001', 2000, NULL, -150, 'HP Presario - TX 101 P4', '2007-08-22', 8, 2007),
('JV1001', 6001, NULL, 150, 'HP Presario - TX 101 P4', '2007-08-22', 8, 2007),

('JV1009', 2001, NULL, -150, '', '2007-12-28', 12, 2007),
('JV1009', 7002, NULL, 150, '', '2007-12-28', 12, 2007),

('JV1010', 1000, NULL, 600, 'Purchase OfficeEquip', '2006-12-28', 12, 2006),
('JV1010', 1000, NULL, 650, 'Purchase Furniture', '2006-12-28', 12, 2006),
('JV1010', 1000, NULL, 460, 'Purchase CompEquip', '2006-12-28', 12, 2006),
('JV1010', 3000, NULL, -1710, 'Purchase FA', '2006-12-28', 12, 2006),

('JV1011', 1000, NULL, -60, 'CE Disp Cost', '2006-07-25', 7, 2006),
('JV1011', 1000, NULL, -100, 'OE Disp Cost', '2006-07-25', 7, 2006),
('JV1011', 1000, NULL, -100, 'FF Disp Cost', '2006-07-25', 7, 2006),
('JV1011', 4001, NULL, 260, 'Disposal', '2006-07-25', 7, 2006),
('JV1011', 1001, NULL, 50, 'CE Disp Deprn', '2006-07-25', 7, 2006),
('JV1011', 1001, NULL, 100, 'OE Disp Deprn', '2006-07-25', 7, 2006),
('JV1011', 1001, NULL, 95, 'FF Disp Deprn', '2006-07-25', 7, 2006),
('JV1011', 4001, NULL, -245, 'Disposal', '2006-07-25', 7, 2006),

('JV1012', 1001, NULL, -300, 'CE Deprn', '2006-07-25', 7, 2006),
('JV1012', 1001, NULL, -400, 'OE Deprn', '2006-07-25', 7, 2006),
('JV1012', 1001, NULL, -250, 'FF Deprn', '2006-07-25', 7, 2006),
('JV1012', 4001, NULL, 950, 'Deprn', '2006-07-25', 7, 2006),

('JV1013', 1000, NULL, 800, 'Purchase CompEquip', '2007-02-20', 2, 2007),
('JV1013', 1000, NULL, 450, 'Purchase OfficeEquip', '2007-02-20', 2, 2007),
('JV1013', 1000, NULL, 360, 'Purchase Furniture', '2007-02-20', 2, 2007),
('JV1013', 3000, NULL, -1610, 'Purchase FA', '2007-02-20', 2, 2007),

('JV1014', 1001, NULL, -200, 'CE Deprn', '2007-12-28', 12, 2007),
('JV1014', 1001, NULL, -120, 'OE Deprn', '2007-12-28', 12, 2007),
('JV1014', 1001, NULL, -55, 'FF Deprn', '2007-12-28', 12, 2007),
('JV1014', 7001, NULL, 375, 'Deprn', '2007-12-28', 12, 2007),

('JV1015', 1000, NULL, -50, 'CE DispCost', '2007-06-26', 6, 2007),
('JV1015', 1000, NULL, -100, 'OE DispCost', '2007-06-26', 6, 2007),
('JV1015', 1000, NULL, -10, 'FF DispCost', '2007-06-26', 6, 2007),
('JV1015', 7001, NULL, 160, 'Disposal', '2007-06-26', 6, 2007),

('JV1016', 1001, NULL, 20, 'CE DispDeprn', '2007-06-26', 6, 2007),
('JV1016', 1001, NULL, 55, 'OE DispDeprn', '2007-06-26', 6, 2007),
('JV1016', 1001, NULL, 5, 'FF DispDeprn', '2007-06-26', 6, 2007),
('JV1016', 7001, NULL, -80, 'Disposal', '2007-06-26', 6, 2007),

('JV1017', 7001, NULL, 745, 'Payment of interest', '2007-12-26', 12, 2007),
('JV1017', 2002, NULL, -745, 'Payment of interest', '2007-12-26', 12, 2007),

('JV1018', 9001, NULL, 600, 'Payment of Taxes', '2007-07-25', 7, 2007),
('JV1018', 2002, NULL, -600, 'Payment of Taxes', '2007-07-25', 7, 2007),

('JV1019', 2002, NULL, 250, 'Interest from bank', '2007-07-25', 7, 2007),
('JV1019', 8001, NULL, -250, 'Interest from bank', '2007-07-25', 7, 2007),

('JV1020', 2002, NULL, 2000, 'Proceeds from shares issue', '2007-08-25', 8, 2007),
('JV1020', 4000, NULL, -2000, 'Proceeds from shares issue', '2007-08-25', 8, 2007),

('JV1021', 3000, NULL, 1710, 'Purchase FA', '2007-06-25', 6, 2007),
('JV1021', 2002, NULL, -1710, 'Purchase FA', '2007-06-25', 6, 2007),

('JV1022', 2002, NULL, 2000, 'Receipt from William', '2007-08-26', 8, 2007),
('JV1022', 2003, NULL, -2000, 'Receipt from William', '2007-08-26', 8, 2007),

('JV1023', 2002, NULL, 2000, 'Receipt from Randy', '2007-07-23', 7, 2007),
('JV1023', 2003, NULL, -2000, 'Receipt from Randy', '2007-07-23', 7, 2007);

delete from stock_movement_t;
INSERT INTO stock_movement_t (`Doc_No_VC`, `Date_DT`, `Pdt_ID_VC`, `Qty_NU`, `Unit_Price_TI`, `Descrip_VC`) VALUES
('JV1002', '2007-06-03', '1235', -50, 2, 'Do103'),
('JV1003', '2006-07-20', '1234', -60, 5, 'GRN001'),
('JV1000', '2007-05-12', '1234', -30, 5, 'DO100'),
('JV1004', '2006-07-20', '1234', 30, 6, 'GRN002'),
('JV1005', '2006-07-20', '1235', 110, 2, 'GRN003'),
('JV1001', '2007-08-22', '1234', -30, 5, 'DO102');

delete from stock_balance_t;
INSERT INTO stock_balance_t (`Doc_ID_VC`, `Pdt_ID_VC`, `Qty_NU`, `Unit_Price_TI`, `Date_DT`)  VALUES
('RZE100', '1234', 30.0, 6, '2007-08-22'),
('RST100', '1235', 60.0, 2, '2007-06-03');

delete from purchase_t;
INSERT INTO purchase_t (`Cred_ID_VC`, `Pdt_ID_VC`, `Doc_No_VC`, `Date_DT`, `Status_BT`, `Inv_ID_VC`) VALUES
('CRE101', '1234', 'JV1003', '2006-07-20', false, 'IN100'),
('CRE101', '1234', 'JV1004', '2006-07-20', false, 'IN101'),
('CRE100', '1235', 'JV1005', '2006-07-20', false, 'IN102'),
('CRE103', null, 'JV1010', '2006-12-28', true, '1256'),
('CRE102', null, 'JV1013', '2007-02-20', false, '1257');

delete from creditor_t;
INSERT INTO creditor_t (`Cred_ID_VC`, `Cred_Name_VC`, `Cred_Add_VC`, `Cred_Contact_VC`, `Credit_Term_TI`, `Cred_Code_IN`) VALUES
('CRE101', 'Supplier1', '56th Georgia', '458787', 30, 3000),
('CRE100', 'Supplier2', '34th Alm Street', '145432', 45, 3000),
('CRE103', 'Furniture2', '7th Roland', '121212', 60, 3000),
('CRE102', 'Furniture1', '7th Roland', '121212', 45, 3000);

delete from sale_t;
INSERT INTO sale_t (`Doc_No_VC`, `Pdt_ID_VC`, `Inv_ID_VC`, `Cust_ID_VC`, `Date_DT`, `Status_BT`) VALUES
('JV1000', '1235', 'INV100', 'CUST100', '2018-10-17', true),
('JV1001', '1234', 'INV101', 'CUST101', '2018-10-17', true),
('JV1002', '1234', 'INV102', 'CUST102', '2018-06-03', false);

delete from customer_t;
INSERT INTO customer_t (`Cust_ID_VC`, `Cust_Name_VC`, `Cust_Add_VC`, `Cust_Contact_VC`, `Credit_Term_TI`, `Cust_Code_VC`) VALUES
('CUST100', 'William', '44th Avenue', '7879888', 30, '2003'),
('CUST101', 'Randy', '12th Solrode', '121211', 45, '2003'),
('CUST102', 'Hulete', '11th Palm Beach', '455454', 60, '2003');

delete from product_category_t;
INSERT INTO product_category_t (`Pdt_Category_VC`, `Category_Name_VC`, `GL_ID`) VALUES
('PDT100', 'Software', 5002),
('PDT100', 'Software', 6002),
('PDT101', 'Hardware', 5001),
('PDT101', 'Hardware', 6001);

delete from cash_t;
INSERT INTO cash_t (`Doc_No_VC`, `Cash_Type_VC`, `Cash_Category_VC`, `Chq_No_VC`, `Bank_Code_VC`) VALUES
('JV1017', 'OA', 'OA_Int', '745570', 'CITI'),
('JV1018', 'OA', 'OA_Int', '745571', 'CITI'),
('JV1019', 'IA', 'IA_Int', '44511', 'CITI'),
('JV1020', 'FA', 'FA_Cap', '8875', 'CITI'),
('JV1021', 'IA', 'IA_Pur', '745571', 'CITI'),
('JV1022', 'OA', 'OA_Deb', '95454', 'CITI'),
('JV1023', 'OA', 'OA_Deb', '12454', 'CITI');

delete from bank_statement;
INSERT INTO bank_statement (`Date`, `Chq_No`, `Detail`, `Amt`, `Period_TI`, `Year_SI`) VALUES
('2007-02-02', 88258, 'Inward TT', -1400.0, 2, 2007),
('2007-02-17', 740244, 'Chq clearance', -1500.0, 2, 2007),
('2007-08-26', 95454, 'Receipt Frm William', -2000.0, 8, 2007),
('2007-07-25', 44511, 'Interest From Bank', -250.0, 7, 2007);

delete from fixedasset_t;
INSERT INTO fixedasset_t (`FA_ID_IN`, `FA_Type_VC`, `FA_Category_VC`, `FA_Descrip_VC`, `Doc_No_VC`) VALUES
(100, 'CE', 'Deprn', 'Deprn', 'JV1012'),
(100, 'CE', 'DispCost', 'DispCost', 'JV1011'),
(100, 'CE', 'DispDeprn', 'DispDeprn', 'JV1011'),
(101, 'OE', 'Cost', 'OfficeEquip', 'JV1010'),
(101, 'OE', 'Deprn', 'Deprn', 'JV1012'),
(101, 'OE', 'DispCost', 'DispCost', 'JV1011'),
(101, 'OE', 'DispDeprn', 'DispDeprn', 'JV1011'),
(102, 'FF', 'Cost', 'Furniture', 'JV1010'),
(102, 'FF', 'Deprn', 'Deprn', 'JV1012'),
(102, 'FF', 'DispCost', 'DispCost', 'JV1011'),
(102, 'FF', 'DispDeprn', 'DispDeprn', 'JV1011'),
(100, 'CE', 'Cost', 'CompEquip', 'JV1013'),
(100, 'CE', 'Deprn', 'Deprn', 'JV1014'),
(100, 'CE', 'DispCost', 'DispCost', 'JV1015'),
(100, 'CE', 'DispDeprn', 'DispDeprn', 'JV1016'),
(101, 'CE', 'Cost', 'OfficeEquip', 'JV1013'),
(101, 'OE', 'Deprn', 'Deprn', 'JV1014'),
(101, 'OE', 'DispCost', 'DispCost', 'JV1015'),
(101, 'OE', 'DispDeprn', 'DispDeprn', 'JV1016'),
(102, 'FF', 'Cost', 'Furniture', 'JV1013'),
(102, 'FF', 'Deprn', 'Deprn', 'JV1014'),
(102, 'FF', 'DispCost', 'DispCost', 'JV1015'),
(102, 'FF', 'DispDeprn', 'DispDeprn', 'JV1016'),
(100, 'CE', 'Cost', 'CompEquip', 'JV1010');


