---
title: Java Bootstrap Template Version 0.0.15 (Current Development Version)
---
# {{ page.title }}

##
- Customize Spring Boot Whitelabel Error Page by controller `com.javatmp.fw.web.exception.CustomErrorPageController`
and send user to custom error page `.\src\main\webapp\WEB-INF\pages\system\error.jsp`
- create package `com.javatmp.fw.web.exception` to hold web exceptions and errors handler logic.
- move class `com.javatmp.fw.config.exception.ExceptionHandlerController` to `com.javatmp.fw.web.exception.ExceptionHandlerController`
- remove package `com.javatmp.fw.web.exception`.
- rename page `\src\main\webapp\WEB-INF\pages\system\404-page.jsp` to `\src\main\webapp\WEB-INF\pages\system\error.jsp`
