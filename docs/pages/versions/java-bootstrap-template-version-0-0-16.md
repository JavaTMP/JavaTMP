---
title: Java Bootstrap Template Version 0.0.16 (Current Development Version)
---
# {{ page.title }}

## on 
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
