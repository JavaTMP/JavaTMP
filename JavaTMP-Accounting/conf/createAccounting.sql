
DROP TABLE IF EXISTS acctTransCtCenter;
DROP TABLE IF EXISTS costCenter;

DROP TABLE IF EXISTS accountTransaction;

DROP TABLE IF EXISTS customerAccount;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS supplierAccount;
DROP TABLE IF EXISTS supplier;
DROP TABLE IF EXISTS employeeAccount;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS fixedAssetAccount;
DROP TABLE IF EXISTS fixedAsset;
DROP TABLE IF EXISTS inventoryAccount;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS serviceAccount;
DROP TABLE IF EXISTS service;

DROP TABLE IF EXISTS moduleType;
DROP TABLE IF EXISTS `module`;

DROP TABLE IF EXISTS account;
DROP TABLE IF EXISTS accountGroup;
DROP TABLE IF EXISTS accountType;
DROP TABLE IF EXISTS `transaction`;
DROP TABLE IF EXISTS voucherType;

DROP VIEW IF EXISTS transactionEntry;

CREATE TABLE accountType (
    id int(1) UNSIGNED not null,
    name varchar(32) not null,
    debitSign int(1) not null,
    creditSign int(1) not null,
    reportTypeId int unsigned,
    CONSTRAINT accountType_id_pk PRIMARY KEY (id)
) ENGINE=InnoDB;

INSERT INTO accountType (id, name, debitSign, creditSign, reportTypeId) VALUES
(1, 'Assets', +1, -1, 1),
(2, 'Liabilities', -1, +1, 1),
(3, 'Equity', -1, +1, 1),
(4, 'Revenue/Income', -1, +1, 2),
(5, 'Expense/Cost', +1, -1, 2);
-- (All sum of type 4) - (all sum of type 5) => 3
CREATE TABLE accountGroup (
    id int(3) UNSIGNED not null,
    name varchar(32) not null,
    description varchar(1024),
    accountType int(1) UNSIGNED,
    CONSTRAINT accountGroup_id_pk PRIMARY KEY (id),
    CONSTRAINT accountGroup_accountType_fk FOREIGN KEY (accountType) REFERENCES accountType (id)
) ENGINE=InnoDB;

-- reportTypeId --> 1: Balance Sheet, 2: Profit and Loss
INSERT INTO accountGroup (id, name, description, accountType) VALUES
(1, 'Current Assets', 'Current Assets', 1),
(2, 'Non Current Assets', 'Non Current Assets', 1),

(3, 'Current Libilities', 'Current Libilities', 2),
(4, 'Non Current Libilities', 'Non Current Libilities', 2),

(5, 'Capital', 'Capital', 3),
(6, 'Current Account', 'Current Account', 3),
(7, 'Retained Earning', 'Retained Earning', 3),
(8, 'Profit and Loss', 'Profit and Loss', 3),
(9, 'OCI', 'OCI', 3),

(10, 'Income', 'Income', 4),
(11, 'Other Income', 'Other Income', 4),

(12, 'Cost', 'Cost', 5),
(13, 'Operating Cost', 'Operating Cost', 5),
(14, 'Expenses', 'Expenses', 5),
(15, 'Other Losses', 'Other Losses', 5);

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
) ENGINE=InnoDB;

INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (5,'100400','Revenue Accounts','description',10,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 04:00:00',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (6,'100500','Cost','description',12,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 04:00:00',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (8,'100100200','Fixed Assets','description',2,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 04:00:00',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (10,'100100101','Petty cash','description',1,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 00:15:18',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (12,'100100103','Accounts receivable','description',1,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 00:15:18',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (19,'100100301','Accumulated amortization','description',2,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 00:17:00',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (20,'100100302','Notes receivable, non-current','description',2,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 00:17:00',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (23,'100200101','Accounts payable','description',3,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 04:00:00',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (24,'100200102','Payroll payable','description',3,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 04:00:00',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (25,'100200201','Bonds payable','description',4,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 04:00:00',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (26,'100200202','Bank loans payable','description',4,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 04:00:00',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (27,'100301','Owner capital','description',5,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 00:18:56',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (28,'100302','Retained earnings','description',5,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 00:18:56',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (29,'100303','Dividends','description',5,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 00:18:56',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (30,'100401','Product sales revenues','description',10,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 00:23:29',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (31,'100402','Services sales','description',10,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 00:23:29',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (32,'100500100','Cost of Goods Sold','description',12,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 00:28:07',6);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (33,'100500200','Other','description',12,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 00:28:07',6);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (34,'100500101','Raw materials costs','description',12,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 00:28:07',32);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (35,'100500102','Direct labor costs','description',12,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 00:28:07',32);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (36,'100500201','Advertising Expense','description',12,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 00:28:07',33);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (37,'100500202','Salary and Wage Expense','description',12,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 00:28:07',33);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (38,'100500203','Depreciation Expense','description',12,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 00:28:07',33);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (39,'100500204','Other expenses','description',12,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 00:28:07',33);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (40,'100100104','Inventory','description',1,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 04:00:00',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (41,'100600','Other Income','description',11,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 04:00:00',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (42,'100600100','Gain or Profit On Fixed Assets Sales','description',11,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 04:00:00',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (43,'100700','Other Losses','description',15,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 04:00:00',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (44,'100700100','Inventory Written Off','description',15,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-01 04:00:00',43);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (55,'100200203','End Of Service','description',4,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 02:35:14',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (63,'100500101','Sale - Cost','description',12,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 02:53:00',32);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (64,'100700101','Wastage/Write-off','description',15,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 02:54:11',44);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (65,'100100105','Bank','description',1,0.00000000,0.00000000,0.00000000,1,NULL,'2018-12-12 07:16:38',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (66,'100200103','Sales tax liability','description',3,0.00000000,0.00000000,0.00000000,1,NULL,'2019-01-05 05:09:57',NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (67, '100200104', 'Fedral Tax Authority', 'Fedral Tax Authority', 3, 0E-8, 0E-8, 0E-8, 1, NULL, '2019-03-01 16:29:43.0', NULL);
INSERT INTO `account` (`id`, `accountCode`, `name`, `description`, `accountGroup`, `debit`, `credit`, `balance`, `status`, `cashFlowId`, `creationDate`, `parentAccountId`) VALUES (68, '100403', 'Service Discount', 'Service Discount', 10, 0E-8, 0E-8, 0E-8, 1, NULL, '2019-03-01 17:03:39.0', NULL);

CREATE TABLE `module` (
    id BIGINT UNSIGNED not null AUTO_INCREMENT,
    name varchar(128),
    description varchar(1024),
    status TINYINT,
    creationDate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP ,
    CONSTRAINT module_id_pk PRIMARY KEY (id)
) ENGINE=InnoDB;

INSERT INTO `module` (id, `name`, description, status, `creationDate`) VALUES
(1, 'Customers', 'Customers', 1, DEFAULT),
(2, 'Suppliers', 'Suppliers', 1, DEFAULT),
(3, 'Employee', 'Employee', 1, DEFAULT),
(4, 'Fixed Assets', 'Fixed Assets', 1, DEFAULT),
(5, 'Inventory', 'Inventory', 1, DEFAULT),
(6, 'Service', 'Service', 1, DEFAULT),
(7, 'VAT', 'Value Added Tax', 1, DEFAULT);

CREATE TABLE moduleType (
    id int not null AUTO_INCREMENT,
    moduleId BIGINT UNSIGNED not null,
    name varchar(128) not null,
    description varchar(1024),
    status TINYINT,
    rootAccountId BIGINT UNSIGNED not null,
    creationDate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
    CONSTRAINT moduleType_id_pk PRIMARY KEY (id),
    CONSTRAINT moduelType_moduleId_fk FOREIGN KEY (moduleId) REFERENCES module (id),
    CONSTRAINT moduleType_rootAccountId_fk FOREIGN KEY (rootAccountId) REFERENCES account (id),
    CONSTRAINT moduleId_name_uni UNIQUE KEY (moduleId, name)
) ENGINE=InnoDB;

INSERT INTO moduleType (id, `moduleId`, `name`, description, status, `rootAccountId`, `creationDate`) VALUES
(1, 1, 'Trade Receivable', null, 1, 12, default),
(2, 1, 'PDC - Collection', null, 1, 12, default),
(3, 1, 'Returne CHQ - Collection', null, 1, 12, default),
(21, 1, 'Advance Payment', null, 1, 12, default),

(4, 2, 'Trade Payable', null, 1, 23, default),
(5, 2, 'PDC - Payment', null, 1, 23, default),
(6, 2, 'Returne CHQ - Payments', null, 1, 23, default),
(22, 2, 'Advance Payment', null, 1, 23, default),

(7, 3, 'Payroll', null, 1, 24, default),
(8, 3, 'Annual Leave', null, 1, 24, default),
(9, 3, 'Unpaid Leave', null, 1, 24, default),
(10, 3, 'Employee Advances', null, 1, 24, default),
(11, 3, 'End Of Service', null, 1, 55, default),

(12, 4, 'Purchase', null, 1, 8, default),
(13, 4, 'Depreciation', null, 1, 8, default),
(14, 4, 'Sale - Cost Disposal', null, 1, 8, default),
(15, 4, 'Sale - Acc. Disposal', null, 1, 8, default),
(16, 4, 'Sale - Profit', null, 1, 42, default),

(17, 5, 'Inventory - Purchase', null, 1, 40, default), -- Q+
(18, 5, 'Inventory - Sale', null, 1, 40, default), -- Q-
(19, 5, 'Sale - Cost', null, 1, 32, default),
(20, 5, 'Wastage/Writte-off', null, 1, 64, default),

(23, 6, 'Service Sale Income', null, 1, 31, default),
(24, 6, 'Service Sale Discount', null, 1, 68, default);


CREATE TABLE voucherType (
    id int not null AUTO_INCREMENT,
    name varchar(128) not null,
    description varchar(1024),
    status TINYINT,
    creationDate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
    CONSTRAINT transactionType_id_pk PRIMARY KEY (id)
) ENGINE=InnoDB;

INSERT INTO voucherType (id, `name`, description, status, `creationDate`) VALUES (1, 'Journal Voucher', 'Journal Voucher', 1, DEFAULT);

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
) ENGINE=InnoDB;

CREATE INDEX transaction_transDateASC_ind ON transaction (transactionDate ASC);
CREATE INDEX transaction_transDateDESC_ind ON transaction (transactionDate DESC);

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
    CONSTRAINT acctTrans_moduleId_fk FOREIGN KEY (moduleId) REFERENCES `module` (id),
    CONSTRAINT acctTrans_moduleTypeId_fk FOREIGN KEY (moduleTypeId) REFERENCES moduleType (id)
) ENGINE=InnoDB;

CREATE TABLE costCenter (
    id BIGINT UNSIGNED not null AUTO_INCREMENT,
    name varchar(128) not null,
    parentId BIGINT UNSIGNED,
    description varchar(1024),
    status TINYINT,
    creationDate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
    CONSTRAINT costCenter_id_pk PRIMARY KEY (id),
    CONSTRAINT costCenter_parentId_fk FOREIGN KEY (parentId) REFERENCES costCenter (id)
) ENGINE=InnoDB;

INSERT INTO costCenter (`name`, `parentId`, description, status, `creationDate`) VALUES
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
) ENGINE=InnoDB;

CREATE TABLE customer (
    id BIGINT UNSIGNED not null AUTO_INCREMENT,
    name varchar(128) not null,
    status TINYINT,
    creationDate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
    CONSTRAINT customer_id_pk PRIMARY KEY (id)
) ENGINE=InnoDB;

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
) ENGINE=InnoDB;

CREATE TABLE supplier (
    id BIGINT UNSIGNED not null AUTO_INCREMENT,
    name varchar(128) not null,
    status TINYINT,
    creationDate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
    CONSTRAINT supplier_id_pk PRIMARY KEY (id)
) ENGINE=InnoDB;

INSERT INTO supplier (`name`, status, `creationDate`) VALUES
('Planet Caffee', 1, DEFAULT),
('Lebanases flower', 1, DEFAULT),
('AL Manhal Bakery', 1, DEFAULT),
('Hyundai', 1, DEFAULT);

CREATE TABLE supplierAccount (
    supplierId BIGINT UNSIGNED not null,
    moduleTypeId int not null,
    accountId BIGINT UNSIGNED not null,
    CONSTRAINT supplierAccount_pk PRIMARY KEY (supplierId, moduleTypeId, accountId),
    CONSTRAINT supAcct_supplierId_fk FOREIGN KEY (supplierId) REFERENCES supplier (id),
    CONSTRAINT supAcct_moduleTypeId_fk FOREIGN KEY (moduleTypeId) REFERENCES moduleType (id),
    CONSTRAINT supAcct_accountId_fk FOREIGN KEY (accountId) REFERENCES account (id)
) ENGINE=InnoDB;

CREATE TABLE employee (
    id BIGINT UNSIGNED not null AUTO_INCREMENT,
    name varchar(128) not null,
    status TINYINT,
    creationDate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
    CONSTRAINT employee_id_pk PRIMARY KEY (id)
) ENGINE=InnoDB;

INSERT INTO employee (`name`, status, `creationDate`) VALUES
('Mohamed Darim Wasif Sulibi', 1, DEFAULT),
('Mohamed Ta7sheen', 1, DEFAULT),
('Reem Mohamed', 1, DEFAULT),
('Leen Mohamed', 1, DEFAULT);

CREATE TABLE employeeAccount (
    employeeId BIGINT UNSIGNED not null,
    moduleTypeId int not null,
    accountId BIGINT UNSIGNED not null,
    CONSTRAINT employeeAccount_pk PRIMARY KEY (employeeId, moduleTypeId, accountId),
    CONSTRAINT empAcct_supplierId_fk FOREIGN KEY (employeeId) REFERENCES employee (id),
    CONSTRAINT empAcct_moduleTypeId_fk FOREIGN KEY (moduleTypeId) REFERENCES moduleType (id),
    CONSTRAINT empAcct_accountId_fk FOREIGN KEY (accountId) REFERENCES account (id)
) ENGINE=InnoDB;

CREATE TABLE fixedAsset (
    id BIGINT UNSIGNED not null AUTO_INCREMENT,
    name varchar(128) not null,
    status TINYINT,
    creationDate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
    CONSTRAINT fixedAsset_id_pk PRIMARY KEY (id)
) ENGINE=InnoDB;

INSERT INTO fixedAsset (`name`, status, `creationDate`) VALUES
('table', 1, DEFAULT),
('Car', 1, DEFAULT),
('Land', 1, DEFAULT),
('Pencil', 1, DEFAULT);

CREATE TABLE fixedAssetAccount (
    fixedAssetId BIGINT UNSIGNED not null,
    moduleTypeId int not null,
    accountId BIGINT UNSIGNED not null,
    CONSTRAINT fixedAssetAccount_pk PRIMARY KEY (fixedAssetId, moduleTypeId, accountId),
    CONSTRAINT fixedAsset_supplierId_fk FOREIGN KEY (fixedAssetId) REFERENCES fixedAsset (id),
    CONSTRAINT fixedAsset_moduleTypeId_fk FOREIGN KEY (moduleTypeId) REFERENCES moduleType (id),
    CONSTRAINT fixedAsset_accountId_fk FOREIGN KEY (accountId) REFERENCES account (id)
) ENGINE=InnoDB;


CREATE TABLE inventory (
    id BIGINT UNSIGNED not null AUTO_INCREMENT,
    name varchar(128) not null,
    status TINYINT,
    creationDate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
    CONSTRAINT inventory_id_pk PRIMARY KEY (id)
) ENGINE=InnoDB;

INSERT INTO inventory (`name`, status, `creationDate`) VALUES
('Computer', 1, DEFAULT),
('Mouse', 1, DEFAULT),
('Screen', 1, DEFAULT),
('Wifi Router', 1, DEFAULT);

CREATE TABLE inventoryAccount (
    inventoryId BIGINT UNSIGNED not null,
    moduleTypeId int not null,
    accountId BIGINT UNSIGNED not null,
    CONSTRAINT inventoryAccount_pk PRIMARY KEY (inventoryId, moduleTypeId, accountId),
    CONSTRAINT inventory_supplierId_fk FOREIGN KEY (inventoryId) REFERENCES inventory (id),
    CONSTRAINT inventory_moduleTypeId_fk FOREIGN KEY (moduleTypeId) REFERENCES moduleType (id),
    CONSTRAINT inventory_accountId_fk FOREIGN KEY (accountId) REFERENCES account (id)
) ENGINE=InnoDB;

CREATE TABLE service (
    id BIGINT UNSIGNED not null AUTO_INCREMENT,
    name varchar(128) not null,
    status TINYINT,
    creationDate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
    CONSTRAINT service_id_pk PRIMARY KEY (id)
) ENGINE=InnoDB;

INSERT INTO service (`name`, status, `creationDate`) VALUES
('Cleaning Your Computer', 1, DEFAULT),
('Formatting Disk', 1, DEFAULT),
('Typing 30 Papers', 1, DEFAULT),
('Translating Books', 1, DEFAULT);

CREATE TABLE serviceAccount (
    serviceId BIGINT UNSIGNED not null,
    moduleTypeId int not null,
    accountId BIGINT UNSIGNED not null,
    CONSTRAINT serviceAccount_pk PRIMARY KEY (serviceId, moduleTypeId, accountId),
    CONSTRAINT service_supplierId_fk FOREIGN KEY (serviceId) REFERENCES service (id),
    CONSTRAINT service_moduleTypeId_fk FOREIGN KEY (moduleTypeId) REFERENCES moduleType (id),
    CONSTRAINT service_accountId_fk FOREIGN KEY (accountId) REFERENCES account (id)
) ENGINE=InnoDB;

CREATE OR REPLACE VIEW transactionEntry AS
select entries.*,
SUM(entryAmount) OVER(PARTITION BY accountId ORDER BY entryDate
) AS accountBalance
-- ,
-- SUM(entryAmount) OVER(PARTITION BY moduleId ORDER BY entryDate
-- ) AS moduleIdBalance,
-- SUM(entryAmount) OVER(PARTITION BY moduleId,moduleTypeId,moduleRefId ORDER BY entryDate
-- ) AS entityBalance
from (
select acctTrans.id as id, trans.id as transactionId, acctTrans.moduleId as moduleId, acctTrans.moduleTypeId as moduleTypeId,
acctTrans.moduleRefId as moduleRefId, acctTrans.accountId as accountId, acctTrans.description as description, acctTrans.status as status,
trans.transactionDate as entryDate,
acctTrans.amount as amount,
(case when acctTrans.amount > 0 then acctTrans.amount else 0 end) as debit,
(case when acctTrans.amount < 0 then acctTrans.amount * -1 else 0 end) as credit,
(case when coalesce(acctTrans.amount, 0) > 0 then abs(coalesce(acctTrans.amount, 0)) * coalesce(acctt.debitSign, 0)
else abs(coalesce(acctTrans.amount, 0)) * coalesce(acctt.creditSign, 0) end) as entryAmount,
trans.`voucherTypeId` as sourceDocument, trans.code as code
from accountTransaction acctTrans
join account acct on (acct.id = acctTrans.accountId)
join `transaction` trans on (acctTrans.transactionId = trans.id)
join accountGroup acctgrp on (acct.accountGroup = acctgrp.id)
join accountType acctt on (acctt.id = acctgrp.accountType)
) entries;
