---
title: JavaTMP-App-Starter Project Version
---
# {{ page.title }}

`JavaTMP-App-Starter` project is an advanced dynamic Java Bootstrap LTR/RTL multi languages User Management Web application Template
based on combined curated front-end resources of jQuery and Bootstrap LTR/RTL Admin and Dashboard components and plugins modified
and developed to provide a dynamic features built mainly using `Java 8`, `Spring Boot` 2.2.4 framework and deployed as a standalone project
using embedded tomcat 9 container. It supports for data persistent using Mysql Database Management System through java Persistent API and hibernate JPA implementation.
It is a standard Maven project, so you can directly import and open it in any Java IDE supporting Apache Maven build tool.
The [Online Dynamic Java Spring Bootstrap Apps Management Web Application](http://java.javatmp.com/ "Dynamic Java Spring Bootstrap LTR/RTL multi languages User Management Web application Template")
provides a running version of this template war file on tomcat 9.
Kindly see the Apache Maven build file `./JavaTMP/JavaTMP-App-Starter/pom.xml`
for more information about our Java backend dependencies.

`JavaTMP-App-Starter` project is a dynamic java Spring Boot web application providing a simple apps management demo.
The following list provides the main features of Dynamic Java Spring Boot Apps Management web application Template
version `JavaTMP-App-Starter` Project:
*   Public Registration Page for user.
*   Login Page for Registered User Authentication.
*   User Dashboard Providing a summary for users and their activities.
*   Advanced Users List with complete CRUD operations like Create, Read, Update and Delete User.
*   Users filtration for all user fields grid.
*   Advanced Users List with inline user detail view and all CRUD operations for specific user.
*   Create New User Page with all fields using best front-end plugins and resources.
*   Separate page for Users search and lookup dialog.
*   Current User Profile setting for viewing and updating current user profile data.
*   Use Oracle Mysql Database Management System for storing and persisting Users data and activities. And provides a script to import demo users and lookup data like countries, themes and timezones.
*   Use Hibernate JPA implementation as an access layer for Oracle Mysql Database.
*   Use Simple Java Captcha in the public registration Page to provide a another level of security.
*   Dynamically switching of interface language using server side mechanism.
*   Dynamically switching of theme using server side mechanism.
*   Dynamically login using dynamic login page and server side.
*   Dynamically logout using dynamic server side.
*   Dynamically fetch card content using jQuery AJAX, BlockUI and toastr plugins.
*   Dynamically list web application folders and files using fancytree plugin in.
*   Dynamically list chart of accounts as parent/child records using fancytree plugin in.
*   Diary Web Calendar through fullcalendar, inputmask, daterangepicker and bootstrap modal wrapper.
*   Dynamically populate and fetch select2 AJAX data with/out custom result data.
*   Dynamically populate summernote editor plugin in JSP or from AJAX request's content.
*   Dynamically serve static resources through simple servlet for binary content.
*   Open image on client side to crop it and then upload cropped version to server.
*   Dynamically load malihu scrollable pane with ajax content.
*   Dynamically submitting form using jQuery AJAX form, jQuery validation, summernote editor.
*   Dynamic wizard with form and validations.
*   Dynamic Datatables content and pagination plugins and filtration.
*   Individual-column search using ajax and select2 and daterangepicker and inputmask.
*   Implements dynamic charts using echarts plugin with ajax contents.
*   Implements create new message for user using select2 & summernote .
*   Implements file manager feature to upload and download files using jquery Ajax form and binary servlet.
*   Using Fancytree plugin to dynamically list web application folders and files. implements a preview of server sharing folder by parent-child to Using Fancytree plugin to dynamically list web application folders and files.
*   Diary Web Calendar through fullcalendar, inputmask, daterangepicker and bootstrap modal wrapper. Implements event table diary based requirement to implements Diary Web Calendar through fullcalendar, inputmask, daterangepicker and bootstrap modal wrapper.
*   Dynamically serve static resources through simple servlet for binary content. External File Browser. impelments a Dynamically serve static resources through simple servlet for binary content. External File Browser.
*   Implements file manager feature to upload and download files using jquery Ajax form and binary servlet for internal archive and resources. Implements file manager feature to upload and download files using jquery Ajax form and binary servlet for internal archive and resources.
*   Implements create new message popup for user using select2 & summernote . Implements create new message popup for user using select2 & summernote .
*   Dynamically load malihu scrollable pane with ajax content. implement dynamic message navbar menu item to Dynamically load malihu scrollable pane with ajax content.
*   Dynamically populate and fetch select2 AJAX data with/out custom result data. implements messages tables between users to implements Dynamically populate and fetch select2 AJAX data with/out custom result data.
*   Dynamically populate summernote editor plugin in JSP or from AJAX request's content. create a content table to implements Dynamically populate summernote editor plugin in JSP or from AJAX request's content.
*   Open image on client side to crop it and then upload cropped version to server. implements edit image file like profile images by Open image on client side to crop it and then upload cropped version to server.
*   Dynamic wizard with form and validations. Create page for adding new user using Dynamic wizard with form and validations.
*   Implements a backend feature for mustache.java . Dynamic storing of content contain template node to Implements a backend feature for mustache.java
*   Dynamically list chart of accounts as parent/child records using fancytree plugin. implements a preview of File manager. Dynamically list chart of accounts as parent/child records using fancytree plugin and see how to paginate result.

## `JavaTMP-App-Starter` Project Folder Structure
The JavaTMP-App-Starter project folder structure is based on Apache Maven build tool with the following main contents of its folder root:
```
./JavaTMP-App-Starter
|---.eslintrc (ESLint plugin configuration file which contains directive and parameters to gulp-eslint gulp plugin)
|---.gitignore (git SCM meta file to exclude mainly folders from versioning)
|---gulpfile.js (gulp's configuration file for automating front end resources and generate assets/dist JS/CSS files)
|---package.json (A Node.js's NPM meta file. This file holds various metadata relevant to the project)
+---db_scripts (Oracle Mysql Database dump script to start the Users Web Application from)
+---src (Standard Spring Boot Maven source code files)
+---web (Source files of Web specific static resources like fonts, js, and sass folders and files)
|---pom.xml (Apache Maven Configuration build file)
```

### `./JavaTMP-App-Starter/pom.xml` file
A standard Apache Maven Java Spring Boot build configuration file contains java dependencies building instructions.
Read more about Apache Maven in [Java Automated Build Tool Apache Maven](/tutorials/maven/Java-Automated-Build-Tool-Apache-Maven)

### `./JavaTMP-App-Starter/gulpfile.js` file
This is a gulp's configuration file. gulp is a toolkit for automating painful or time-consuming tasks in your development workflow.
We use gulp to automate our building process like generating JS/CSS. The main important gulp task is `generate-dist`
which copy resources from node_module folder and combine them and compile and generate theme and template Javascript and CSS files
and folders. We described it in details in [Manage Front-end dependencies Using Node.js And Gulp](/pages/manage-front-end-dependencies-using-node-js-and-gulp).

### `./JavaTMP-App-Starter/src` folder
`src` contains the `Java` source code of all backend classes like Spring Boot Controllers, Configuration files, bean, Java Web listener,
Java Web Context classes.
Read more about Standard Maven Directory Layout in [Java Automated Build Tool Apache Maven](/tutorials/maven/Java-Automated-Build-Tool-Apache-Maven).

### `./JavaTMP-App-Starter/web` folder
This folder contains everything related to front end resources and plugins.
The following tree structure provides an outline of its contents with description
and usages.

```
./JavaTMP-App-Starter/web/src
+---src (Source folder of front end resources like scss and js files)
    +---fonts
    +---js-src
    +---sass
    +---sass-rtl
```

The main sass file that include bootstrap and template sass file and override it is
in `./web/assets/src/sass/main.scss` that was referenced by `./web/assets/src/sass/themes/javatmp-default.scss`
which the later referenced in all other theme files resided in `./web/assets/src/sass/themes`.
This main.scss file includes and references the following resources:
1.  Import JavaTMP Global Variables
2.  Import original Bootstrap SCSS file
3.  Import JavaTMP Base Tempalte SCSS files
4.  Import Custom Plugins SCSS files that Override default plugins CSS rules
5.  Import demo pages scss files

The main important JSP page in our dynamic Java Bootstrap template is `index.jsp` which was dispatched from
`com.javatmp.web.controller.IndexController` Servlet class to the user. The following HTML code provides its contents:

```jsp
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="${labels["global.language"]}" dir="${labels["global.direction"]}" class="javatmp-default-admin-layout">
    <head>
        <title>${labels["global.page.title"]}</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-all.min.css" rel="stylesheet" type="text/css"/>
        <link href='${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-print-all.min.css' rel='stylesheet' media='print' />

        <!-- Include directional support -->
        <c:if test="${labels['global.direction'] == 'ltr'}">
            <link id="themeStyleSheet" href="${pageContext.request.contextPath}/assets/dist/css/javatmp-${sessionScope.user.theme}.min.css" rel="stylesheet" type="text/css"/>
        </c:if>
        <c:if test="${labels['global.direction'] == 'rtl'}">
            <link id="themeStyleSheet" href="${pageContext.request.contextPath}/assets/dist/css/javatmp-${sessionScope.user.theme}-rtl.min.css" rel="stylesheet" type="text/css"/>
        </c:if>

        <!-- Include language support font -->
        <link href="${pageContext.request.contextPath}/assets/dist/css/font-family-${labels['global.language']}.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="sidebar-active">
        ...
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp-plugins-all.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp-plugins-all-locale-${sessionScope.user.lang}.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            jQuery(function ($) {
                javatmp.init({
                    httpMethod: "GET",
                    dataType: "html",
                    updateURLHash: true,
                    defaultPassData: {_ajax: "ajax", _ajaxGlobalBlockUI: true, _handleAjaxErrorGlobally: true},
                    defaultOutputSelector: '.main-body-content-container',
                    defaultUrl: '${pageContext.request.contextPath}/pages/home',
                    floatDefault: "${labels['global.floatDefault']}",
                    floatReverse: "${labels['global.floatReverse']}",
                    direction: "${labels['global.direction']}",
                    isRTL: ${labels['global.direction'] == 'ltr' ? 'false' : 'true'},
                    contextPath: '${pageContext.request.contextPath}'
                });

                javatmp.user = {};
                javatmp.user.id = ${sessionScope.user.id};
                javatmp.user.lang = "${sessionScope.user.lang}";
                // force en as a moment locale for now
                moment.locale("en");
            });
        </script>
        ...
    </body>
</html>
```

#### Notes
*   We minimize the use of Java features like EL mixed with Javascript whenever possible other than in `index.jsp`
to pass them to `javatmp.init method`
*   `sessionScope.user` object was injected in the session by `com.javatmp.web.controller.LoginController` Servlet.
*   `labels` object is an instance of `ResourceBundle` which was injected into session by
`com.javatmp.web.filter.LocalizationFilter` filter.
*   Read more about `javatmp.init` Javascript function in the following page
[High Level Template Structure](/pages/high-level-template-structure "High Level JavaTMP Template Folders And Files Structure").

### Dynamic JSP Starter Pages
The starter Java Bootstrap default English LTR page that use the above generated combined files look like the following:
```jsp
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" dir="ltr" class="javatmp-default-admin-layout">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-all.min.css" rel="stylesheet" type="text/css"/>
        <link href='${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-print-all.min.css' rel='stylesheet' media='print' />
        <link href="${pageContext.request.contextPath}/assets/dist/css/javatmp-default.min.css" rel="stylesheet" type="text/css"/>
        <!-- Include language support font -->
        <link href="${pageContext.request.contextPath}/assets/dist/css/font-family-en.min.css" rel="stylesheet" type="text/css"/>
        ...
    </head>
    <body class="sidebar-active">
        ...
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp-plugins-all.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp-plugins-all-locale-en.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp.min.js" type="text/javascript"></script>
        ...
    </body>
</html>
```
And the starter Java Bootstrap default English RTL page that use the above generated combined files look like the following:
```jsp
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" dir="rtl" class="javatmp-default-admin-layout">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-all.min.css" rel="stylesheet" type="text/css"/>
        <link href='${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-print-all.min.css' rel='stylesheet' media='print' />
        <link href="${pageContext.request.contextPath}/assets/dist/css/javatmp-default-rtl.min.css" rel="stylesheet" type="text/css"/>
        <!-- Include language support font -->
        <link href="${pageContext.request.contextPath}/assets/dist/css/font-family-en.min.css" rel="stylesheet" type="text/css"/>
        ...
    </head>
    <body class="sidebar-active">
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp-plugins-all.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp-plugins-all-locale-en.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp.min.js" type="text/javascript"></script>
        ...
    </body>
</html>
```

And the starter Java Bootstrap default Arabic RTL page that use the above generated combined files look like the following:
```jsp
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ar" dir="rtl" class="javatmp-default-admin-layout">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-all.min.css" rel="stylesheet" type="text/css"/>
        <link href='${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-print-all.min.css' rel='stylesheet' media='print' />
        <link href="${pageContext.request.contextPath}/assets/dist/css/javatmp-default-rtl.min.css" rel="stylesheet" type="text/css"/>
        <!-- Include language support font -->
        <link href="${pageContext.request.contextPath}/assets/dist/css/font-family-ar.min.css" rel="stylesheet" type="text/css"/>
        ...
    </head>
    <body class="sidebar-active">
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp-plugins-all.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp-plugins-all-locale-ar.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp.min.js" type="text/javascript"></script>
        ...
    </body>
</html>
```

### Generating Production `JavaTMP-App-Starter.war` file
Generating our [online production Java Spring Bootstrap Apps Web application war file](http://java.javatmp.com/ "Java Bootstrap Apps Management Web application war file")
is done using the following special gulp's task steps:

```javascript
gulp.src([
    './JavaTMP-App-Starter/**/*',
    '!**/node_modules{,/**}',
    '!**/nbproject/private{,/**}',
    '!**/package-lock.json'
], {dot: true})
        .pipe(gulp.dest("temp/JavaTMP-App-Starter"));
gulp.src(['temp/JavaTMP-App-Starter/build/web/**/*'], {dot: true})
        .pipe(gulp.dest("temp/online-java-demo-starter"));
gulp.src(['temp/online-java-demo-starter/**/*.html', 'temp/online-java-demo-starter/**/*.jsp'], {dot: true})
        .pipe(htmlmin({collapseWhitespace: true,
            minifyCSS: true,
            minifyJS: true,
            removeComments: true,
            ignoreCustomComments: false,
            keepClosingSlash: true,
            ignoreCustomFragments: [/<%--[\s\S]*?--%>/, /<%@[\s\S]*?%>/, /\$\{[\s\S]*?\}/, /<fmt:[\s\S]+?\/>/, /<c:[\s\S]+?\/?>/, /<\/c:[\s\S]+?>/, /\{\{[\s\S]*?\}\}/]
        }))
        .pipe(gulp.dest("temp/online-java-demo-starter"));
gulp.src(['temp/online-java-demo-starter/**/*'], {dot: true})
        .pipe(chmod(0o644, true))
        .pipe(zip('JavaTMP-App-Starter.war'))
        .pipe(gulp.dest('temp'));
```

## Installation and Deploying
### Preparing Maven Project
The `JavaTMP-App-Starter` project is a standard Apache Maven project structure, so you can directly import and open it
in any Java IDE support Maven for compilation and deploying

### Preparing Oracle Mysql Database Management System

Although we use JPA with Hibernate implementation library through default Spring Boot framework configuration
for managing and wrapping connections and JDBC handling to provide
standard interface for any database management, we tested and deployed our online demo version with Oracle Mysql Database,
So we describe and prepare it as a standard database vendor to use in JavaTMP projects.

First of all make sure you install and prepare your Oracle Mysql Database management system in your local development machine
and follow the documentation on their [website](https://www.mysql.com/ "Oracle Mysql Database Management System Home Page").

Most Database parameters like database name, username and password should be saved and changed in
Spring Boot configuration file `.\JavaTMP-App-Starter\src\main\resources\application.properties` file.

Login to your mysql database instance through the command line:

`> mysql -u mysql_user -p`

Create a new Database:

`mysql > create database appdb;`

Check your new created Database:

`mysql > show databases;`

Create the User

`mysql > create user javatmpUser;`

Grant privileges while assigning the password for javatmpUser:

`mysql > grant all on appdb.* to ‘javatmpUser’@’localhost’ identified by ‘javatmpUserPassword’;` or

`mysql > GRANT all privileges ON appdb.* TO ‘javatmpUser’@’localhost’ WITH GRANT OPTION;`

Note: The localhost field usually doesn’t have to be edited, but you can set it to the specific address.

The above example grants all privileges, obviously. But you will likely want to limit privileges under many circumstances.
These parameters include select, insert, and delete, For example:

`mysql > grant select, insert, delete, update on appdb.* to ‘javatmpUser’@’localhost’ identified by ‘javatmpUserPassword’;`

`mysql > GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES, REFERENCES ON  appdb.* to ‘javatmpUser’@’localhost’ identified by ‘javatmpUserPassword’;`

always be sure to reload all the privileges and changes through the command:

`mysql > FLUSH PRIVILEGES;`

quit to import our database script to your local database instance appdb from `console command line`:

`mysql -ujavatmpUser -pjavatmpUserPassword -D appdb < ./JavaTMP-App-Starter/db_scripts/build.sql`

Now, Your local database should be loaded with all mandatory data and demo users in your local Mysql database 'appdb' instance.
check that by login to mysql and run the following command:

`mysql > show tables;`

### JavaTMP Apps Database Tables
The database schema contains the following tables:
*   activity. Contains data related to all requests of the public or registered users.
*   content. Contains data related to contents.
*   country. Contains data for supported countries referenced by user records.
*   countrytranslation. Contains data for localizing countries referenced by user records.
*   document. Contains binary and meta data of the profile picture of the users and any supported documents might be used in the future.
*   event. Contains events created by user on specific dates.
*   language. Contains supported languages referenced by user records and used to choose appropriate CSS files.
*   languagetranslation. Contains localizing languages for users.
*   message. Contains users' messages.
*   theme. Contains supported theme names referenced by user records and used to choose appropriate front end CSS theme files.
*   themetranslation. Contains localizing themes' names.
*   timezone. Contains supported timezone names supported by Java Virtual machine and referenced by user records to be used for converting string date to correct local date object aligned by the user. 
*   timezonetrnslation. Contains localizing timeszones' names.
*   user. Contains user data and it is main table in the system.
*   account module related tables like account.

Please refer to tables description and corresponding Java bean entity classes
for more information about their fields and values.
