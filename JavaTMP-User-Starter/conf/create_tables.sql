CREATE TABLE user (
    id BIGINT NOT NULL AUTO_INCREMENT,
    userName varchar(48) NOT NULL,
    password varchar(48) NOT NULL,
    firstName varchar(30) NOT NULL,
    lastName varchar(30) NOT NULL,
    status TINYINT NOT NULL,
    birthDate DATE NOT NULL,
    countryId varchar(48) NOT NULL,
    address TEXT NOT NULL,
    email varchar(45) NOT NULL,
    lang varchar(48) NOT NULL,
    theme varchar(48) NOT NULL,
    timezone varchar(48) NOT NULL,
    profilePicDocumentId BIGINT NOT NULL,
    creationDate TIMESTAMP NOT NULL,
    CONSTRAINT `user-id-pk` PRIMARY KEY (id)
) ENGINE=InnoDB;
ALTER TABLE user ADD CONSTRAINT user_userName_uni UNIQUE(userName);