---
title: Java Bootstrap Template Version 0.0.13 (Current Development Version)
---
# {{ page.title }}

## on
- Add Apache Log4j2 logging framework wrapped by Simple Logging Facade for Java (SLF4J) library as Maven dependency.
- Use Project lombok to generate setter and getter
- Refactor entity classes by using Project lombok annotations for generating setter/getter/toString/hashCode and equals methods.

## c391609 on Nov 12, 2019, 11:06 PM GMT+4
- Keep frontend src folder outside Maven folders in `./JavaTMP-User-Starter/web/assets/src` to synch with static html version.
- Add new node dependency 'yargs' to dynamically get destination dest folder for front-end resources.
- Add node run script `gulpDist` which could run by `npm run gulpDist` that generate resource based on its definition in `package.json` file.

## b856983 on Nov 11, 2019, 12:10 AM GMT+4
- Remove Netbeans IDE dependencies from JavaTMP-User-Starter Project.
- Adopt Apache Maven Build tool to JavaTMP-User-Starter Dynamic Java Project.
- Database demo files become located in JavaTMP-User-Starter/db_scripts instead of JavaTMP-User-Starter/conf
- Solve the bug in arabic locale that does not pass to plugins wrapper by `locale: "${labels['global.language']}"`

## 404f5ea on Nov 8, 2019, 3:26 PM GMT+4
- Solve bug when selecting today date on daterangepicker plugin by listen
on event `apply.daterangepicker` instead of default change callback.
- Update file `\JavaTMP-User-Starter\conf\accounting\createTransactionEntry.sql` by rename `Entry` to `entry` at line 2. because
linux mysql import command did not see it.
- solve the bug when importing data to mysql running on linux by rename transactionentry to transactionEntry in
`\JavaTMP-User-Starter\conf\accounting\createTransactionEntryTriggers.sql`
- rename table content to Content because wrongly writting in Content entity as Content instead of content, in
`\JavaTMP-User-Starter\conf\drop_tables.sql`
`\JavaTMP-User-Starter\conf\create_tables.sql`