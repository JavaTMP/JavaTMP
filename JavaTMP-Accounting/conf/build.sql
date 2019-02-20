
CREATE DATABASE IF NOT EXISTS accountingdb;
USE accountingdb;

source drop_tables.sql
source create_tables.sql
source insert_tables.sql
source insert_user_and_doc.sql

GRANT all privileges ON accountingdb.* TO user1@localhost;

