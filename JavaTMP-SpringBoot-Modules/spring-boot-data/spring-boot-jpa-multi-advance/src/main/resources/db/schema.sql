DROP TABLE IF EXISTS `orm_user`;
CREATE TABLE `orm_user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  `name` VARCHAR(32) NOT NULL UNIQUE ,
  `password` VARCHAR(32) NOT NULL ,
  `salt` VARCHAR(32) NOT NULL ,
  `email` VARCHAR(32) NOT NULL UNIQUE ,
  `phone_number` VARCHAR(15) NOT NULL UNIQUE,
  `status` INT(2) NOT NULL DEFAULT 1 ,
  `create_time` DATETIME NOT NULL DEFAULT NOW() ,
  `last_login_time` DATETIME DEFAULT NULL ,
  `last_update_time` DATETIME NOT NULL DEFAULT NOW()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Spring Boot Demo JPA';


DROP TABLE IF EXISTS `orm_department`;
CREATE TABLE `orm_department` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  `name` VARCHAR(32) NOT NULL ,
  `superior` INT(11)  ,
  `levels` INT(11) NOT NULL ,
  `order_no` INT(11) NOT NULL DEFAULT 0 ,
  `create_time` DATETIME NOT NULL DEFAULT NOW() ,
  `last_update_time` DATETIME NOT NULL DEFAULT NOW()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Spring Boot Demo JPA';

DROP TABLE IF EXISTS `orm_user_dept`;
CREATE TABLE `orm_user_dept` (
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  `user_id` INT(11) NOT NULL ,
  `dept_id` INT(11) NOT NULL ,
  `create_time` DATETIME NOT NULL DEFAULT NOW() ,
  `last_update_time` DATETIME NOT NULL DEFAULT NOW()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Spring Boot Demo JPA';
