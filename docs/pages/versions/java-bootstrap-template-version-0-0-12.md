---
title: Java Bootstrap Template Version 0.0.12 (published on November 6, 2019)
---
# {{ page.title }}

## 04681ae on Nov 6, 2019, 9:00 PM GMT+4
- Implements advanced User Search Page using jquery-querybuilder plugin in page
`\JavaTMP-User-Starter\web\WEB-INF\pages\user\advancedUsersSearch.jsp`.
- Update `.\JavaTMP-User-Starter\src\java\com\javatmp\util\JpaDaoHelper.java`
to support dynamic filter using jquery-querybuilder plugin.
- Add `\JavaTMP-User-Starter\src\java\com\javatmp\mvc\domain\table\RuleOrGroup.java` to support backend advanced query filter.
- Update the following dependencies in package.json:
    - select2 from 4.0.10 to 4.0.12
- Run npm install to fetch new dependencies to ./node_modules folder.
- Run gulp default to regenerate dist folders.

## 91721ce on Nov 1, 2019, 6:23 PM GMT+4
- Solve callback bug in `\JavaTMP-User-Starter\web\WEB-INF\pages\user\usersLookupPopup.jsp`
- Update the following dependencies in package.json:
    - gulp-markdown from 5.0.0 to 5.0.1
    - gulp-zip from 5.0.0 to 5.0.1
    - bootstrap-input-spinner from 1.11.17 to 1.12.7
    - cropperjs from 1.5.5 to 1.5.6
    - echarts from 4.3.0 to 4.4.0
    - gulp-autoprefixer from 7.0.0 to 7.0.1
    - gulp-uglify-es from 1.0.4 to 2.0.0
    - handlebars from 4.4.2 to 4.5.1
    - jquery-cropper from 1.0.0 to 1.0.1
    - jquery.fancytree from 2.32.0 to 2.33.0
    - moment-timezone from 0.5.26 to 0.5.27
    - popper.js from 1.15.0 to 1.16.0
    - select2 from 4.0.10 to 4.0.11
- Run npm install to fetch new dependencies to ./node_modules folder.
- Run gulp default to regenerate dist folders.

## 4f604c9 on Oct 4, 2019, 10:53 AM GMT+4
- Solve callback bug in `\JavaTMP-User-Starter\web\WEB-INF\pages\user\search-for-user-profile.jsp`
- Solve callback bug in `\JavaTMP-User-Starter\web\WEB-INF\pages\user\usersLookupPopup.jsp`
- Update the following dependencies in package.json:
    - @fortawesome/fontawesome-free from 5.10.2 to 5.11.2
    - bootstrap-input-spinner from 1.11.8 to 1.11.17
    - datatables.net from 1.10.19 to 1.10.20
    - datatables.net-bs4 from 1.10.19 to 1.10.20
    - datatables.net-fixedcolumns from 3.2.6 to 3.3.0
    - datatables.net-fixedcolumns-bs4 from 3.2.6 to 3.3.0
    - datatables.net-fixedheader from 3.1.5 to 3.1.6
    - datatables.net-fixedheader-bs4 from 3.1.5 to 3.1.6
    - datatables.net-keytable from 2.5.0 to 2.5.1
    - datatables.net-keytable-bs4 from 2.5.0 to 2.5.1
    - datatables.net-rowgroup from 1.1.0 to 1.1.1
    - datatables.net-rowgroup-bs4 from 1.1.0 to 1.1.1
    - datatables.net-select from 1.3.0 to 1.3.1
    - datatables.net-select-bs4 from 1.3.0 to 1.3.1
    - echarts from 4.2.1 to 4.3.0
    - handlebars from 4.1.2 to 4.4.2
    - inputmask from 4.0.8 to 4.0.9
    - jquery.fancytree from 2.31.0 to 2.32.0
- Run npm install to fetch new dependencies to ./node_modules folder.
- Run gulp default to regenerate dist folders.

## b2905d8 on Sep 4, 2019, 12:15 AM GMT+4
- Create an Accounting Management module demo pages to demonestrate a double entry accounting feature
- Update the following dependencies:
    - del from 5.0.0 to 5.1.0
    - gulp-markdown from 4.0.0 to 5.0.0
    - @fortawesome/fontawesome-free from 5.10.1 to 5.10.2
    - gulp-autoprefixer from 6.1.0 to 7.0.0
    - select2 from 4.0.8 to 4.0.10
- Run gulp default to regenerate dist folders.

## 807f8ac on Aug 23, 2019, 9:20 PM GMT+4
- update datatables layout regarding info and pagination location in javatmp-user-starter project.
- Solve the bug in `.\JavaTMP-User-Starter\web\WEB-INF\pages\system\register.jsp`
- Support Support Datatables edit cell functionality through https://github.com/ejbeaty/CellEdit
- Add `./jquery-ui-dist/jquery-ui.theme.min.css` after jquery-ui.min.css file in gulpfile.js
