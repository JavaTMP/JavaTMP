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
DROP TABLE IF EXISTS module;
DROP TABLE IF EXISTS transaction;
DROP TABLE IF EXISTS transactionType;

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
    name varchar(32) not null,
    description varchar(1024),
    accountGroup int(3) UNSIGNED,
    debit DECIMAL(32,8),
    credit DECIMAL(32,8),
    balance DECIMAL(33,8),
    status TINYINT,
    creationDate TIMESTAMP NOT NULL,
    parentAccount BIGINT UNSIGNED,
    CONSTRAINT account_id_pk PRIMARY KEY (id),
    CONSTRAINT account_accountGroup_fk FOREIGN KEY (accountGroup) REFERENCES accountGroup (id),
    CONSTRAINT account_parentAccount_fk FOREIGN KEY (parentAccount) REFERENCES account (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE transactionType (
    id int not null AUTO_INCREMENT,
    name varchar(128) not null,
    description varchar(1024),
    status TINYINT,
    creationDate TIMESTAMP NOT NULL,
    CONSTRAINT transactionType_id_pk PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE transaction (
    id BIGINT UNSIGNED not null AUTO_INCREMENT,
    referenceCode varchar(1024),
    transactionType int not null,
    transactionDate DATETIME not null,
    description varchar(1024),
    status TINYINT,
    creationDate TIMESTAMP NOT NULL,
    CONSTRAINT transaction_id_pk PRIMARY KEY (id),
    CONSTRAINT transaction_transactionType_fk FOREIGN KEY (transactionType) REFERENCES transactionType (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE accountTransaction (
    id BIGINT UNSIGNED not null AUTO_INCREMENT,
    transactionId BIGINT UNSIGNED not null,
    accountId BIGINT UNSIGNED not null,
    status TINYINT,
    amount DECIMAL(33,8),
    balance DECIMAL(33,8),
    creationDate TIMESTAMP NOT NULL,
    CONSTRAINT accountTransaction_id_pk PRIMARY KEY (id),
    CONSTRAINT accountTransaction_tranId_fk FOREIGN KEY (transactionId) REFERENCES transaction (id),
    CONSTRAINT accountTransaction_acctId_fk FOREIGN KEY (accountId) REFERENCES account (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE module (
    id BIGINT UNSIGNED not null AUTO_INCREMENT,
    name varchar(128),
    description varchar(1024),
    status TINYINT,
    creationDate TIMESTAMP NOT NULL,
    CONSTRAINT module_id_pk PRIMARY KEY (id)
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

