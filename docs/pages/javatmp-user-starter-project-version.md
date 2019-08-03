---
title: JavaTMP-User-Starter Project Version
---
# {{ page.title }}

`JavaTMP-User-Starter` project is an advanced dynamic Java Bootstrap LTR/RTL multi languages User Management Web application Template
derived from `JavaTMP-Static-Ajax` modified and developed to provide a dynamic features built mainly using
`Java Servlet 4.0` and `JSP 2.3` and deployed on `Apache tomcat 9` with support for data persistent
using Mysql Database Management System through java Persistent API and hibernate JPA implementation.

`JavaTMP-User-Starter` porject is a dynamic Java Bootstrap LTR/RTL multi languages User Management Web Application Version
of our Java starter version `JavaTMP-Static-Ajax` customized to provide a user specific features built mainly using
`Java Servlet 4.0` and `JSP 2.3` and deployed on `Apache tomcat 9` and it is a Netbeans IDE 8.2 project, so you can directly
import and open it there.
The [Online Dynamic Java Bootstrap User Management Web Application](http://java.javatmp.com:8080/JavaTMP-User-Starter/ "Dynamic Java Bootstrap LTR/RTL multi languages User Management Web application Template")
provides a running version of this template war file on tomcat 9.

It depends mainly on the following external backend java opensource libraries to provide a dynamic web application features
with custom web MVC for serving JSP pages and handling Servlet requests:
*   Use Apache Commons [BeanUtils 1.9.3](https://commons.apache.org/proper/commons-beanutils/ "Apache Commons beanutils Java Library"),
[Collections 3.2.2](http://commons.apache.org/proper/commons-collections/ "Apache Commons Collections Java Library"),
[Logging 1.2](http://commons.apache.org/proper/commons-logging/ "Apache Commons Logging Java Library"), and
[Lang 3.8.1](http://commons.apache.org/proper/commons-lang/ "Apache Commons Lang Java Library")
*   Use [Google Gson 2.8.5](https://github.com/google/gson "Google Gson JSON Java Library")
*   Use [Standard Taglib 1.2](http://central.maven.org/maven2/javax/servlet/jstl/1.2/ "Java Web Standard Taglib maven repository")
*   Use [hibernate 5.4.1](http://hibernate.org/orm/releases/5.4/ "Hibernate 5.4.1 Home & Download Page").
*   Use [mysql-connector-java-8.0.14.jar](https://dev.mysql.com/downloads/connector/j/8.0.html "Java Mysql Connector 8 for JDBC driver").
*   Use [simplecaptcha-1.2.1.jar](https://sourceforge.net/projects/simplecaptcha/ "Simplecaptcha Home & Download Page").
*   Use [handlebars.java 4.0.6](https://github.com/jknack/handlebars.java).

`JavaTMP-User-Starter` project is a dynamic java web application providing a simple users management demo.
The following list provides the main features of Dynamic Java Bootstrap Users Management web application Template
version `JavaTMP-User-Starter` Project:
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
*   Dynamically switching of interface language using server side session object User and i18n propertybundle.
*   Dynamically switching of theme using server side session object User and bootswatch css files.
*   Dynamically login using dynamic login page and server side servlet for Login.
*   Dynamically logout using dynamic server side servlet.
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

## `JavaTMP-User-Starter` Project Folder Structure
The JavaTMP-User-Starter project folder structure is the same as JavaTMP-Static-Ajax one with the following main contents of its folder root:
```
./JavaTMP-User-Starter
|---.eslintrc (ESLint plugin configuration file which contains directive and parameters to gulp-eslint gulp plugin)
|---.gitignore (git SCM meta file to exclude mainly ./node_modules and ./nbproject/private/ folders from versioning)
|---build.xml (Netbeans IDE auto generated ant build script. used to compile, build, package project through Netbeans IDE or manually by command line)
|---gulpfile.js (gulp's configuration file for automating front end resources and generate assets/dist JS/CSS files)
|---package.json (A Node.js's NPM meta file. This file holds various metadata relevant to the project)
+---conf
    ...
    |---build.sql (Oracle Mysql Database dump script to start the Users Web Application from)
+---lib (External backend Java libraries used in the project)
+---nbproject (Netbeans IDE metadata about project)
+---src (Java source code files like Servlets and services classes)
    +---conf
        |---MANIFEST.MF
        |---persistence.xml (Hibernate and JPA configuration to connect to remote database)
    +---java (Java Source codes)
+---test (Java source code classes for testing and future use)
\---web (Web specific resources like assets, WEB-INF, JSP folders and pages)
    +---META-INF
        |---context.xml (Web Application Context file for Application Server instructions)
    +---WEB-INF (Web Application HTML/JSP pages and resources)
```

### `./JavaTMP-User-Starter/build.xml` file
A standard Netbeans Java Web project uses an IDE-generated Ant build script to build, run, debug, and distribute your project.
The default NetBeans IDE project system is built directly on top of the Ant build system. All of the project commands,
such as "Build Project" and "Run File in Debugger", call targets in the project's Ant script. You can therefore build and
run your project outside the IDE exactly as it is built and run inside the IDE.
Remember that the `build.xml` build script file only contains an import statement that imports targets from `nbproject/build-impl.xml`.
Use the `build.xml` to override targets from `build-impl.xml` or to create new targets.

You do not need to be familiar with `Ant` to work with applications in the IDE. You can set all the basic compilation and
runtime options in your project's Project Properties dialog box and the IDE automatically updates the project's Ant script.
If you know how to work with Ant, you can customize a project's Ant script directly or write your own Ant script for your project.

So, to build your project outside the IDE exactly as it is built make sure you install `Ant` or you added it to your global path
and it is accessible from a command line. If you already install and develop using Netbeans IDE 8.2 it come with `Ant` distribution
installed on `[NetBeans 8.2 installation folder]/extide/ant/bin`, So you can add it to global path environment variables.

#### `ant clean`
Running this command will remove the above `build` and `dist` folders.

#### `ant compile`
Running this command will compile and generate the above `build` folder with `.class` files in `./build/web/WEB-INF/classes` folder,
and `./web` folder in `./build/web` and `./lib` in `./build/web/WEB-INF/lib` folder.

#### `ant dist`
Running this command will generate build folder if it is not exist and create a war package file from`./build/web` folder in it.
So for testing and developing purposes you can deploy this war in any standard Java Servlet container like tomcat 9.
Note that we don't use this `war` on our production online demo because we process and minificate JSP pages and remove all source code
from it before deploy it on production. We create our production war file from a gulp task.

**Read more about Ant and Netbeans IDE Building process:**
*   [Developing Applications with NetBeans IDE](https://docs.oracle.com/netbeans/nb82/netbeans/NBDAG/toc.htm "Developing Applications with NetBeans IDE")
*   [Creating, Importing, and Configuring Java Projects](https://netbeans.org/kb/74/java/project-setup.html "Creating, Importing, and Configuring Java Projects in Netbeans IDE")
*   [Apache Ant Home Page](https://ant.apache.org/ "Apache Ant Home Page")
*   [Advanced Free-Form Project Configuration](https://netbeans.org/kb/articles/freeform-config.html "Advanced Free-Form Netbeans IDE Project Configuration")
*   [Netbeans Build System Design](http://wiki.netbeans.org/BuildSystemDesign "Netbeans IDE Build System Design")

### `./JavaTMP-User-Starter/gulpfile.js` file
This is a gulp's configuration file. gulp is a toolkit for automating painful or time-consuming tasks in your development workflow.
We use gulp to automate our building process like generating JS/CSS. The main important gulp task is `generate-dist`
which copy resources from node_module folder and combine them and compile and generate theme and template Javascript and CSS files
and folders. We described it in details in [JavaTMP-Static-Ajax Project Version documentation page](/pages/javatmp-static-ajax-project-version).

### `./JavaTMP-User-Starter/lib` folder
The `lib` folder contains external backend java libraries needed to compile and run the dynamic web application features. The libraries binary jars only move to `WAR/WEB-INF/lib` when we build and generate war file. Note that the libraries with its source code and java doc are registered with Netbeans IDE project when we import it in Netbeans IDE 8.2. the following tree provide lib folder contents:
```
./JavaTMP-User-Starter/lib
|---mysql-connector-java-8.0.14.jar
|---simplecaptcha-1.2.1.jar
+---antlr4
+---commons-beanutils-1.9.3
+---commons-collections-3.2.2
+---commons-lang-3.8.1
+---commons-logging-1.2
+---google-gson-2.8.5
+---handlebars-4.0.6
+---hibernate-5.4.1
+---jstl-1.2
+---slf4j
```

### `./JavaTMP-User-Starter/src` folder
`src` contains sub folders `conf` and `java` which contains the `Java` source code of all backend classes of the `JavaTMP-User-Starter` template version like Servlets, Services, bean, Java Web listener, Java Web Context classes. The following tree provides its contents and followed by important java and Servlets classes description:

You should be familiar with the below java package structure as we will not describe it nor the Java servlets in details.
```
./JavaTMP-User-Starter/src/java
\---com
    \---javatmp
        +---i18n
        +---module
        |   +---activity
        |   +---content
        |   +---country
        |   +---dms
        |   +---event
        |   +---language
        |   +---message
        |   +---stats
        |   +---theme
        |   +---timezone
        |   \---user
        +---mvc
        |   +---adapter
        |   \---domain
        |       \---table
        +---util
        \---web
            +---controller
            +---filter
            |   \---util
            \---listener
```
#### `com.javatmp.web.listener.JavaTMPHttpSessionListener` class

The `JavaTMPHttpSessionListener` implements `javax.servlet.ServletContextListener` interface
and annotated by `@javax.servlet.annotation.WebListener` annotation to provide a startup and shutdown procedures
when we deploy or undeploy `JavaTMP-User-Starter` web application using `ServletContextListener.contextInitialized` and `ServletContextListener.contextDestroyed` methods.

It considers as a `main` method in the web application environment used normally for initializing global resources
like Database connection pool or Datasource lookup.
We don't do any important things at startup nor shutdown of the web applicationunless than
setting a UTC timezone and create a ServiceFactory instance.

#### `com.javatmp.web.listener.JavaTMPHttpSessionListener` class

The `JavaTMPHttpSessionListener` implements `javax.servlet.http.HttpSessionListener` interface
and annotated by `@javax.servlet.annotation.WebListener` annotation to trigger when a session is created and destroyed
on the application server. So Whenever a new session has been created a `HttpSessionListener.sessionCreated` method will be
invoked and whenever a session has been invalidated a `HttpSessionListener.sessionDestroyed` method will be invoked
by the application server. We don't do any important things at creating or destroying of the session instances.

There is no distinct difference between session timeout and session invalidation from the perspective of the session object.
Whenever it happens the `HttpSessionListener.sessionDestroyed` method will be invoked by the application server.

#### `com.javatmp.web.filter` package

A filter dynamically intercepts requests and responses to transform or use the information contained in the requests
or responses. Filters typically do not themselves create responses, but instead provide universal functions
that can be "attached" to any type of servlet or JSP page.
read more about it in [The Essentials of Filters](http://www.oracle.com/technetwork/java/filters-137243.html "The Essentials of Java Web Filters").

Servlet filters may be declared and mapped using the `WebFilter` annotation, but there is no way to control filter
ordering using annotations alone, read more about this issue on
[How to define servlet filter order of execution using annotations in WAR](https://stackoverflow.com/questions/6560969/how-to-define-servlet-filter-order-of-execution-using-annotations-in-war "How to define servlet filter order of execution using annotations in WAR"). However, you can mix annotations and web.xml to minimize the XML configuration
by only declaring the filter mappings in the `web.xml`. Because we can not guarantee the compatibles
in all Java application server we use ONLY `web.xml` file and the order of the chain is determined
by the order in which matching filter mappings appear in the `web.xml` file.

This package contains classes for implements main filters used in the web application.
We don't use `@javax.servlet.annotation.WebFilter` annotation but instead declared and mapped them in
`./web/WEB-INF/web.xml` to force the order of their executions.
the following list provides our filters with their descriptions in order of their executions:

*   `com.javatmp.web.filter.UTF8InforcerFilter`
*   `com.javatmp.web.filter.LoggingFilter`
*   `com.javatmp.web.filter.LocalizationFilter`
*   `com.javatmp.web.filter.AuthenticatorFilter`
*   `com.javatmp.web.filter.CacheControlHeadersFilter`
*   `com.javatmp.web.filter.ContentCacheFilter`
*   `com.javatmp.web.filter.GZIPCompressingFilter`

#### `com.javatmp.web.controller` package

Java Servlet Classes package for all web application requests and responses.
The servlets classes use `com.javatmp.mvc.MvcHelper` to marshal/unmarshal data or request dispatcher mechanism
to forward request to specific JSP page in `/WEB-INF/` folder.
See above our list of dynamic features currently deploy in the `JavaTMP-User-Starter` project for usage
and information about Java Servlets in this package. The outline classes in `com.javatmp.web.controller` package are:

##### `com.javatmp.web.controller.IndexController` class

The root path main Java Servlet class responsible for handling default root request.
It uses an empty `url-pattern` string annotation instead of providing a welcome page with specific url pattern name.
The complete source code of `IndexController` class is:

```java
package com.javatmp.web.controller;

import ...;

@WebServlet("")
public class IndexController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
    }
}
```
##### `com.javatmp.web.controller.PagesController` class

This class consider as a front controller servlet responsible for forwarding url requests for JSP pages inside
`WEB-INFO/pages/*` folder that does not have specific servlet for handling its url.
The following code provides its source code:

```java
package com.javatmp.web.controller;

import ...;

@WebServlet("/pages/*")
public class PagesController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String requestPath = request.getPathInfo();
        String requestPage = "/WEB-INF/pages" + requestPath + ".jsp";
        logger.info("Request Page [" + requestPage + "]");
        request.getRequestDispatcher(requestPage).forward(request, response);
    }
}

*   Sometimes, We create a separate servlet for handling page request that need data to be populated before dispatching
to specific page. So we use `request.getRequestDispatcher("/WEB-INF/pages/...").forward(request, response);`.
*   Sometimes, The servlet is responsible for handling AJAX request and providing a JSON response only.
So We use `MvcHelper.sendMessageAsJson(response, responseMessage);`.
*   Sometimes, The Servlet need data in request parameters,
so we use `MvcHelper.populateBeanByRequestParameters(HttpServletRequest request, Object bean)` method to read them.
and the same Servlet class implements `doGet` and `doPost` methods. See `com.javatmp.web.controller.LoginController`.
*   Sometimes, The AJAX request has JSON data in the POST request body that should be read to provide another
JSON response as a result like the `jQuery Datatables plugin` pages. So we read request JSON body using
`MvcHelper.readObjectFromRequest(request, DataTableRequest.class);`.

#### `com.javatmp.mvc` package

The main parts of `com.javatmp.mvc` package are sub package `com.javatmp.mvc.domain.table`
which provides a communication protocol And `com.javatmp.mvc.MvcHelper` class which provides `static` utilities methods
for marshaling/unmarshaling AJAX and JSON requests and responses.
The following are an overview of these important parts of this package:

##### `com.javatmp.mvc.domain.table` package

This package contains classes that define a communication protocol for various AJAX requests and JSON responses based
on the JSON structure of jQuery Datatables plugin request parameters in server-side processing mode described in details in
[Server-side processing sent parameters section](https://datatables.net/manual/server-side "jQuery Datatables Server Side Processing Sent Parameters Section").

##### `com.javatmp.mvc.MvcHelper` class

This class provides `static` utilities methods for marshaling/unmarshaling AJAX and JSON requests and responses used almost
in all Servlet classes.

#### `com.javatmp.service` package

This package provides The backend business logic classes implementation of the demo. like UserService, MessageService, DiaryEventService classes. The most important classes in `com.javatmp.service` package are `com.javatmp.service.ServicesFactory` and `com.javatmp.service.DBFaker`:

##### `com.javatmp.service.ServicesFactory` package

It is a Factory instance for all services classes grouped in one class to be injected in the Application Context or Session object for each user. The following code shows you its definition:

Usually, An instance of `ServicesFactory` class is created at web application startup to provide a sharing factory for all users. but for demo purposes and because our data are fake we create an instance of it for each user in the `com.javatmp.web.filter.ServiceFactoryInjector` filter
```java
package com.javatmp.service;

import ...;

public class ServicesFactory {

    private final Logger logger = Logger.getLogger(getClass().getName());
    private DBFaker dbFaker;
    private UserService userService;
    private AccountService accountService;
    private DiaryEventService diaryEventService;
    private DocumentService documentService;
    private CountryService countryService;
    private ContentService contentService;
    private MessageService messageService;

    public ServicesFactory() {
        logger.info("*** Start ServicesFactory Constructor @ [" + new Date() + "]");
        this.dbFaker = new DBFaker();
        this.userService = new UserService(this.dbFaker);
        this.accountService = new AccountService(dbFaker);
        this.diaryEventService = new DiaryEventService(dbFaker);
        this.documentService = new DocumentService(dbFaker);
        this.countryService = new CountryService(dbFaker);
        this.contentService = new ContentService(dbFaker);
        this.messageService = new MessageService(dbFaker, this.userService);
        logger.info("*** End ServicesFactory Constructor @ [" + new Date() + "]");
    }
    // Getter for above Services instances
}
```
##### `com.javatmp.service.DBFaker` package

It is a fake data set generating based on the hard code data stored in the `LinkedList` instances. Keep in mind that this fake database contains unrelated random domain modal to provide demo and proof of concept. The following code shows you the idea:
```java
package com.javatmp.service;

import ...;

public class DBFaker {

    private final Logger logger = Logger.getLogger(getClass().getName());
    private List<User> users = new LinkedList<>();
    private List<DiaryEvent> diaryEvents = new LinkedList<>();
    private List<Document> documents = new LinkedList<>();
    private List<Country> countries = new LinkedList<>();
    private List<Content> contents = new LinkedList<>();
    private List<Account> accounts = new LinkedList<>();
    private List<Message> messages = new LinkedList<>();

    private static Long counter = 0L;

    public static synchronized Long getNextCounter() {
        return ++counter;
    }

    public DBFaker() {
        this.generateFakeUsers();
        this.generateChartOfAccounts();
        this.generateCountries();
        this.generateContent();
        this.generateMessages();
    }


    private void generateFakeUsers() {
        // ...
    }

    private void generateChartOfAccounts() {
        // ...
    }

    private void generateCountries() {
        // ...
    }

    private void generateContent() {
        // ...
    }

    private void generateMessages() {
        // ...
    }
    // Setter and getter ...
}
```

### `./JavaTMP-User-Starter/web` folder
This folder contains everything related to front end resources and plugins and JSP pages for application
and template AJAX requests and web.xml file. The following tree structure provides an outline of its contents with description
and usages.
```
./JavaTMP-User-Starter/web
+---assets
    +---data (Static JSON files used in some plugin demo pages)
    +---dist (Output JS/CSS resource from gulp's task generate-dist)
        +---css
        +---fonts
        +---img
        +---js
    +---img (Static images used in the template)
    +---src (Source folder of front end resources like scss and js files)
        +---fonts
        +---js-src
        +---sass
            |---main.scss
            +---common
            +---font-family
            +---partials
            +---plugins
            +---themes
        +---sass-rtl
            |---main-rtl.scss
            +---common
            +---partials-rtl
            +---plugins-rtl
            +---themes-rtl
+---META-INF
    |---context.xml
+---WEB-INF (Hidden and not accessible directly from the browser requests)
    |---index.jsp (Main JSP Page)
    |---web.xml
    +---pages
        |---home.jsp
        +---bootstrap
        +---chart
        +---custom-components
        +---custom-pages
        +---form
        +---gallery
        +---plugins
        +---table
        +---themes
        +---wizard
```
The main important JSP page in our dynamic Java Bootstrap template is `index.jsp` which was dispatched from `com.javatmp.web.controller.IndexController` Servlet class to the user. The following HTML code provides its contents:
```jsp
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="${labels["global.language"]}" dir="${labels["global.direction"]}">
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
*   We minimize the use of Java features like EL mixed with Javascript whenever possible other than in `index.jsp` to pass them to `javatmp.init method`
*   `sessionScope.user` object was injected in the session by `com.javatmp.web.filter.ServiceFactoryInjector` filter.
*   `labels` object is an instance of `ResourceBundle` which was injected into session by `com.javatmp.web.filter.LocalizationFilter` filter.
*   Read more about `javatmp.init` Javascript function in the following page : [High Level Template Structure](/pages/high-level-template-structure "High Level JavaTMP Template Folders And Files Structure").

### Dynamic JSP Starter Pages
The starter Java Bootstrap default English LTR `index.jsp` page that use the above generated combined files look like the following:
```jsp
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" dir="ltr">
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
And the starter Java Bootstrap default English RTL `index.jsp` page that use the above generated combined files look like the following:
```jsp
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" dir="rtl">
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
And the starter Java Bootstrap default Arabic RTL `index.jsp` page that use the above generated combined files look like the following:
```jsp
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ar" dir="rtl">
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

### Generating Production `JavaTMP-User-Starter.war` file
Generating our [online production Java Bootstrap User Web application war file](http://java.javatmp.com:8080/JavaTMP-User-Starter/ "Java Bootstrap User Management Web application war file") is done using the following special gulp's task steps (Make sure first that `ant compile` or `ant dist` is ran first because this task depends on the `build` folder generating from running `ant` script):
```javascript
gulp.src([
    './JavaTMP-User-Starter/**/*',
    '!**/node_modules{,/**}',
    '!**/nbproject/private{,/**}',
    '!**/package-lock.json'
], {dot: true})
        .pipe(gulp.dest("temp/JavaTMP-User-Starter"));
gulp.src(['temp/JavaTMP-User-Starter/build/web/**/*'], {dot: true})
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
        .pipe(zip('JavaTMP-User-Starter.war'))
        .pipe(gulp.dest('temp'));
```

## Installation and Deploying
### Preparing Netbeans 8.2 Project

The `JavaTMP-User-Starter` project is a Netbeans IDE 8.2 project, so you can directly import and open it there for
compilation and deploying

### Preparing Oracle Mysql Database Management System

Although we use JPA with Hibernate implementation library for managing and wrapping connections and JDBC handling to provide
standard interface for any database management, we tested and deployed our online demo version with Oracle Mysql Database,
So we describe and prepare it as a standard database vendor to use in JavaTMP projects.

First of all make sure you install and prepare your Oracle Mysql Database management system in your local development machine
and follow the documentation on their [website](https://www.mysql.com/ "Oracle Mysql Database Management System Home Page").

Most Database parameters like database name, username and password should be saved and changed in
`./JavaTMP-User-Starter/src/conf/persistence.xml` file.

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

`mysql -ujavatmpUser -pjavatmpUserPassword -D appdb < ./JavaTMP-User-Starter/conf/build.sql`

Now, Your local database should be loaded with all mandatory data and demo users in your local Mysql database 'appdb' instance.
check that by login to mysql and run the following command:

`mysql > show tables;`

### JavaTMP Users Project Database Tables
The database schema contains the following tables:
*   activity. Contains data related to all requests of the public or registered users.
*   country. Contains data for supported countries referenced by user records.
*   document. Contains binary and meta data of the profile picture of the users and any supported documents might be used in the future.
*   language. Contains supported languages referenced by user records and used to choose appropriate CSS files.
*   theme. Contains supported theme names referenced by user records and used to choose appropriate front end CSS theme files.
*   timezone. Contains supported timezone names supported by Java Virtual machine and referenced by user records to be used for converting string date to correct local date object aligned by the user. 
*   user. Contains user data and it is main table in the system.

Please refer to tables description and corresponding Java bean classes in `com.javatmp.module` package
for more information about their fields and values.
