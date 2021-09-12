create schema spring;

CREATE TABLE IF NOT EXISTS `spring`.`Customer` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `firstName` VARCHAR(45) NULL,
    `lastName` VARCHAR(45) NULL,
    PRIMARY KEY (`id`)
);
