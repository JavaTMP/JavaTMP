---
title: Java Bootstrap Template Version 0.0.15 (Current Development Version)
---
# {{ page.title }}

## b4c844d on Mar 15, 2020, 3:34 PM GMT+4
- Update the following dependencies in package.json:
    - async from 3.1.1 to 3.2.0
    - moment-timezone from 0.5.27 to 0.5.28
    - summernote from 0.8.15 to 0.8.16
    - yargs from 15.1.0 to 15.3.0
- Run gulp default to regenerate dist folders.

## a86dbc5 on Feb 15, 2020, 7:47 PM GMT+4
- Support Theme-colors for Ion.RangeSlider plugin LTR/RTL
    - Update `.\web\assets\src\sass\plugins\custom-ion.rangeSlider.scss`
    - Update `.\src\main\webapp\WEB-INF\pages\static\plugins\ion-rangeSlider.jsp`
- Run gulp default to regenerate dist folders.

## 05b5af6 on Feb 10, 2020, 7:59 PM GMT+4
- Custom Boostrap Table Styling by providing `table-bordered-*` classes and demo page
`.\src\main\webapp\WEB-INF\pages\static\custom-components\custom-bootstrap-table-styling.jsp`
- Update .col-fixed-* helper classes to generate .col-fixed-1 to .col-fixed-100
- Run gulp default to regenerate dist folders.

## 4a259cf on Feb 10, 2020, 11:59 AM GMT+4
- Customize Spring Boot Whitelabel Error Page by controller `com.javatmp.fw.web.exception.CustomErrorPageController`
and send user to custom error page `.\src\main\webapp\WEB-INF\pages\system\error.jsp`
- create package `com.javatmp.fw.web.exception` to hold web exceptions and errors handler logic.
- move class `com.javatmp.fw.config.exception.ExceptionHandlerController` to `com.javatmp.fw.web.exception.ExceptionHandlerController`
- remove package `com.javatmp.fw.web.exception`.
- rename page `\src\main\webapp\WEB-INF\pages\system\404-page.jsp` to `\src\main\webapp\WEB-INF\pages\system\error.jsp`
