/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  JavaTMP
 * Created: Oct 19, 2018
 */
DROP TABLE IF EXISTS acctTransCtCenter;
DROP TABLE IF EXISTS costCenter;
DROP TABLE IF EXISTS accountTransaction;
DROP TABLE IF EXISTS account;
DROP TABLE IF EXISTS accountGroup;
DROP TABLE IF EXISTS accountType;
DROP TABLE IF EXISTS `transaction`;
DROP TABLE IF EXISTS `voucherType`;
DROP TABLE IF EXISTS moduleType;
DROP TABLE IF EXISTS module;

CREATE TABLE accountType (
    id int(1) UNSIGNED not null,
    name varchar(32) not null,
    debitSign int(1) not null,
    creditSign int(1) not null,
    CONSTRAINT accountType_id_pk PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO accountType (id, name, debitSign, creditSign) VALUES
(1, 'Asset account', +1, -1),
(2, 'Liability account', -1, +1),
(3, 'Capital (Owner''s Equity) account', -1, +1),
(4, 'Revenue account', -1, +1),
(5, 'Expense account', +1, -1);

CREATE TABLE accountGroup (
    id int(3) UNSIGNED not null,
    name varchar(32) not null,
    description varchar(1024),
    accountType int(1) UNSIGNED,
    CONSTRAINT accountGroup_id_pk PRIMARY KEY (id),
    CONSTRAINT accountGroup_accountType_fk FOREIGN KEY (accountType) REFERENCES accountType (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO accountGroup (id, name, description, accountType) VALUES
(1, 'Asset account', 'Asset account', 1),
(2, 'Liability account', 'Liability account', 2),
(3, 'Equity account', 'Capital (Owner''s Equity) account', 3),
(4, 'Income account', 'Income account', 4),
(5, 'Cost account', 'Cost account', 5),
(6, 'Expense account', 'Expense account', 5);

CREATE TABLE account (
    id BIGINT UNSIGNED not null AUTO_INCREMENT,
    accountCode varchar(32) not null,
    name varchar(64) not null,
    description varchar(1024),
    accountGroup int(3) UNSIGNED,
    debit DECIMAL(32,8),
    credit DECIMAL(32,8),
    balance DECIMAL(33,8),
    status TINYINT,
    cashFlowId TINYINT,
    creationDate TIMESTAMP NOT NULL,
    parentAccountId BIGINT UNSIGNED,
    CONSTRAINT account_id_pk PRIMARY KEY (id),
    CONSTRAINT account_accountGroup_fk FOREIGN KEY (accountGroup) REFERENCES accountGroup (id),
    CONSTRAINT account_parentAccountId_fk FOREIGN KEY (parentAccountId) REFERENCES account (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO account (id, `accountCode`, `name`, description, `accountGroup`, debit, credit, balance, status, `creationDate`, `parentAccountId`)
VALUES (1, '100', 'Main Company Chart Of Accounts', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', NULL),
(2, '100100', 'Asset Accounts', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 1),
(3, '100200', 'Lability Accounts', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 1),
(4, '100300', 'Equity Accounts', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 1),
(5, '100400', 'Revenue Accounts', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 1),
(6, '100500', 'Expense Accounts', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 1),
(7, '100100100', 'Current Assets', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 2),
(8, '100100200', 'Fixed Assets', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 2),
(9, '100100300', 'Other Assets', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 2),
(10, '100100101', 'Petty cash', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 7),
(11, '100100102', 'Cash on hand', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 7),
(12, '100100103', 'Accounts receivable', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 7),
(13, '100100201', 'Furniture and fixtures', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 8),
(14, '100100202', 'Vehicles', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 8),
(15, '100100203', 'Factory manufacturing equipment', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 8),
(16, '100100204', 'Buildings', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 8),
(17, '100100205', 'Land', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 8),
(18, '100100206', 'Accumulated depreciation, furniture, fixtures', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 8),
(19, '100100301', 'Accumulated amortization', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 9),
(20, '100100302', 'Notes receivable, non-current', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 9),
(21, '100200100', 'Current Liabilities', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 3),
(22, '100200200', 'Long-Term Liabilities', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 3),
(23, '100200101', 'Accounts payable', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 21),
(24, '100200102', 'Payroll payable', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 21),
(25, '100200201', 'Bonds payable', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 22),
(26, '100200202', 'Bank loans payable', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 22),
(27, '100301', 'Owner capital', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 4),
(28, '100302', 'Retained earnings', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 4),
(29, '100303', 'Dividends', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 4),
(30, '100401', 'Product sales revenues', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 5),
(31, '100402', 'Services sales', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 5),
(32, '100500100', 'Cost of Goods Sold', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 6),
(33, '100500200', 'Other', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 6),
(34, '100500101', 'Raw materials costs', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 32),
(35, '100500102', 'Direct labor costs', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 32),
(36, '100500201', 'Advertising Expense', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 33),
(37, '100500202', 'Salary and Wage Expense', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 33),
(38, '100500203', 'Depreciation Expense', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 33),
(39, '100500204', 'Other expenses', 'description', NULL, 0, 0, 0, 1, '2018-12-02 00:00:00.0', 33);

CREATE TABLE module (
    id BIGINT UNSIGNED not null AUTO_INCREMENT,
    name varchar(128),
    description varchar(1024),
    status TINYINT,
    creationDate TIMESTAMP NOT NULL,
    CONSTRAINT module_id_pk PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `module` (id, `name`, description, status, `creationDate`) VALUES
(1, 'Customers', 'Customers', 1, DEFAULT),
(2, 'Suppliers', 'Suppliers', 1, DEFAULT),
(3, 'Employee', 'Employee', 1, DEFAULT),
(4, 'Fixed Assets', 'Fixed Assets', 1, DEFAULT),
(5, 'Inventory', 'Inventory', 1, DEFAULT);

CREATE TABLE moduleType (
    id int not null AUTO_INCREMENT,
    moduleId BIGINT UNSIGNED not null,
    name varchar(128) not null,
    description varchar(1024),
    status TINYINT,
    creationDate TIMESTAMP NOT NULL,
    CONSTRAINT moduleType_id_pk PRIMARY KEY (id),
    CONSTRAINT moduelType_moduleId_fk FOREIGN KEY (moduleId) REFERENCES module (id),
    CONSTRAINT moduleId_name_uni UNIQUE KEY (moduleId, name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO moduleType (`moduleId`, `name`, description, status, `creationDate`) VALUES
(1, 'Trade Receivable', null, 1, default),
(1, 'PDC - Collection', null, 1, default),
(1, 'Returne CHQ - Collection', null, 1, default),

(2, 'Trade Payable', null, 1, default),
(2, 'PDC - Payment', null, 1, default),
(2, 'Returne CHQ - Payments', null, 1, default),

(3, 'Payroll', null, 1, default),
(3, 'Annual Leave', null, 1, default),
(3, 'Unpaid Leave', null, 1, default),
(3, 'Employee Advances', null, 1, default),
(3, 'End Of Service', null, 1, default),

(4, 'Purchase', null, 1, default),
(4, 'Depreciation', null, 1, default),
(4, 'Sale - Cost Disposal', null, 1, default),
(4, 'Sale - Acc. Disposal', null, 1, default),
(4, 'Sale - Profit', null, 1, default),

(5, 'Purchase', null, 1, default),
(5, 'Sale - Inventory', null, 1, default),
(5, 'Sale - Cost', null, 1, default),
(5, 'Wastage/Writte-off', null, 1, default);

CREATE TABLE voucherType (
    id int not null AUTO_INCREMENT,
    name varchar(128) not null,
    description varchar(1024),
    status TINYINT,
    creationDate TIMESTAMP NOT NULL,
    CONSTRAINT transactionType_id_pk PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO voucherType (`name`, description, status, `creationDate`)
	VALUES ('General Ledger Voucher', 'General Ledger Voucher', 1, DEFAULT);

CREATE TABLE transaction (
    id BIGINT UNSIGNED not null AUTO_INCREMENT,
    code varchar(1024),
    voucherTypeId int not null,
    transactionDate DATETIME not null,
    note varchar(1024),
    specialNumber varchar(64),
    entity varchar(64),
    status TINYINT,
    creationDate TIMESTAMP NOT NULL,
    CONSTRAINT transaction_id_pk PRIMARY KEY (id),
    CONSTRAINT transaction_voucherTypeId_fk FOREIGN KEY (voucherTypeId) REFERENCES voucherType (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE accountTransaction (
    id BIGINT UNSIGNED not null AUTO_INCREMENT,
    transactionId BIGINT UNSIGNED not null,
    moduleId BIGINT UNSIGNED,
    moduleTypeId int,
    moduleRefId BIGINT UNSIGNED,
    accountId BIGINT UNSIGNED not null,
    description varchar(1024),
    status TINYINT,
    amount DECIMAL(33,8),
    CONSTRAINT acctTrans_id_pk PRIMARY KEY (id),
    CONSTRAINT acctTrans_tranId_fk FOREIGN KEY (transactionId) REFERENCES transaction (id),
    CONSTRAINT acctTrans_acctId_fk FOREIGN KEY (accountId) REFERENCES account (id),
    CONSTRAINT acctTrans_moduleId_fk FOREIGN KEY (moduleId) REFERENCES module (id),
    CONSTRAINT acctTrans_moduleTypeId_fk FOREIGN KEY (moduleTypeId) REFERENCES moduleType (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE costCenter (
    id BIGINT UNSIGNED not null AUTO_INCREMENT,
    name varchar(128) not null,
    parentId BIGINT UNSIGNED,
    description varchar(1024),
    status TINYINT,
    creationDate TIMESTAMP NOT NULL,
    CONSTRAINT costCenter_id_pk PRIMARY KEY (id),
    CONSTRAINT costCenter_parentId_fk FOREIGN KEY (parentId) REFERENCES costCenter (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO accountingdb.costcenter (`name`, `parentId`, description, status, `creationDate`) VALUES
('car1', NULL, '', 1, DEFAULT),
('car2', NULL, '', 1, DEFAULT),
('project 2', NULL, '', 1, DEFAULT),
('car 4', NULL, '', 1, DEFAULT),
('ciggertte', NULL, '', 1, DEFAULT),
('car41', NULL, '', 1, DEFAULT),
('traffic fine', NULL, '', 1, DEFAULT),
('project 5', NULL, '', 1, DEFAULT),
('project 8', NULL, '', 1, DEFAULT),
('car 11', NULL, '', 1, DEFAULT),
('hotel 3', NULL, '', 1, DEFAULT);


CREATE TABLE acctTransCtCenter (
    accountTransactionId BIGINT UNSIGNED not null,
    costCenterId BIGINT UNSIGNED not null,
    CONSTRAINT acctTransCtCent_pk PRIMARY KEY (accountTransactionId, costCenterId),
    CONSTRAINT acctTransCtCent_acctTransId_fk FOREIGN KEY (accountTransactionId) REFERENCES accountTransaction (id),
    CONSTRAINT acctTransCtCent_ctCentId_fk FOREIGN KEY (costCenterId) REFERENCES costCenter (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE customer (
    id BIGINT UNSIGNED not null AUTO_INCREMENT,
    name varchar(128) not null,
    status TINYINT,
    creationDate TIMESTAMP NOT NULL,
    CONSTRAINT customer_id_pk PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO accountingdb.customer (`name`, status, `creationDate`) VALUES
('Mohamed Darim', 1, DEFAULT),
('Mohamed Ta7seen', 1, DEFAULT),
('Ahmad Mohamed', 1, DEFAULT),
('Reem Mohamed', 1, DEFAULT);



