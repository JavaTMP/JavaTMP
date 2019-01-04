INSERT INTO accountingdb.`transaction` (code, `voucherTypeId`, `transactionDate`, note, `specialNumber`, entity, status, `creationDate`)
	VALUES ('1', 1, '2018-12-15 20:00:00.0', 'owner invensting', '0501558912', NULL, 1, '2018-12-16 17:50:11.0');
INSERT INTO accountingdb.`transaction` (code, `voucherTypeId`, `transactionDate`, note, `specialNumber`, entity, status, `creationDate`)
	VALUES ('2', 1, '2018-12-15 20:00:00.0', 'withdrawing from bank', '0501558912', NULL, 1, '2018-12-16 17:50:45.0');
INSERT INTO accountingdb.`transaction` (code, `voucherTypeId`, `transactionDate`, note, `specialNumber`, entity, status, `creationDate`)
	VALUES ('2', 1, '2018-12-15 20:00:00.0', 'withdrawing from bank', '0501558912', NULL, 1, '2018-12-16 17:51:01.0');
INSERT INTO accountingdb.`transaction` (code, `voucherTypeId`, `transactionDate`, note, `specialNumber`, entity, status, `creationDate`)
	VALUES ('4444', 1, '2018-12-16 20:00:00.0', 'test', '5444', '3333', 1, '2018-12-16 20:41:31.0');
INSERT INTO accountingdb.`transaction` (code, `voucherTypeId`, `transactionDate`, note, `specialNumber`, entity, status, `creationDate`)
	VALUES ('55', 1, '2018-12-16 20:00:00.0', NULL, NULL, NULL, 1, '2018-12-17 18:08:28.0');
INSERT INTO accountingdb.`transaction` (code, `voucherTypeId`, `transactionDate`, note, `specialNumber`, entity, status, `creationDate`)
	VALUES ('55', 1, '2018-12-16 20:00:00.0', NULL, NULL, NULL, 1, '2018-12-17 18:08:56.0');
INSERT INTO accountingdb.`transaction` (code, `voucherTypeId`, `transactionDate`, note, `specialNumber`, entity, status, `creationDate`)
	VALUES ('555', 1, '2018-12-29 20:00:00.0', NULL, NULL, NULL, 1, '2018-12-30 01:27:49.0');
INSERT INTO accountingdb.`transaction` (code, `voucherTypeId`, `transactionDate`, note, `specialNumber`, entity, status, `creationDate`)
	VALUES ('3321', 1, '2018-12-29 20:00:00.0', NULL, NULL, NULL, 1, '2018-12-30 01:33:52.0');
INSERT INTO accountingdb.`transaction` (code, `voucherTypeId`, `transactionDate`, note, `specialNumber`, entity, status, `creationDate`)
	VALUES ('4333', 1, '2018-12-30 20:00:00.0', NULL, NULL, NULL, 1, '2018-12-31 18:37:24.0');
INSERT INTO accountingdb.`transaction` (code, `voucherTypeId`, `transactionDate`, note, `specialNumber`, entity, status, `creationDate`)
	VALUES ('4333', 1, '2018-12-30 20:00:00.0', NULL, NULL, NULL, 1, '2018-12-31 18:37:36.0');
INSERT INTO accountingdb.`transaction` (code, `voucherTypeId`, `transactionDate`, note, `specialNumber`, entity, status, `creationDate`)
	VALUES ('4333', 1, '2018-12-30 20:00:00.0', NULL, NULL, NULL, 1, '2018-12-31 18:37:56.0');
INSERT INTO accountingdb.`transaction` (code, `voucherTypeId`, `transactionDate`, note, `specialNumber`, entity, status, `creationDate`)
	VALUES ('852147', 1, '2018-12-30 20:00:00.0', 'testing', '500', '44', 1, '2018-12-31 18:50:11.0');
INSERT INTO accountingdb.`transaction` (code, `voucherTypeId`, `transactionDate`, note, `specialNumber`, entity, status, `creationDate`)
	VALUES ('700', 1, '2018-12-30 20:00:00.0', '159842', '150', '500', 1, '2018-12-31 18:52:33.0');

INSERT INTO accountingdb.accounttransaction (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`, description, status, amount)
	VALUES (1, NULL, NULL, NULL, 65, NULL, 1, 50000.00000000);
INSERT INTO accountingdb.accounttransaction (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`, description, status, amount)
	VALUES (1, NULL, NULL, NULL, 27, NULL, 1, -50000.00000000);
