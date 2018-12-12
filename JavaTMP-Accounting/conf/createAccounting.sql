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

DROP TABLE IF EXISTS customerAccount;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS moduleType;
DROP TABLE IF EXISTS module;

DROP TABLE IF EXISTS account;
DROP TABLE IF EXISTS accountGroup;
DROP TABLE IF EXISTS accountType;
DROP TABLE IF EXISTS `transaction`;
DROP TABLE IF EXISTS `voucherType`;

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
(4, 'Revenue/Income account', -1, +1),
(5, 'Expense/Cost account', +1, -1);

CREATE TABLE accountGroup (
    id int(3) UNSIGNED not null,
    name varchar(32) not null,
    description varchar(1024),
    accountType int(1) UNSIGNED,
    reportTypeId int unsigned,
    CONSTRAINT accountGroup_id_pk PRIMARY KEY (id),
    CONSTRAINT accountGroup_accountType_fk FOREIGN KEY (accountType) REFERENCES accountType (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- reportTypeId --> 1: Balance Sheet, 2: Profit and Loss
INSERT INTO accountGroup (id, name, description, accountType, reportTypeId) VALUES
(1, 'Current Assets', 'Current Assets', 1, 1),
(2, 'Non Current Assets', 'Non Current Assets', 1, 1),

(3, 'Current Libilities', 'Current Libilities', 2, 1),
(4, 'Non Current Libilities', 'Non Current Libilities', 2, 1),

(5, 'Capital', 'Capital', 3, 1),
(6, 'Current Account', 'Current Account', 3, 1),
(7, 'Retained Earning', 'Retained Earning', 3, 1),
(8, 'Profit and Loss', 'Profit and Loss', 3, 1),
(9, 'OCI', 'OCI', 3, 1),

(10, 'Income', 'Income', 4, 2),
(11, 'Other Income', 'Other Income', 4, 2),

(12, 'Cost', 'Cost', 5, 2),
(13, 'Operating Cost', 'Operating Cost', 5, 2),
(14, 'Expenses', 'Expenses', 5, 2),
(15, 'Other Losses', 'Other Losses', 5, 2);

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

INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (2,'100100','Asset Accounts','description',NULL,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 12:00:00',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (3,'100200','Lability Accounts','description',NULL,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 12:00:00',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (4,'100300','Equity Accounts','description',NULL,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 12:00:00',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (5,'100400','Revenue Accounts','description',10,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 12:00:00',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (6,'100500','Cost','description',12,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 12:00:00',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (7,'100100100','Current Assets','description',1,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 12:00:00',2);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (8,'100100200','Fixed Assets','description',2,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 12:00:00',2);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (9,'100100300','Other Assets','description',2,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 12:00:00',2);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (10,'100100101','Petty cash','description',1,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 08:15:18',7);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (12,'100100103','Accounts receivable','description',1,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 08:15:18',7);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (19,'100100301','Accumulated amortization','description',2,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 08:17:00',9);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (20,'100100302','Notes receivable, non-current','description',2,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 08:17:00',9);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (21,'100200100','Current Liabilities','description',3,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 12:00:00',3);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (22,'100200200','Long-Term Liabilities','description',4,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 12:00:00',3);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (23,'100200101','Accounts payable','description',3,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 12:00:00',21);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (24,'100200102','Payroll payable','description',3,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 12:00:00',21);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (25,'100200201','Bonds payable','description',4,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 12:00:00',22);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (26,'100200202','Bank loans payable','description',4,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 12:00:00',22);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (27,'100301','Owner capital','description',5,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 08:18:56',4);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (28,'100302','Retained earnings','description',5,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 08:18:56',4);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (29,'100303','Dividends','description',5,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 08:18:56',4);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (30,'100401','Product sales revenues','description',10,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 08:23:29',5);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (31,'100402','Services sales','description',10,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 08:23:29',5);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (32,'100500100','Cost of Goods Sold','description',12,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 08:28:07',6);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (33,'100500200','Other','description',12,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 08:28:07',6);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (34,'100500101','Raw materials costs','description',12,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 08:28:07',32);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (35,'100500102','Direct labor costs','description',12,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 08:28:07',32);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (36,'100500201','Advertising Expense','description',12,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 08:28:07',33);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (37,'100500202','Salary and Wage Expense','description',12,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 08:28:07',33);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (38,'100500203','Depreciation Expense','description',12,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 08:28:07',33);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (39,'100500204','Other expenses','description',12,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 08:28:07',33);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (40,'100100104','Inventory','description',1,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 12:00:00',7);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (41,'100600','Other Income','description',11,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 12:00:00',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (42,'100600100','Gain or Profit On Fixed Assets Sales','description',11,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 12:00:00',41);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (43,'100700','Other Losses','description',15,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 12:00:00',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (44,'100700100','Inventory Written Off','description',15,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 12:00:00',43);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (45,'10010010301','Trade Receivable','description',1,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 10:23:46',12);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (46,'10010010302','PDC - Collection','description',1,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 10:24:31',12);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (47,'10010010303','Retune CHQ - Collection','description',1,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 10:26:03',12);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (48,'10020010101','Trade Payable','description',3,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 10:27:44',23);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (49,'10020010102','PDC - Payment','description',3,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 10:28:30',23);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (50,'10020010103','Retune CHQ - Payments','description',3,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 10:29:18',23);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (51,'10020010201','Payroll','description',3,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 10:30:19',24);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (52,'10020010202','Annual Leave','description',3,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 10:32:37',24);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (53,'10020010203','Unpaid Leave','description',3,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 10:33:24',24);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (54,'10020010204','Employee Advances','description',3,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 10:33:38',24);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (55,'100200203','End Of Service','description',4,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 10:35:14',22);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (56,'100100201','Purchase','description',2,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 10:45:20',8);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (57,'100100202','Depreciation','description',2,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 10:45:31',8);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (58,'100100203','Sale - Cost Disposal','description',2,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 10:45:51',8);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (59,'100100204','Sale - Acc. Disposal','description',2,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 10:46:06',8);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (61,'10010010401','Purchase','description',1,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 10:50:39',40);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (62,'10010010402','Sale - Inventory','description',1,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 10:51:33',40);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (63,'100500101','Sale - Cost','description',12,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 10:53:00',32);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (64,'100700101','Wastage/Write-off','description',15,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 10:54:11',44);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (65,'100100105','Bank','description',1,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 15:16:38',7);

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
    rootAccountId BIGINT UNSIGNED not null,
    creationDate TIMESTAMP NOT NULL,
    CONSTRAINT moduleType_id_pk PRIMARY KEY (id),
    CONSTRAINT moduelType_moduleId_fk FOREIGN KEY (moduleId) REFERENCES module (id),
    CONSTRAINT moduleType_rootAccountId_fk FOREIGN KEY (rootAccountId) REFERENCES account (id),
    CONSTRAINT moduleId_name_uni UNIQUE KEY (moduleId, name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO moduleType (id, `moduleId`, `name`, description, status, `rootAccountId`, `creationDate`) VALUES
(1, 1, 'Trade Receivable', null, 1, 45, default),
(2, 1, 'PDC - Collection', null, 1, 46, default),
(3, 1, 'Returne CHQ - Collection', null, 1, 47, default),

(4, 2, 'Trade Payable', null, 1, 48, default),
(5, 2, 'PDC - Payment', null, 1, 49, default),
(6, 2, 'Returne CHQ - Payments', null, 1, 50, default),

(7, 3, 'Payroll', null, 1, 51, default),
(8, 3, 'Annual Leave', null, 1, 52, default),
(9, 3, 'Unpaid Leave', null, 1, 53, default),
(10, 3, 'Employee Advances', null, 1, 54, default),
(11, 3, 'End Of Service', null, 1, 55, default),

(12, 4, 'Purchase', null, 1, 56, default),
(13, 4, 'Depreciation', null, 1, 57, default),
(14, 4, 'Sale - Cost Disposal', null, 1, 58, default),
(15, 4, 'Sale - Acc. Disposal', null, 1, 59, default),
(16, 4, 'Sale - Profit', null, 1, 42, default),

(17, 5, 'Purchase', null, 1, 61, default),
(18, 5, 'Sale - Inventory', null, 1, 62, default),
(19, 5, 'Sale - Cost', null, 1, 63, default),
(20, 5, 'Wastage/Writte-off', null, 1, 64, default);

CREATE TABLE voucherType (
    id int not null AUTO_INCREMENT,
    name varchar(128) not null,
    description varchar(1024),
    status TINYINT,
    creationDate TIMESTAMP NOT NULL,
    CONSTRAINT transactionType_id_pk PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO voucherType (id, `name`, description, status, `creationDate`) VALUES
(1, 'Journal Voucher', 'Journal Voucher', 1, DEFAULT);

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

INSERT INTO customer (`name`, status, `creationDate`) VALUES
('Mohamed Darim', 1, DEFAULT),
('Mohamed Ta7seen', 1, DEFAULT),
('Ahmad Mohamed', 1, DEFAULT),
('Reem Mohamed', 1, DEFAULT);

CREATE TABLE customerAccount (
    customerId BIGINT UNSIGNED not null,
    moduleTypeId int not null,
    accountId BIGINT UNSIGNED not null,
    CONSTRAINT customerAccount_pk PRIMARY KEY (customerId, moduleTypeId, accountId),
    CONSTRAINT custAcct_customerId_fk FOREIGN KEY (customerId) REFERENCES customer (id),
    CONSTRAINT custAcct_moduleTypeId_fk FOREIGN KEY (moduleTypeId) REFERENCES moduleType (id),
    CONSTRAINT custAcct_accountId_fk FOREIGN KEY (accountId) REFERENCES account (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- INSERT INTO customeraccount (`customerId`, `moduleTypeId`, `accountId`) VALUES
-- (1, 1, 12);
--
