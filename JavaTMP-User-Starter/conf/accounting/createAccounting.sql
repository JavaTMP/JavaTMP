DROP TABLE IF EXISTS transactionEntry;
DROP TABLE IF EXISTS accountTransaction;

DROP TABLE IF EXISTS account;
DROP TABLE IF EXISTS accountGroup;
DROP TABLE IF EXISTS accountType;
DROP TABLE IF EXISTS `transaction`;
DROP TABLE IF EXISTS voucherType;

CREATE TABLE accountType (
    id int(1) UNSIGNED not null,
    name varchar(32) not null,
    debitSign int(1) not null,
    creditSign int(1) not null,
    reportTypeId int unsigned,
    CONSTRAINT accountType_id_pk PRIMARY KEY (id)
) ENGINE=InnoDB;

-- reportTypeId --> 1: Balance Sheet, 2: Profit and Loss
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

CREATE TABLE voucherType (
    id int not null AUTO_INCREMENT,
    name varchar(128) not null,
    description varchar(1024),
    status TINYINT,
    creationDate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
    CONSTRAINT transactionType_id_pk PRIMARY KEY (id)
) ENGINE=InnoDB;

INSERT INTO voucherType (id, `name`, description, status, `creationDate`) VALUES (1, 'Journal Voucher', 'Journal Voucher', 1, DEFAULT);

CREATE TABLE `transaction` (
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

CREATE TABLE accountTransaction (
    id BIGINT UNSIGNED not null AUTO_INCREMENT,
    transactionId BIGINT UNSIGNED not null,
    accountId BIGINT UNSIGNED not null,
    description varchar(1024),
    status TINYINT,
    amount DECIMAL(33,8),
    CONSTRAINT acctTrans_id_pk PRIMARY KEY (id),
    CONSTRAINT acctTrans_tranId_fk FOREIGN KEY (transactionId) REFERENCES `transaction` (id),
    CONSTRAINT acctTrans_acctId_fk FOREIGN KEY (accountId) REFERENCES account (id)
) ENGINE=InnoDB;
