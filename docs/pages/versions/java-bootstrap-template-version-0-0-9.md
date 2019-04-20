---
title: Java Bootstrap Template Version 0.0.9 (Current Development Version)
---
# Java Bootstrap Template Version 0.0.9 (Current Development Version)

## 5ffb38c on Apr 19, 2019, 8:10 PM GMT+4
- extends bs by providing fixed width classes based on rem measurement like `col-fixed-*`
- add `&amp;allowPublicKeyRetrieval=true` to mysql database server url in persistence.xml in `JavaTMP-User-Starter`
- Update all java filters to support excluded regex for urls in web.xml as filter initiate parameters.
- Add `UTF8InforcerFilter` to filter all request at the beginning to force UTF-8 character encoding request.
- Add `UTF8InforcerFilter` to web.xml web configuration file.

## 97958fb on Apr 17, 2019, 12:02 AM GMT+4
- remove horizontal padding in `.main-body-content-container`
- introduce a class `.grid-gutter-padding` and apply it to `.dynamic-ajax-content` div for padding
- remove horizontal padding in theme preview demo pages
- update `pages/bootstrap/dropdown.html` demo page with new Bootstrap 4.3.1 features.
- update `pages/bootstrap/components.html` demo page with new Bootstrap 4.3.1 features.
- Run `gulp` command which will use default task and generate `dist` folders.

## cddb12c on Apr 9, 2019, 4:57 PM GMT+4
- create demo pages for new bootstrap components like spinner and toaster.
- Solve the problem in dropdown demo page for RTL version.
- Solve the problem in cardlet that depends on id instead of class.
- create a demo page for metisMenu plugin `./web/pages/plugins/metisMenu.html`

## e4576c0 on Apr 6, 2019, 3:39 AM GMT+4
- Add mustache.js template to front-end and java backend
- Add a new page in `./web/pages/plugins/mustache.js.html`
- Add a java version of mustache template `https://github.com/spullara/mustache.java`
- Create a demo page for metisMenu plugin `./web/pages/plugins/metisMenu.html`

## 9b7cb0f on Apr 3, 2019, 1:02 AM GMT+4
- Refactor ion.rangeSlider plugin style to support new features in version 2.3.0 and support all available skin options.
- Update the following packages:
    - del from 3.0.0 to 4.1.0
    - gulp-uglify from 3.0.1 to 3.0.2
    - @fortawesome/fontawesome-free from 5.7.2 to 5.8.1
    - cropperjs from 1.4.3 to 1.5.1
    - datatables.net-select from 1.2.7 to 1.3.0
    - datatables.net-select-bs4 from 1.2.7 to 1.3.0
    - file-saver from 2.0.0 to 2.0.1
    - metismenu from 3.0.3 to 3.0.4
    - timeago from 1.6.4 to 1.6.5
- Run `gulp` command which will use default task and generate `dist` folders.

## 9029750 on Feb 20, 2019, 2:51 PM GMT+4
- Add missing flag images for countries.
- add more columns `documentType, parentDocumentId, status, createdByUserId` to document table in JavaTMP-User-Starter project.
- add more country records for country table.
- separate table user and document testing insert script to `insert_user_and_doc.sql` file.
- add around 1000 testing user profiles to user with profile images.

## 454712c on Feb 17, 2019, 2:20 PM GMT+4
- use `main-sidebar-menu` name for `.metismenu` in sidebar in index.js
- Solve the core sass files for any uses of deprecated BS 4.3.1 mixins
- solve Datatables Bootstrap Fixed Column and header background
- Update bootstrap-reverse from 1.0.11 to 4.3.1
- Refactor doc pages by removing unimportant ones.
- notify charts in cardlet for width changes.
- Run `gulp` command which will use default task and generate `dist` folders.

## 34a3adc on Feb 16, 2019, 11:43 PM GMT+4
- Uploaded missing country flag images.
- Introduce custom darker and lighter colors for standard themes colors.
- Run `gulp` command which will use default task and generate `dist` folders.

## 56ff38b on Feb 16, 2019, 5:51 PM GMT+4
- update bootstrap-slider from 10.6.0 to 10.6.1
- Run `gulp` command which will use default task and generate `dist` folders.

## e51de1a on Feb 14, 2019, 2:37 PM GMT+4
- update @fortawesome/fontawesome-free from 5.7.2 to 5.7.2
- update async from 2.6.1 to 2.6.2
- update bootstrap from 4.2.1 to 4.3.1
- update bootswatch from 4.2.1 to 4.3.1
- Run `gulp` command which will use default task and generate `dist` folders.

## 5436040 on Feb 1, 2019, 10:22 PM GMT+4
- refactor javatmp-user-starter tables for names mismatch