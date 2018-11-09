-- Command to dump database:
-- mysqldump --complete-insert --extended-insert=FALSE --hex-blob -uroot -p  appdb > text.sql
-- https://stackoverflow.com/questions/36882149/error-1067-42000-invalid-default-value-for-created-at
-- Replace "creationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'" in the script with "`creationDate` timestamp NOT NULL,"
-- Command to import script to existing database called 'appdb'
-- mysql -uroot -pmmmmmm -D appdb < build.sql
-- Run timezons inserter Java code: ./test/com.javatmp.timezones.TestingPopulateTimezone
-- Run users inserter Java code:  ./test/com.javatmp.PopulateDBFromJson

select l.`languageId` as languageId, COALESCE(t.`languageName`, l.`languageName`) as languageName
from `language` l
left OUTER JOIN languagetranslation t on t.`id` = l.`languageId` and t.`langId` = 'ar'
--left OUTER JOIN `language` d on d.`languageId` = l.`languageId`