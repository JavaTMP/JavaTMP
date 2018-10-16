delete from coa_t;

INSERT INTO coa_t (`GL_ID`, `GL_Name_VC`, `BS_Category_VC`, `Segment_VC`, `Status_BT`) VALUES
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

INSERT INTO accounting.stock_movement_t (`Doc_No_VC`, `Date_DT`, `Pdt_ID_VC`, `Qty_NU`, `Unit_Price_TI`, `Descrip_VC`) VALUES
('JV1002', '2007-06-03', '1235', -50, 2, 'Do103'),
('JV1003', '2006-07-20', '1234', -60, 5, 'GRN001'),
('JV1000', '2007-05-12', '1234', -30, 5, 'DO100'),
('JV1004', '2006-07-20', '1234', 30, 6, 'GRN002'),
('JV1005', '2006-07-20', '1235', 110, 2, 'GRN003'),
('JV1001', '2007-08-22', '1234', -30, 5, 'DO102');
