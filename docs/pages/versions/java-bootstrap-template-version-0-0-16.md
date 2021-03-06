---
title: Java Bootstrap Template Version 0.0.16 (published on May 27, 2020)
---
# {{ page.title }}

## f09561d on May 27, 2020, 2:07 AM GMT+4
- Prepare project for release 0.0.16
- Update the following dependencies in package.json:
    - bootstrap-daterangepicker from 3.0.5 to 3.1.0
    - cropperjs from 1.5.6 to 1.5.7
    - echarts from 4.7.0 to 4.8.0
    - jquery-validation from 1.19.1 to 1.19.2
- Run gulp default to regenerate dist folders.

## 9abab20 on May 21, 2020, 10:15 PM GMT+4
- Update the following dependencies in package.json:
    - bootstrap-input-spinner from 1.13.4 to 1.13.5
    - datatables.net-responsive from 2.2.4 to 2.2.5
    - datatables.net-responsive-bs4 from 2.2.4 to 2.2.5  
    - fullcalendar from 3.10.1 to 3.10.2 
    - moment from 2.25.3 to 2.26.0
    - moment-timezone from 0.5.29 to 0.5.31 
    - summernote from 0.8.16 to 0.8.18
- Run gulp default to regenerate dist folders.

## 557ecc1 on May 18, 2020, 7:36 AM GMT+4
- Solve the bug in advanced user filtration page `src/main/webapp/WEB-INF/pages/user/advancedUsersSearch.jsp`.
- Remove page `/src/main/webapp/WEB-INF/pages/static/table/datatable/defalut-datatables-fixedcolumn-with-key-navigation.jsp` 
and split it to two demo pages `src\main\webapp\WEB-INF\pages\static\table\datatable\key-navigation-datatables.jsp` 
and `src\main\webapp\WEB-INF\pages\static\table\datatable\fixedcolumn-datatables.jsp` 
because those extension datatables fixed column and key navigation are not compatible with each other.
- Update the following dependencies in package.json:
    - animate.css from 3.7.2 to 4.1.0
    - bootstrap from 4.4.1 to 4.5.0
    - bootstrap-maxlength from 1.6.0 to 1.10.0
    - bootswatch from 4.4.1 to 4.5.0
    - datatables.net from 1.10.20 to 1.10.21
    - datatables.net-bs4 from 1.10.20 to 1.10.21
    - datatables.net-fixedcolumns from 3.3.0 to 3.3.1
    - datatables.net-fixedcolumns-bs4 from 3.3.0 to 3.3.1
    - datatables.net-fixedheader from 3.1.6 to 3.1.7
    - datatables.net-fixedheader-bs4 from 3.1.6 to 3.1.7
    - datatables.net-keytable from 2.5.1 to 2.5.2
    - datatables.net-keytable-bs4 from 2.5.1 to 2.5.2
    - datatables.net-responsive from 2.2.3 to 2.2.4
    - datatables.net-responsive-bs4 from 2.2.3 to 2.2.4
    - datatables.net-rowgroup from 1.1.1 to 1.1.2
    - datatables.net-rowgroup-bs4 from 1.1.1 to 1.1.2
    - gulp-sass from 4.0.2 to 4.1.0
    - jquery from 3.5.0 to 3.5.1
    - moment from 2.24.0 to 2.25.3
    - moment-timezone from 0.5.28 to 0.5.29    
- Run gulp default to regenerate dist folders.

## 6e3b4b5 on May 13, 2020, 1:53 AM GMT+4
- Solve the bug in ie11 for `.navbar-toggler-icon` background-image by applying `escape-svg` function 
in `web\assets\src\sass\common\variables.scss` for `$javatmp-navbar-toggler-icon-bg-image` parameter.
- Solve the bug browsing application files in ide, standalone or within a tomcat container.
- add `formdata-polyfill` version 3.0.19 to support ie11 browser.
- Run gulp default to regenerate dist folders.

## a862686 on May 1, 2020, 3:44 AM GMT+4
- Solve the bug when deploying using context root other than / or when deploying 
to standalone tomcat server. by trimming the context path in PagesController.java.
- create an echarts-map.jsp page to hold echarts map demo static cardlets.
- Fixed bugs in `.\JavaTMP-App-Starter\src\main\webapp\WEB-INF\pages\static\plugins\bootstrap-modal-wrapper.jsp`

## 7c0d232 on Apr 23, 2020, 4:18 AM GMT+4 
- Update Java dependencies:
    - org.springframework.boot:spring-boot-starter-parent from 2.2.4.RELEASE to 2.2.6.RELEASE.
    - org.jsoup:jsoup from 1.12.1 to 1.13.1.
