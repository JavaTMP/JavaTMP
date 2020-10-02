# JavaTMP Bootstrap Template
JavaTMP is a Bootstrap Admin and Dashboard Components template built using HTML 5 , CSS 3 , jQuery 3,
Bootstrap 4 and Java programming language come with static and dynamic web application versions.
JavaTMP has a huge collection of plugins and UI components and works seamlessly on all major web browsers, tablets and phones.
The main features of JavaTMP are:
*   Fluid and responsive template used for any type of web applications.
*   Lightweight and feature rich HTML static or dynamic Java Bootstrap template 
*   Clean and easy to use and customize AJAX based Template
*   RTL support for all Bootstrap templates and plugins pages.
*   Well structured with fixed navbar, sidebar, breadcrumb, and footerbar.
*   Use Node's npm for packages and dependencies management.
*   No use for Bower or Yarn for managing web frameworks and plugins any more.
*   Use Gulp for automating build and development processes.
*   Use SASS's SCSS syntax for generating CSS files.
*   Use Java Servlet/JSP for dynamic Java Bootstrap Web Application version. 

We'd like to thank You For Purchasing JavaTMP - Java Bootstrap Template, we hope you like it and find it easy to work with.
If you have any questions, please email our support team at support@javatmp.com.

The [online documentation](http://help.javatmp.com/) is brief and may be lacking in some parts.
If you think more explanations and examples are needed, just let us know.

Please send your questions, comments, suggestions and bug reports to our support
at support@javatmp.com and we will try to reply as soon as possible.

## Quick Links
- Official website: [http://www.javatmp.com/](http://www.javatmp.com/)
- Pricing: [https://www.javatmp.com/products/java-bootstrap-admin-and-dashboard-template](https://www.javatmp.com/products/java-bootstrap-admin-and-dashboard-template)
- Licensing: [https://github.com/JavaTMP/JavaTMP/blob/master/LICENSE](https://github.com/JavaTMP/JavaTMP/blob/master/LICENSE)

## Folder's contents:
Kindly visit the following online page for details folders and files description:
https://help.javatmp.com/pages/high-level-template-structure

## Running
It is best to run JavaTMP's applications with in a Java Maven support IDE. However,
You can run the following commands to compile and generate resources:
(make sure first that node.js is installed in your machine):
```
npm install (Will install all Node.js dependencies mentioned in package.json file)
gulp (Re-generate all front-end dependencies)
```

Prepare Your MySql Database server as provided in the [Database Configuration](http://help.javatmp.com/pages/javatmp-app-starter-project-version#preparing-oracle-mysql-database-management-system)
then update Spring boot `application.properties` file in `.\JavaTMP-App-Starter\src\main\resources` by
setting the following properties by your username and password and database names:
```
spring.datasource.url=jdbc:mysql://localhost:3306/appdb?zeroDateTimeBehavior=CONVERT_TO_NULL&useSSL=false&autoReconnect=true&autoReconnectForPools=true&allowPublicKeyRetrieval=true&useTimezone=true&serverTimezone=UTC
spring.datasource.username=Your_database_username
spring.datasource.password=Your_database_password
```
     
Run JavaTMP from your command line or import it from your Java IDE as a Maven Project by:
```
mvn spring-boot:run (run a development version)
```

Run JavaTMP from your command line as a standalone java project by:
```
maven clean package (clean and generate war file in ./target folder)
java -jar -Dserver.port=80 target/JavaTMP-App-Starter-0.0.${version}.war
```

## JavaTMP Spring Boot Starter Modules
Minimum Java Spring Boot Starter Projects with test classes built using gradle build tool and huge Java
frameworks:
### Initial Spring boot Starter Projects
* [Spring Boot Starter Project](SpringBootStarters/SpringBootStarterProject) 
using Spring Boot Starter with log4j2 logging and gradle build framework.
* [Spring Boot Multi-Module Starter Project](SpringBootStarters/SpringBootModulesStarterProject) 
using Spring Boot Multi-Module Starter with log4j2 logging and gradle build framework.

### Spring Boot Core Starters
Java Spring Boot Core features Starters Gradle Modules:
* [Spring Boot Autowired Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-core/spring-boot-autowired)
* [Spring Boot Bean Life Cycle Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-core/spring-boot-bean-lifecycle)
* [Spring Boot Config Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-core/spring-boot-config)
* [Spring Boot Empty Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-core/spring-boot-empty)
* [Spring Boot Bean Order Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-core/spring-boot-order)

### Spring Boot Data Starters
Java Spring Boot Data features Starters Gradle Modules:
* [Spring Boot JDBC Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-data/spring-boot-jdbc)
* [Spring Boot JDBC Config Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-data/spring-boot-jdbc-config)
* [Spring Boot JDBC Converter Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-data/spring-boot-jdbc-converter)
* [Spring Boot JPA Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-data/spring-boot-jpa)
* [Spring Boot JPA Advance Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-data/spring-boot-jpa-advance)
* [Spring Boot JPA Multi Datasource Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-data/spring-boot-jpa-multi)
* [Spring Boot Advanced JPA Multi Datasource Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-data/spring-boot-jpa-multi-advance)
* [Spring Boot JPA Paging Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-data/spring-boot-jpa-paging)

### Spring Boot Threading Starters
Java Spring Boot Threading And Scheduling features Starters Gradle Modules:
* [Spring Boot Async Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-threading/spring-boot-async)
* [Spring Boot Batch Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-threading/spring-boot-batch)
* [Spring Boot Quartz Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-threading/spring-boot-quartz)
* [Spring Boot Advanced Quartz Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-threading/spring-boot-quartz-advance)
* [Spring Boot Quartz Config Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-threading/spring-boot-quartz-config)
* [Spring Boot Scheduler Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-threading/spring-boot-scheduler)
* [Spring Boot Scheduler Config Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-threading/spring-boot-scheduler-config)

### Spring Boot Web Starters
Java Spring Boot Web features Starters Gradle Modules:
* [Spring Boot Rest Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-web/spring-boot-rest)
* [Spring Boot Rest Template Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-web/spring-boot-rest-template)
* [Spring Boot War Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-web/spring-boot-war)
* [Spring Boot Web Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-web/spring-boot-web-simple)
* [Spring Boot Web Session Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-web/spring-boot-web-session)

### Spring Boot Webservices Starters
Java Spring Boot Webservices features Starters Gradle Modules:
* [Spring Boot SOAP Consumer Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-webservices/spring-boot-soap-consumer)
* [Spring Boot SOAP Producer Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-webservices/spring-boot-soap-producer)
* [Spring Boot Webservices Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-webservices/spring-boot-web-services)
* [Spring Boot Webservices Client Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-webservices/spring-boot-web-services-client)

### Spring Boot Cache Starters
Java Spring Boot Caching features Starters Gradle Modules:
* [Spring Boot Simple Cache Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-cache/spring-boot-cache-simple)

### Spring Boot Management Starters
Java Spring Boot Management features Starters Gradle Modules:
* [Spring Boot Actuator Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-management/spring-boot-actuator)

### Spring Boot Miscellaneous Starters
Java Spring Boot Miscellaneous features Starters Gradle Modules:
* [Spring Boot iText Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-miscellaneous/spring-boot-itext)
* [Spring Boot JasperReports Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-miscellaneous/spring-boot-JasperReports)
* [Spring Boot Validation Starter Module](JavaTMP-SpringBoot-Modules/spring-boot-miscellaneous/spring-boot-validation)

## Copyright and License
JavaTMP is copyrighted by [JavaTMP](http://www.javatmp.com) and released under
[JavaTMP License](https://github.com/JavaTMP/JavaTMP/blob/master/LICENSE).

