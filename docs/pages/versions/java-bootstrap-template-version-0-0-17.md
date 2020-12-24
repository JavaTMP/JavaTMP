---
title: Java Bootstrap Template Version 0.0.17 (Current Development Version)
---
# {{ page.title }}

## 
- Update the following dependencies in package.json:
  - @fortawesome/fontawesome-free from 5.15.0 to 5.15.1
  - bootstrap from 4.5.2 to 4.5.3
  - bootstrap-input-spinner from 1.16.5 to 1.16.8
  - bootswatch from 4.5.2 to 4.5.3
  - datatables.net from 1.10.22 to 1.10.23
  - datatables.net-bs4 from 1.10.22 to 1.10.23
  - echarts from 4.9.0 to 5.0.0
  - file-saver from 2.0.2 to 2.0.5
  - moment from 2.29.0 to 2.29.1
  - moment-timezone from 0.5.31 to 0.5.32
  - yargs from 16.0.3 to 16.2.0
- Run gulp default to regenerate dist folders.

## 708721a on Oct 3, 2020, 1:14 AM GMT+4
- Update readme.md by adding description about Spring Boot Gradle Starters Modules
- Update the following dependencies in package.json:
    - del from 5.1.0 to 6.0.0
    - @fortawesome/fontawesome-free from 5.14.0 to 5.15.0
- Run gulp default to regenerate dist folders.

## 0a77647 on Sep 27, 2020, 6:51 AM GMT+4
- Update the following dependencies in package.json:
    - bootstrap-input-spinner from 1.14.1 to 1.16.5
    - datatables.net from 1.10.21 to 1.10.22
    - datatables.net-bs4 from 1.10.21 to 1.10.22
    - datatables.net-fixedcolumns from 3.3.1 to 3.3.2
    - datatables.net-fixedcolumns-bs4 from 3.3.1 to 3.3.2
    - datatables.net-keytable from 2.5.2 to 2.5.3
    - datatables.net-keytable-bs4 from 2.5.2 to 2.5.3
    - datatables.net-responsive from 2.2.5 to 2.2.6
    - datatables.net-responsive-bs4 from 2.2.5 to 2.2.6
    - moment from 2.27.0 to 2.29.0
- Run gulp default to regenerate dist folders.

## 6541d63 on Sep 12, 2020, 6:17 PM GMT+4
- fixed some issues in home cardlet related to large number values. By applying 
number plugin.
- Update the following dependencies in package.json:
    - gulp-markdown from 5.0.1 to 5.1.0
    - gulp-zip from 5.0.1 to 5.0.2
    - @fortawesome/fontawesome-free from 5.13.1 to 5.14.0
    - bootstrap from 4.5.0 to 4.5.2
    - inputmask from 5.0.3 to 5.0.5
    - animate.css from 4.1.0 to 4.1.1
    - bootstrap-input-spinner from 1.13.19 to 1.14.1
    - bootswatch from 4.5.0 to 4.5.2
    - cropperjs from 1.5.7 to 1.5.9
    - echarts from 4.8.0 to 4.9.0
    - jquery.fancytree from 2.35.0 to 2.37.0
    - yargs from 15.3.1 to 16.0.3
- Run gulp default to regenerate dist folders.

## df92b0f on Jun 25, 2020, 9:37 PM GMT+4
- Make English is a default language for fall back.
- Update copyright year for some static pages
- Add Devextreme `Blazing Berry` bootstrap theme and thumbnail image in `src\main\resources\static\assets\img\themes\blazing-berry.png`
and add a new record for it in theme and themeTranslation tables.
- Add `useTimezone=true&serverTimezone=UTC` parameters to mysql `spring.datasource.url` URL
- solve the bug in `src\main\webapp\WEB-INF\pages\static\chart\echarts-cardlet\map\WorldMapWithScatterCardlet.jsp`
 when run in ie11 due to error in option object.
- Update the following dependencies in package.json:
    - @fortawesome/fontawesome-free from 5.13.0 to 5.13.1
    - bootstrap-input-spinner from 1.13.5 to 1.13.9
    - bootstrap-slider from 10.6.2 to 11.0.2
    - formdata-polyfill from 3.0.19 to 3.0.20
    - jquery-form from 4.2.2 to 4.3.0
    - moment from 2.26.0 to 2.27.0
