/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  JavaTMP
 * Created: Oct 19, 2018
 */
DROP TABLE IF EXISTS accountTransaction;
DROP TABLE IF EXISTS account;
DROP TABLE IF EXISTS accountGroup;
DROP TABLE IF EXISTS accountType;
DROP TABLE IF EXISTS moduleTransaction;
DROP TABLE IF EXISTS transaction;
DROP TABLE IF EXISTS transactionType;
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
(3, 'Capital (Owner''s Equity) account', 'Capital (Owner''s Equity) account', 3),
(4, 'Revenue account', 'Revenue account', 4),
(5, 'Expense account', 'Expense account', 5);

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
    creationDate TIMESTAMP NOT NULL,
    parentAccountId BIGINT UNSIGNED,
    CONSTRAINT account_id_pk PRIMARY KEY (id),
    CONSTRAINT account_accountGroup_fk FOREIGN KEY (accountGroup) REFERENCES accountGroup (id),
    CONSTRAINT account_parentAccountId_fk FOREIGN KEY (parentAccountId) REFERENCES account (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO accountingdb.account (id, `accountCode`, `name`, description, `accountGroup`, debit, credit, balance, status, `creationDate`, `parentAccountId`)
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
(1, 'General Ledger Module', 'General Ledger Module', 1, DEFAULT),
(2, 'Customers Management Module', 'Customers Management Module', 1, DEFAULT),
(3, 'Vendors Management Module', 'Vendors Management Module', 1, DEFAULT),
(4, 'Accounts Payable Module', 'Accounts Payable Module', 1, DEFAULT),
(5, 'Accounts Receivable Module', 'Accounts Receivable Module', 1, DEFAULT),
(6, 'Invoice Module', 'Invoice Module', 1, DEFAULT),
(7, 'Inventory Or Stock Module', 'Inventory Or Stock Module', 1, DEFAULT),
(8, 'Purchase Module', 'Purchase Module', 1, DEFAULT),
(9, 'Sales Module', 'Sales Module', 1, DEFAULT),
(10, 'Human Resources Module', 'Human Resources Module', 1, DEFAULT),
(11, 'Payroll Module', 'Payroll Module', 1, DEFAULT),
(12, 'Document Management Module', 'Document Management Module', 1, DEFAULT),
(13, 'Content And Template Management Module', 'Content And Template Management Module', 1, DEFAULT),
(14, 'Alerts And Notifications Module', 'Alerts And Notifications Module', 1, DEFAULT),
(15, 'Procedures And Workflows Management Module', 'Procedures And Workflows Management Module', 1, DEFAULT),
(16, 'Access Control (RBAC) Module', 'Access Control (RBAC) Module', 1, DEFAULT),
(17, 'Point of Sale Module', 'Point of Sale Module', 1, DEFAULT);

CREATE TABLE transactionType (
    id int not null AUTO_INCREMENT,
    name varchar(128) not null,
    description varchar(1024),
    status TINYINT,
    creationDate TIMESTAMP NOT NULL,
    CONSTRAINT transactionType_id_pk PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO accountingdb.transactiontype (id, `name`, description, status, `creationDate`) VALUES
(1, 'General Journal Entry', 'General Journal Entry', 1, default),
(2, 'Cheque', 'Cheque', 1, default),
(3, 'Sales Receipt', 'Sales Receipt', 1, default),
(4, 'Deposit', 'Deposit', 1, default),
(5, 'Invoice', 'Invoice', 1, default),
(6, 'Estimate', 'Estimate', 1, default),
(7, 'Transfer', 'Transfer', 1, default),
(8, 'Bill', 'Bill', 1, default),
(9, 'Credit Card Charge', 'Credit Card Charge', 1, default),
(10, 'Payment', 'Payment', 1, default),
(11, 'Credit Note', 'Credit Note', 1, default),
(12, 'Sales Order', 'Sales Order', 1, default),
(13, 'Bill Pmt -Cheque', 'Bill Pmt -Cheque', 1, default),
(14, 'Bill Pmt -CCard', 'Bill Pmt -CCard', 1, default),
(15, 'Payroll Payment', 'Payroll Payment', 1, default),
(16, 'Liability Cheque', 'Liability Cheque', 1, default);

CREATE TABLE transaction (
    id BIGINT UNSIGNED not null AUTO_INCREMENT,
    referenceCode varchar(1024),
    transactionTypeId int not null,
    moduleId BIGINT UNSIGNED not null,
    transactionDate DATETIME not null,
    description varchar(1024),
    status TINYINT,
    creationDate TIMESTAMP NOT NULL,
    CONSTRAINT transaction_id_pk PRIMARY KEY (id),
    CONSTRAINT transaction_transactionTypeId_fk FOREIGN KEY (transactionTypeId) REFERENCES transactionType (id),
    CONSTRAINT transaction_moduleId_fk FOREIGN KEY (moduleId) REFERENCES module (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE accountTransaction (
    id BIGINT UNSIGNED not null AUTO_INCREMENT,
    transactionId BIGINT UNSIGNED not null,
    accountId BIGINT UNSIGNED not null,
    status TINYINT,
    amount DECIMAL(33,8),
    CONSTRAINT accountTransaction_id_pk PRIMARY KEY (id),
    CONSTRAINT accountTransaction_tranId_fk FOREIGN KEY (transactionId) REFERENCES transaction (id),
    CONSTRAINT accountTransaction_acctId_fk FOREIGN KEY (accountId) REFERENCES account (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE moduleTransaction (
    id BIGINT UNSIGNED not null AUTO_INCREMENT,
    transactionId BIGINT UNSIGNED not null,
    moduleId BIGINT UNSIGNED not null,
    refId BIGINT UNSIGNED not null,
    description varchar(1024),
    status TINYINT,
    creationDate TIMESTAMP NOT NULL,
    CONSTRAINT moduleTransaction_id_pk PRIMARY KEY (id),
    CONSTRAINT moduleTransaction_tranId_fk FOREIGN KEY (transactionId) REFERENCES transaction (id),
    CONSTRAINT moduleTransaction_moduleId_fk FOREIGN KEY (moduleId) REFERENCES module (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

