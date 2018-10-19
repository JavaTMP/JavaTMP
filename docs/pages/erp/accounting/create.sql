/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  JavaTMP
 * Created: Oct 19, 2018
 */

DROP TABLE IF EXISTS `accountType`;

CREATE TABLE `accountType` (
    id int(1) not null primary key,
    name varchar(32) not null,
    debitSign int(1) not null,
    creditSign int(1) not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO accounttype (id, `name`, `debitSign`, `creditSign`) VALUES
(1, 'Asset account', +1, -1),
(2, 'Liability account', -1, +1),
(3, 'Capital (Owner''s Equity) account', -1, +1),
(4, 'Revenue account', -1, +1),
(5, 'Expense account', +1, -1);


DROP TABLE IF EXISTS `accountGroup`;

CREATE TABLE `accountType` (
    id int(1) not null primary key,
    name varchar(32) not null,
    debitSign int(1) not null,
    creditSign int(1) not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


