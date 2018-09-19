---
title: JavaTMP-Java-Ajax Project Version
---
# JavaTMP-Java-Ajax Project Version

`JavaTMP-Java-Ajax` porject is a dynamic `Java` LTR/RTL multi languages Bootstrap Admin and Dashboard Web Application Version of our static starters versions `JavaTMP-Static-Ajax-Starter` and `JavaTMP-Static-Ajax-Starter-RTL` combined and developed to provide a dynamic features built mainly using `Java Servlet 4.0` and `JSP 2.3` and deployed on `Apache tomcat 9`. The [online Java demo link](http://java.javatmp.com:8080/JavaTMP-Java-Ajax/ "Dynamic Java Bootstrap LTR/RTL multi languages Admin and dashboard components template") provide a running version of this project war file on tomcat 9.

It depends mainly on the following external backend java opensource libraries to provide a dynamic web application features with custom web MVC for serving JSP pages and handling Servlet requests:

*   Use Apache Commons [BeanUtils 1.9.3](https://commons.apache.org/proper/commons-beanutils/ "Apache Commons beanutils Java Library"), [Collections 3.2.2](http://commons.apache.org/proper/commons-collections/ "Apache Commons Collections Java Library"), [Logging 1.2](http://commons.apache.org/proper/commons-logging/ "Apache Commons Logging Java Library"), and [Lang 3.7](http://commons.apache.org/proper/commons-lang/ "Apache Commons Lang Java Library")
*   Use [Google Gson 2.8.2](https://github.com/google/gson "Google Gson JSON Java Library")
*   Use [Standard Taglib 1.2](http://central.maven.org/maven2/javax/servlet/jstl/1.2/ "Java Web Standard Taglib maven repository")

`JavaTMP-Java-Ajax` project is a general dynamic web application with a subset of dynamic plugins and pages to provide a general demo to test and use specific plugin in Java Web environment. The following documentation page provide you a list of dynamic pages exist on the dynamic java version : [Dynamic Java Bootstrap Web Application features](/pages/dynamic-java-bootstrap-web-application-features "Dynamic Java Bootstrap Web Application features")

Remember that the `JavaTMP-Java-Ajax` project is a Netbeans IDE 8.2 project, so you can directly import and open it there.

The following tree provides a high level folder structures of our `JavaTMP-Java-Ajax` web application with its description and usage and for a running web application structure see our [online demo for WAR file contents](http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/plugins/tree/fancytree/plain_fancytree "Dynamic Java Bootstrap WAR file contents structure"):
```
./JavaTMP-Java-Ajax
|---.eslintrc (ESLint plugin configuration file which contains directive and parameters to gulp-eslint gulp plugin)
|---.gitignore (git SCM meta file to exclude mainly ./node\_modules and ./nbproject/private/ folders from versioning)
|---build.xml (Netbeans IDE auto generated ant build script. used to compile, build, package project through Netbeans IDE or manually by command line)
|---gulpfile.js (gulp's configuration file for automating front end resources and generate assets/dist JS/CSS files)
|---package.json (A Node.js's NPM meta file. This file holds various metadata relevant to the project)
+---build (Netbeans auto generated folder with Java classes compiled from src folder and all resources in web folder like JSP, Javascript, CSS, images)
+---dist (Netbeans IDE auto generated distribution war file generated from packaging files from build folder)
+---lib (External backend Java libraries used in the project)
+---nbproject (Netbeans IDE metadata about project)
+---src (Java source code files like Servlets and services classes)
+---test (Java source code classes for testing and future use)
+---web (Web specific resources like assets, WEB-INF, JSP folders and pages)
```
`./JavaTMP-Java-Ajax/build.xml` file
--------------------------------------------

A standard Netbeans Java Web project uses an IDE-generated Ant build script to build, run, debug, and distribute your project. The default NetBeans IDE project system is built directly on top of the Ant build system. All of the project commands, such as "Build Project" and "Run File in Debugger", call targets in the project's Ant script. You can therefore build and run your project outside the IDE exactly as it is built and run inside the IDE. Remember that the `build.xml` build script file only contains an import statement that imports targets from `nbproject/build-impl.xml`. Use the `build.xml` to override targets from `build-impl.xml` or to create new targets.

You do not need to be familiar with Ant to work with applications in the IDE. You can set all the basic compilation and runtime options in your project's Project Properties dialog box and the IDE automatically updates the project's Ant script. If you know how to work with Ant, you can customize a project's Ant script directly or write your own Ant script for your project.

So, to build your project outside the IDE exactly as it is built make sure you install `Ant` or you added it to your global path and it is accessible from a command line. If you already install and develop using Netbeans IDE 8.2 it come with `Ant` distribution installed on `[NetBeans 8.2 installation folder]/extide/ant/bin`, So you can add it to global path environment variables.

### `ant clean`

Running this command will remove the above `build` and `dist` folders.

### `ant compile`

Running this command will compile and generate the above `build` folder with `.class` files in `./build/web/WEB-INF/classes` folder, and `./web` folder in `./build/web` and `./lib` in `./build/web/WEB-INF/lib` folder.

### `ant dist`

Running this command will generate build folder if it is not exist and create a war package file from`./build/web` folder in it. So for testing and developing purposes you can deploy this war in any standard Java Servlet container like tomcat 9. Note that we don't use this `war` on our production online demo because we process and minificate JSP pages and remove all source code from it before deploy it on production. We create our production war file from a gulp task.

Read more about Ant and Netbeans IDE Building process:

*   [Developing Applications with NetBeans IDE](https://docs.oracle.com/netbeans/nb82/netbeans/NBDAG/toc.htm "Developing Applications with NetBeans IDE")
*   [Creating, Importing, and Configuring Java Projects](https://netbeans.org/kb/74/java/project-setup.html "Creating, Importing, and Configuring Java Projects in Netbeans IDE")
*   [Apache Ant Home Page](https://ant.apache.org/ "Apache Ant Home Page")
*   [Advanced Free-Form Project Configuration](https://netbeans.org/kb/articles/freeform-config.html "Advanced Free-Form Netbeans IDE Project Configuration")
*   [Netbeans Build System Design](http://wiki.netbeans.org/BuildSystemDesign "Netbeans IDE Build System Design")

`./JavaTMP-Java-Ajax/gulpfile.js` file
----------------------------------------------

This is a gulp's configuration file. gulp is a toolkit for automating painful or time-consuming tasks in your development workflow. We use gulp to automate our building process like generating JS/CSS. The main important gulp task is `generate-dist` which copy resources from node\_module folders and combine then and compile and generate theme and template Javascript and CSS files and folders. We described it in details in [JavaTMP-Static-Ajax-Starter Project Version documentation page](/pages/javatmp-static-ajax-starter-project-version "Java Bootstrap Admin and Dashboard Starter template documentation Page") and in [JavaTMP-Static-Ajax-Starter-RTL Project Version documentation page](/pages/javatmp-static-ajax-starter-rtl-project-version "Java Bootstrap Admin and Dashboard Starter RTL template documentation Page"). The outline of gulp task `generate-dist` are:

1.  Compile Bootstrap SASS themes in `./web/assets/src/sass/themes/javatmp-*.scss` and put them to `./web/assets/dist/css` folder
2.  Compile Bootstrap RTL SASS themes in `./web/assets/src/sass-rtl/themes-rtl/javatmp-*-rtl.scss` and put them to `./web/assets/dist/css` folder
3.  Concatenate all plugins CSS files define in  `src.css` in order and put the concatenated file in `./web/assets/dist/css/javatmp-plugins-all.min.css`
4.  Concatenate all plugin CSS files define in  `src.cssForPrint` in order and put the concatenated file in `./web/assets/dist/css/javatmp-plugins-print-all.min.css`
5.  Generate and uglify main JavaTMP template Javascript file `javatmp.min.js` in `./web/assets/src/js-src/javatmp.js` to `./web/assets/dist/js/javatmp.min.js`
6.  Concatenate all plugins JS files define in  `src.js` in order and put the concatenated file `./web/assets/dist/js/javatmp-plugins-all.min.js`
7.  Generate a minification version `javatmp-plugins-all-locale-*.min.js` files of `src.localeJS` for each language key and put it in `./web/assets/dist/js`
8.  Compile and generate a minification version of `src.fontFamilyFiles` and put the css file in `./web/assets/dist/css`, in above case `./web/assets/dist/css/font-family-en.min.css`
9.  Copy `src.img` files needed by plugins to `./web/assets/dist/img` folder
10.  Copy binary fonts files needed by plugins and template from `src.fonts` to `./web/assets/dist/fonts folder`
11.  finally, remove `./web/components` folder as all front-end resources became combined and concatenated in TWO BIG LARGE MAIN files `javatmp-plugins-all.min.css` and `javatmp-plugins-all.min.js`

So, The main output of `generate-dist` task is folder `./web/assets/dist` which contains the following:
```
./JavaTMP/JavaTMP-Static-Ajax-Starter/web/assets/dist
+---css
    +---font-family-\*.min.css (For each src.fontFamilyFiles key)
    +---javatmp-plugins-all.min.css
    +---javatmp-plugins-print-all.min.css
    +---javatmp-\*.min.css (For each SASS theme files like javatmp-default.min.css)
    +---javatmp-\*-rtl.min.css (For each SASS RTL theme files like javatmp-default-rtl.min.css)
+---fonts (Copy from src.fonts)
    +---context-menu-icons.eot
    +---fa-brands-400.eot
    +---open-sans-v15-latin-300.eot
    +---DroidKufi-Regular.eot
    +---slick.eot
    +---summernote.eot
    +---...
+---img (Moved from src.img as needed by plugins)
    +---ajax-loader.gif
    +---mCSB\_buttons.png
+---js
    +---javatmp-plugins-all-locale-\*.min.js (For each language key define in src.localeJS)
    +---javatmp-plugins-all.min.js
    +---javatmp.min.js
```
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
`./JavaTMP-Java-Ajax/lib` folder
----------------------------------------

The `lib` folder contains external backend java libraries needed to compile and run the dynamic web application features. The libraries binary jars only move to `WAR/WEB-INF/lib` when we build and generate war file. Note that the libraries with its source code and java doc are registered with Netbeans IDE project when we import it in Netbeans IDE 8.2. the following tree provide lib folder contents:
```
./JAVATMP-JAVA-AJAX/LIB
+---commons-beanutils-1.9.3
    +---commons-beanutils-1.9.3-javadoc.jar
    +---commons-beanutils-1.9.3-sources.jar
    +---commons-beanutils-1.9.3.jar
+---commons-collections-3.2.2
    +---commons-collections-3.2.2-javadoc.jar
    +---commons-collections-3.2.2.jar
+---commons-lang3-3.7
    +---commons-lang3-3.7-javadoc.jar
    +---commons-lang3-3.7-sources.jar
    +---commons-lang3-3.7.jar
+---commons-logging-1.2
    +---commons-logging-1.2-javadoc.jar
    +---commons-logging-1.2.jar
+---google-gson-2.8.2
    +---gson-2.8.2-javadoc.jar
    +---gson-2.8.2-sources.jar
    +---gson-2.8.2.jar
+---jstl-1.2
    +---jstl-1.2.jar
```
`./JavaTMP-Java-Ajax/src` folder
----------------------------------------

`src` contains sub folders `conf` and `java` which contains the `Java` source code of all backend classes of the `JavaTMP-Java-Ajax` template version like Servlets, Services, bean, Java Web listener, Java Web Context classes. The following tree provides its contents and followed by important java and Servlets classes description:

You should be familiar with the below java package structure as we will not describe it nor the Java servlets in details.
```
./JavaTMP-Java-Ajax/src/java
+---com
    +---javatmp
        +---domain (like Account.java, Content.java, Country.java, DiaryEvent.java, Document.java, Message.java, User.java)
        +---i18n (like messages.properties, messages\_ar.properties, messages\_en.properties)
        +---mvc
            |---MvcHelper.java (The main class used to provide a Web MVC for handling HTTP requests and sending back responses)
            +---adapter (helper classes for Gson marshalling and unmarshalling requests and responses)
            +---domain (Web MVC specific domain modal classes)
                |---ResponseMessage.java
                +---table (like DataTableColumnSpecs.java, DataTableRequest.java, DataTableResults.java, FilterBy.java, Order.java, OrderDir.java, Search.java, SortBy.java)
        +---service (like AccountService.java, ContentService.java, CountryService.java, DBFaker.java, DiaryEventService.java, DocumentService.java, MessageService.java, ServicesFactory.java, UserService.java
        +---util (like CacheEntry.java, CacheResponseStream.java, CacheResponseWrapper.java, Constants.java, GZIPResponseStream.java, GZIPResponseWrapper.java, MD5Util.java)
        +---web
            +---controller (Java Servlet Classes. like IndexController.java, LoginController.java, LogoutController.java, PagesController.java, UpdateLanguageController.java, UpdateThemeController.java)
                +---calendar (package contains specific Servlet classes for serving dynamic fullcalendar demo page)
                +---card (package contains specific Servlet classes for serving dynamic card contents demo page)
                +---cms (package contains specific Servlet classes for serving dynamic content management demo page)
                +---country (package contains specific Servlet classes for serving dynamic countries demo page)
                +---dms (package contains specific Servlet classes for serving file management demo page)
                +---message (package contains specific Servlet classes for serving user messages demo page)
                +---select2 (package contains specific Servlet classes for serving dynamic select2 demo page)
                +---tree (package contains specific Servlet classes for serving dynamic fancytree demo page)
                +---user (package contains specific Servlet classes for serving users demo page)
                +---util (like servlet AjaxSleeperController.java)
            +---filter (package for main web filters used like AuthenticatorFilter.java, CacheControlHeadersFilter.java, ContentCacheFilter.java, GZIPCompressingFilter.java, LocalizationFilter.java, LoggingFilter.java, ServiceFactoryInjector.java, UselessWaitFilter.java)
            +---listener (package contains main web listener used like JavaTMPHttpSessionListener.java, JavaTMPServletListener.java)
```
### `com.javatmp.web.listener.JavaTMPHttpSessionListener` class

The `JavaTMPHttpSessionListener` implements `javax.servlet.ServletContextListener` interface and annotated by `@javax.servlet.annotation.WebListener` annotation to provide a startup and shutdown procedures when we deploy or undeploy `JavaTMP-Java-Ajax` web application using `ServletContextListener.contextInitialized` and `ServletContextListener.contextDestroyed` methods.

It considers as a `main` method in the web application environment used normally for initializing global resources like Database connection pool or Datasource lookup. We don't do any important things at startup nor shutdown of the web applicationunless than setting a UTC timezone.

### `com.javatmp.web.listener.JavaTMPHttpSessionListener` class

The `JavaTMPHttpSessionListener` implements `javax.servlet.http.HttpSessionListener` interface and annotated by `@javax.servlet.annotation.WebListener` annotation to trigger when a session is created and destroyed on the application server. So Whenever a new session has been created a `HttpSessionListener.sessionCreated` method will be invoked and whenever a session has been invalidated a `HttpSessionListener.sessionDestroyed` method will be invoked by the application server.

We don't do any important things at creating or destroying of the session instances unless than removing an instance of `com.javatmp.service.ServicesFactory` class attached to each session for demo purposes in `com.javatmp.web.filter.ServiceFactoryInjector` filter class using the name defined in `com.javatmp.util.Constants.SERVICES_FACTORY_ATTRIBUTE_NAME` variable.

There is no distinct difference between session timeout and session invalidation from the perspective of the session object. whenever it happens the `HttpSessionListener.sessionDestroyed` method will be invoked by the application server.

### `com.javatmp.web.filter` package

A filter dynamically intercepts requests and responses to transform or use the information contained in the requests or responses. Filters typically do not themselves create responses, but instead provide universal functions that can be "attached" to any type of servlet or JSP page. read more about it in [The Essentials of Filters](http://www.oracle.com/technetwork/java/filters-137243.html "The Essentials of Java Web Filters").

This package contains classes for implements main filters used in the web application. We don't use `@javax.servlet.annotation.WebFilter` annotation but instead declared and mapped them in `./web/WEB-INF/web.xml` to force the order of their executions. read more on this issue on [How to define servlet filter order of execution using annotations in WAR](https://stackoverflow.com/questions/6560969/how-to-define-servlet-filter-order-of-execution-using-annotations-in-war "How to define servlet filter order of execution using annotations in WAR"). the following list provides our filters with their descriptions in order of their executions:

Servlet filters may be declared and mapped using the `WebFilter` annotation, but there is no way to control filter ordering using annotations alone. However, you can mix annotations and web.xml to minimize the XML configuration by only declaring the filter mappings in the `web.xml`. Because we can not guarantee the compatibles in all Java application server we use ONLY `web.xml` file and the order of the chain is determined by the order in which matching filter mappings appear in the `web.xml` file.

1.  `com.javatmp.web.filter.LoggingFilter`
2.  `com.javatmp.web.filter.UselessWaitFilter`
3.  `com.javatmp.web.filter.LocalizationFilter`
4.  `com.javatmp.web.filter.ServiceFactoryInjector`
5.  `com.javatmp.web.filter.AuthenticatorFilter`
6.  `com.javatmp.web.filter.CacheControlHeadersFilter`
7.  `com.javatmp.web.filter.ContentCacheFilter`
8.  `com.javatmp.web.filter.GZIPCompressingFilter`

### `com.javatmp.web.controller` package

Java Servlet Classes package for all web application requests and responses. The servlets classes use `com.javatmp.mvc.MvcHelper` to marshal/unmarshal data or request dispatcher mechanism to forward request to specific JSP page in `/WEB-INF/` folder. See our [list of dynamic features currently deploy in the `JavaTMP-Java-Ajax` project](/pages/dynamic-java-bootstrap-web-application-features "Java Bootstrap Admin And Dashboard Template Dynamic feature list") for usage and information about Java Servlets in this package. The outline classes in `com.javatmp.web.controller` package are:

#### `com.javatmp.web.controller.IndexController` class

The root path main Java Servlet class responsible for handling default root request. It uses an empty `url-pattern` string annotation instead of providing a welcome page with specific url pattern name. The complete source code of `IndexController` class is:
```java
package com.javatmp.web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("")
public class IndexController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
    }
}
```
#### `com.javatmp.web.controller.PagesController` class

This class consider as a front controller servlets responsible for forwarding requests for all static JSP pages inside `WEB-INFO/pages/*` folder that does not have specific servlet for handling its url. The following code provides its source code:
```java
package com.javatmp.web.controller;

import java.io.IOException;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/pages/\*")
public class PagesController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String requestPath = request.getPathInfo();
        String requestPage = "/WEB-INF/pages" + requestPath + ".jsp";
        logger.info("Request Page \[" + requestPage + "\]");
        request.getRequestDispatcher(requestPage).forward(request, response);
    }
}
```
#### `com.javatmp.web.controller.select2.DynamicSelect2PageController` class

Sometimes, We create a separate servlet for handling page request that need data to be populated before dispatching like in `DynamicSelect2PageController` class. The following code shows the idea:
```java
package com.javatmp.web.controller.select2;

import com.javatmp.domain.Country;
import com.javatmp.service.CountryService;
import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DynamicSelect2PageController")
public class DynamicSelect2PageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES\_FACTORY\_ATTRIBUTE\_NAME);
        CountryService countryService = sf.getCountryService();
        List<Country> countries = countryService.getCountries();
        request.setAttribute("countries", countries);
        request.getRequestDispatcher("/WEB-INF/pages/plugins/dynamic-jQuery-select2-bootstrap.jsp").forward(request, response);
    }
}
```
#### `com.javatmp.web.controller.user.ListUsersPositionsController` class

Sometimes, The servlet is responsible for handling AJAX request and providing a JSON response only. The `ListUsersPositionsController` Servlet class handle request using url pattern `/user/ListUsersPositionsController` and called in page `./web/WEB-INF/pages/plugins/dynamic-jQuery-select2-bootstrap.jsp` to populate select2 select at page load. The following code shows the Servlet source code:
```java
package com.javatmp.web.controller.user;

import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.service.ServicesFactory;
import com.javatmp.service.UserService;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/ListUsersPositionsController")
public class ListUsersPositionsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES\_FACTORY\_ATTRIBUTE\_NAME);
        UserService cs = sf.getUserService();
        List<String> positions = cs.listUsersPositions();
        responseMessage.setOverAllStatus(true);
        responseMessage.setData(positions);
        MvcHelper.sendMessageAsJson(response, responseMessage);
    }
}
```
#### `com.javatmp.web.controller.LoginController` class

Sometimes, The Servlet need data in request parameters, so we use `MvcHelper.populateBeanByRequestParameters(HttpServletRequest request, Object bean)` method to read them. and the same Servlet class implements `doGet` and `doPost` methods. The source code for `LoginController` provides the idea:
```java
package com.javatmp.web.controller;

import ...;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/custom-pages/login-pages/default-login-page.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        ServicesFactory sf = (ServicesFactory) session.getAttribute(Constants.SERVICES\_FACTORY\_ATTRIBUTE\_NAME);

        User user = new User();
        ResponseMessage responseMessage = new ResponseMessage();
        MvcHelper.populateBeanByRequestParameters(request, user);
        logger.info("Check User \[" + MvcHelper.deepToString(user) + "\]");
        User dbUser = sf.getUserService().readUserByUsername(user);

        if (dbUser != null && dbUser.getPassword().equals(MD5Util.convertToMD5(user.getPassword()))) {
            // Authenticated user
            session.setAttribute("user", dbUser);
            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage(request.getContextPath() + "/");
        } else {
            // un authenticated user
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage("kindly Check your username and password");
        }
        MvcHelper.sendMessageAsJson(response, responseMessage);
    }
}
```
#### `com.javatmp.web.controller.user.ListUsersController` class

Sometimes, The AJAX request has JSON data in the POST request body that should be read to provide another JSON response as a result like the `jQuery Datatables plugin` demo pages. The following source code shows the idea:
```java
package com.javatmp.web.controller.user;
import ...;
@WebServlet("/user/ListUsersController")
public class ListUsersController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES\_FACTORY\_ATTRIBUTE\_NAME);
        UserService cs = sf.getUserService();

        DataTableRequest tableRequest = (DataTableRequest) MvcHelper.readObjectFromRequest(request, DataTableRequest.class);
        logger.info("datatableRequest \[" + MvcHelper.deepToString(tableRequest) + "\]");

        DataTableResults<User> dataTableResult = cs.listUsers(tableRequest);

        responseMessage.setOverAllStatus(true);
        responseMessage.setData(dataTableResult);

       MvcHelper.sendMessageAsJson(response, responseMessage);
    }
}
```
And this is the AJAX request from `Datatables` plugin to retrieved list of users pages on the current page request it see `./web/WEB-INF/pages/table/datatable/dynamic-datatables.jsp` page:
```json
...
"ajax": {
    "type": "POST",
    "url": javatmp.settings.contextPath + "/user/ListUsersController",
    dataType: "json",
    contentType: "application/json; charset=UTF-8",
     "data": function (currentData) {
        currentData.\_ajaxGlobalBlockUI = false;
        return JSON.stringify(currentData);
    },
    "dataSrc": function (json) {
        json\["recordsTotal"\] = json.data.recordsTotal;
        json\["recordsFiltered"\] = json.data.recordsFiltered;
        return json.data.data;
    }
}
...
```
#### `com.javatmp.web.controller.message.ListMessagesController` class

Sometimes, The same Servlet used in different AJAX pages to retrieved data based of specific parameters. The following code shows the source code of `ListMessagesController` class:
```java
package com.javatmp.web.controller.message;
import ...;
@WebServlet("/user/ListMessagesController")
public class ListMessagesController extends HttpServlet {
    private final Logger logger = Logger.getLogger(getClass().getName());
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES\_FACTORY\_ATTRIBUTE\_NAME);
        MessageService cs = sf.getMessageService();

        DataTableRequest tableRequest = (DataTableRequest) MvcHelper.readObjectFromRequest(request, DataTableRequest.class);
        logger.info("datatableRequest \[" + MvcHelper.deepToString(tableRequest) + "\]");

        DataTableResults<Message> dataTableResult = cs.listMessages(tableRequest);

        responseMessage.setOverAllStatus(true);
        responseMessage.setData(dataTableResult);

        MvcHelper.sendMessageAsJson(response, responseMessage);
    }
}
```
It was called from `./web/WEB-INF/pages/table/datatable/dynamic-messages.jsp` page to populate normal jQuery Datatables plugin with AJAX data page. Or to provide a virtual scrollable data in dynamic user messages dropdown menu at navbar in `./web/WEB-INF/index.jsp` page. And it used in the `./web/WEB-INF/pages/plugins/dynamic-messages-using-malihu-scrollable.jsp` page too to provide virtual scrollable for user messages.

### `com.javatmp.mvc` package

The main parts of `com.javatmp.mvc` package are sub package `com.javatmp.mvc.domain.table` which provides a communication protocol And `com.javatmp.mvc.MvcHelper` class which provides `static` utilities methods for marshaling/unmarshaling AJAX and JSON requests and responses. The following are an overview of these important parts of this package:

#### `com.javatmp.mvc.domain.table` package

This package contains classes that define a communication protocol for various AJAX requests and JSON responses based on the JSON structure of jQuery Datatables plugin request parameters in server-side processing mode described in details in [Server-side processing sent parameters section](https://datatables.net/manual/server-side "jQuery Datatables Server Side Processing Sent Parameters Section").

#### `com.javatmp.mvc.MvcHelper` class

This class provides `static` utilities methods for marshaling/unmarshaling AJAX and JSON requests and responses used almost in all Servlet classes. The main methods in MvcHelper are:

*   `public static String toString(Object object)` - uses Apache Common Lang `ReflectionToStringBuilder` class to dynamically convert an object to String for printing and logging.
*   `public static String deepToString(Object object)` - uses Apache Common Lang `ReflectionToStringBuilder` class recursively to dynamically convert an object with its children to String for printing and logging.
*   `public static void populateBeanByRequestParameters(HttpServletRequest request, Object bean)` - Uses Apache Commons Beans utility to inject request parameters into bean
*   `public static void sendMessageAsJson(HttpServletResponse response, ResponseMessage responseMessage)` - uses `toJson` method from an `Gson` instance to convert the responseMessage object to `JSON` String and then send it in the response body.
*   `public static <T> T readObjectFromRequest(HttpServletRequest request, T object)` - populate a passing instance of T with JSON String body from the request after convert it using `Gson.fromJson` method.
*   `public static Object readObjectFromRequest(HttpServletRequest request, Class clz)` - populate an instance of passing clz type with JSON String body from the request after convert it using `Gson.fromJson` method.

### `com.javatmp.service` package

This package provides The backend business logic classes implementation of the demo. like UserService, MessageService, DiaryEventService classes. The most important classes in `com.javatmp.service` package are `com.javatmp.service.ServicesFactory` and `com.javatmp.service.DBFaker`:

#### `com.javatmp.service.ServicesFactory` package

It is a Factory instance for all services classes grouped in one class to be injected in the Application Context or Session object for each user. The following code shows you its definition:

Usually, An instance of `ServicesFactory` class is created at web application startup to provide a sharing factory for all users. but for demo purposes and because our data are fake we create an instance of it for each user in the `com.javatmp.web.filter.ServiceFactoryInjector` filter
```java
package com.javatmp.service;

import java.util.Date;
import java.util.logging.Logger;

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
        logger.info("\*\*\* Start ServicesFactory Constructor @ \[" + new Date() + "\]");
        this.dbFaker = new DBFaker();
        this.userService = new UserService(this.dbFaker);
        this.accountService = new AccountService(dbFaker);
        this.diaryEventService = new DiaryEventService(dbFaker);
        this.documentService = new DocumentService(dbFaker);
        this.countryService = new CountryService(dbFaker);
        this.contentService = new ContentService(dbFaker);
        this.messageService = new MessageService(dbFaker, this.userService);
        logger.info("\*\*\* End ServicesFactory Constructor @ \[" + new Date() + "\]");
    }
    // Getter for above Services instances
}
```
#### `com.javatmp.service.DBFaker` package

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
`./JavaTMP-Java-Ajax/web` folder
----------------------------------------

This folder contains everything related to front end resources and plugins and JSP pages for all plugin demo and template AJAX requests and web.xml file. The following tree structure provides an outline of its contents with description and usages. See our [online demo page for complete list of JavaTMP WAR File Contents](http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/plugins/tree/fancytree/plain_fancytree "online demo page for complete list of JavaTMP WAR File Contents"):
```
./JavaTMP-Java-Ajax/web
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
            +---pages
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
<html lang="${labels\["global.language"\]}" dir="${labels\["global.direction"\]}">
    <head>
        <title>${labels\["global.page.title"\]}</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-all.min.css" rel="stylesheet" type="text/css"/>
        <link href='${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-print-all.min.css' rel='stylesheet' media='print' />

        <!-- Include directional support -->
        <c:if test="${labels\['global.direction'\] == 'ltr'}">
            <link id="themeStyleSheet" href="${pageContext.request.contextPath}/assets/dist/css/javatmp-${sessionScope.user.theme}.min.css" rel="stylesheet" type="text/css"/>
        </c:if>
        <c:if test="${labels\['global.direction'\] == 'rtl'}">
            <link id="themeStyleSheet" href="${pageContext.request.contextPath}/assets/dist/css/javatmp-${sessionScope.user.theme}-rtl.min.css" rel="stylesheet" type="text/css"/>
        </c:if>

        <!-- Include language support font -->
        <link href="${pageContext.request.contextPath}/assets/dist/css/font-family-${labels\['global.language'\]}.min.css" rel="stylesheet" type="text/css"/>
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
                    defaultPassData: {\_ajax: "ajax", \_ajaxGlobalBlockUI: true, \_handleAjaxErrorGlobally: true},
                    defaultOutputSelector: '.main-body-content-container',
                    defaultUrl: '${pageContext.request.contextPath}/pages/home',
                    floatDefault: "${labels\['global.floatDefault'\]}",
                    floatReverse: "${labels\['global.floatReverse'\]}",
                    direction: "${labels\['global.direction'\]}",
                    isRTL: ${labels\['global.direction'\] == 'ltr' ? 'false' : 'true'},
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
### Notes

*   We minimize the use of Java features like EL mixed with Javascript whenever possible other than in `index.jsp` to pass them to `javatmp.init method`
*   `sessionScope.user` object was injected in the session by `com.javatmp.web.filter.ServiceFactoryInjector` filter.
*   `labels` object is an instance of `ResourceBundle` which was injected into session by `com.javatmp.web.filter.LocalizationFilter` filter.
*   Read more about `javatmp.init` Javascript function in the following page : [JavaTMP Javascript Files](/pages/javatmp-javascript-files "JavaTMP Javascript Files").

Generating Production `JavaTMP-Java-Ajax.war` file
----------------------------------------------------------

Generating our [online production Java Bootstrap Web application war file](http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/home "online production Java Bootstrap Web application war file") is done using the following special gulp's task steps (Make sure first that `ant compile` or `ant dist` is ran first because this task depends on the `build` folder generating from running `ant` script):
```javascript
gulp.src(\[
    './JavaTMP-Java-Ajax/\*\*/\*',
    '!\*\*/node\_modules{,/\*\*}',
    '!\*\*/nbproject/private{,/\*\*}',
    '!\*\*/package-lock.json'
\], {dot: true})
        .pipe(gulp.dest("temp/JavaTMP-Java-Ajax"));
gulp.src(\['temp/JavaTMP-Java-Ajax/build/web/\*\*/\*'\], {dot: true})
        .pipe(gulp.dest("temp/online-java-demo-starter"));
gulp.src(\['temp/online-java-demo-starter/\*\*/\*.html', 'temp/online-java-demo-starter/\*\*/\*.jsp'\], {dot: true})
        .pipe(htmlmin({collapseWhitespace: true,
            minifyCSS: true,
            minifyJS: true,
            removeComments: true,
            ignoreCustomComments: false,
            keepClosingSlash: true,
            ignoreCustomFragments: \[/<%@\[\\s\\S\]\*?%>/, /\\$\\{\[\\s\\S\]\*?\\}/, /<fmt:\[\\s\\S\]\*?\\/>/, /\\{\\{\[\\s\\S\]\*?\\}\\}/\]
        }))
        .pipe(gulp.dest("temp/online-java-demo-starter"));
gulp.src(\['temp/online-java-demo-starter/\*\*/\*'\], {dot: true})
        .pipe(chmod(0o644, true))
        .pipe(zip('JavaTMP-Java-Ajax.war'))
        .pipe(gulp.dest('temp'));
```