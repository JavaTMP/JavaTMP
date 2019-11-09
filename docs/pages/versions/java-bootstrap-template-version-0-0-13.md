---
title: Java Bootstrap Template Version 0.0.13 (Current Development Version)
---
# {{ page.title }}

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