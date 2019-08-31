
SET NAMES 'utf8mb4';
CREATE DATABASE IF NOT EXISTS appdb;
USE appdb;

source drop_tables.sql
source create_tables.sql
source insert_tables.sql
source insert_user_and_doc.sql
source insert_folders.sql
source accounting/createAccounting.sql
source accounting/createTransactionEntry.sql
source accounting/createTransactionEntryTriggers.sql
source accounting/testAcctTransEntries.sql