INSERT INTO accountingdb.accounttransaction (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`, description, status, amount)
	VALUES (2, NULL, NULL, NULL, 10, NULL, 1, 1000.00000000);
INSERT INTO accountingdb.accounttransaction (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`, description, status, amount)
	VALUES (2, NULL, NULL, NULL, 65, NULL, 1, -1000.00000000);
INSERT INTO accountingdb.accounttransaction (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`, description, status, amount)
	VALUES (3, NULL, NULL, NULL, 8, NULL, 1, 10000.00000000);
INSERT INTO accountingdb.accounttransaction (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`, description, status, amount)
	VALUES (3, NULL, NULL, NULL, 65, NULL, 1, -10000.00000000);
INSERT INTO accountingdb.accounttransaction (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`, description, status, amount)
	VALUES (4, 2, 4, 2, 23, NULL, 1, 250.00000000);
INSERT INTO accountingdb.accounttransaction (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`, description, status, amount)
	VALUES (4, 3, 8, 3, 24, NULL, 1, -250.00000000);
INSERT INTO accountingdb.accounttransaction (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`, description, status, amount)
	VALUES (5, NULL, NULL, NULL, 8, NULL, 1, 250.00000000);
INSERT INTO accountingdb.accounttransaction (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`, description, status, amount)
	VALUES (5, NULL, NULL, NULL, 10, NULL, 1, -250.00000000);
INSERT INTO accountingdb.accounttransaction (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`, description, status, amount)
	VALUES (6, NULL, NULL, NULL, 65, NULL, 1, 5000.00000000);
INSERT INTO accountingdb.accounttransaction (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`, description, status, amount)
	VALUES (6, NULL, NULL, NULL, 27, NULL, 1, -5000.00000000);
INSERT INTO accountingdb.accounttransaction (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`, description, status, amount)
	VALUES (7, NULL, NULL, NULL, 8, NULL, 1, 100.00000000);
INSERT INTO accountingdb.accounttransaction (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`, description, status, amount)
	VALUES (7, NULL, NULL, NULL, 10, NULL, 1, -100.00000000);
INSERT INTO accountingdb.accounttransaction (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`, description, status, amount)
	VALUES (8, NULL, NULL, NULL, 8, NULL, 1, 500.25000000);
INSERT INTO accountingdb.accounttransaction (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`, description, status, amount)
	VALUES (8, NULL, NULL, NULL, 10, NULL, 1, -400.00000000);
INSERT INTO accountingdb.accounttransaction (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`, description, status, amount)
	VALUES (8, NULL, NULL, NULL, 65, NULL, 1, -100.25000000);
INSERT INTO accountingdb.accounttransaction (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`, description, status, amount)
	VALUES (9, NULL, NULL, NULL, 12, NULL, 1, 100.00000000);
INSERT INTO accountingdb.accounttransaction (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`, description, status, amount)
	VALUES (9, NULL, NULL, NULL, 31, NULL, 1, -100.00000000);
INSERT INTO accountingdb.accounttransaction (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`, description, status, amount)
	VALUES (10, NULL, NULL, NULL, 12, NULL, 1, 250.00000000);
INSERT INTO accountingdb.accounttransaction (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`, description, status, amount)
	VALUES (10, NULL, NULL, NULL, 31, NULL, 1, -250.00000000);
INSERT INTO accountingdb.accounttransaction (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`, description, status, amount)
	VALUES (11, NULL, NULL, NULL, 12, NULL, 1, 500.00000000);
INSERT INTO accountingdb.accounttransaction (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`, description, status, amount)
	VALUES (11, NULL, NULL, NULL, 31, NULL, 1, -500.00000000);
INSERT INTO accountingdb.accounttransaction (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`, description, status, amount)
	VALUES (12, NULL, NULL, NULL, 12, 'for test only', 1, 0E-8);
INSERT INTO accountingdb.accounttransaction (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`, description, status, amount)
	VALUES (12, NULL, NULL, NULL, 30, 'customer #333', 1, 0E-8);
INSERT INTO accountingdb.accounttransaction (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`, description, status, amount)
	VALUES (13, 1, 1, 1, 12, NULL, 1, 250.00000000);
INSERT INTO accountingdb.accounttransaction (`transactionId`, `moduleId`, `moduleTypeId`, `moduleRefId`, `accountId`, description, status, amount)
	VALUES (13, 5, 17, 2, 40, NULL, 1, -250.00000000);

