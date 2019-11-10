
SET NAMES 'utf8mb4';
CREATE DATABASE IF NOT EXISTS appdb;
USE appdb;

source drop_tables.sql
source create_tables.sql
source insert_tables.sql
source insert_user_and_doc.sql
source insert_folders.sql
-- Double Entry Accounting Module
source accounting/accounting.sql


