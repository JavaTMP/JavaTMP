CREATE DATABASE IF NOT EXISTS appdb;
USE appdb;

CREATE TABLE document (
    documentId BIGINT NOT NULL AUTO_INCREMENT,
    documentName varchar(255) NOT NULL,
    documentSize BIGINT NOT NULL,
    contentType varchar(255) NOT NULL,
    documentContent BLOB NOT NULL,
    creationDate TIMESTAMP NOT NULL,
    randomHash BIGINT NOT NULL,
    CONSTRAINT document_documentId_pk PRIMARY KEY (documentId)
) ENGINE=InnoDB;

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
    profilePicDocumentId BIGINT,
    creationDate TIMESTAMP NOT NULL,
    CONSTRAINT user_id_pk PRIMARY KEY (id),
    CONSTRAINT user_userName_uni UNIQUE(userName),
    CONSTRAINT user_profilePicDocumentId_fk FOREIGN KEY (profilePicDocumentId)
    REFERENCES document (documentId)
) ENGINE=InnoDB;
