---
title: Java Servlet Web Application Notes
---
# {{ page.title }}


#### `javax.servlet.ServletContextListener` interface

The class implements `javax.servlet.ServletContextListener` interface
and annotated by `@javax.servlet.annotation.WebListener` annotation provides a startup and shutdown procedures.
when we deploy or undeploy web application
the the `ServletContextListener.contextInitialized` and `ServletContextListener.contextDestroyed` methods called.

It considers as a `main` method in the web application environment used normally for initializing global resources
like Database connection pool or Datasource lookup.
You could do any important things at startup nor shutdown of the web applicationunless or
setting a UTC timezone and create needed instance.

#### `javax.servlet.http.HttpSessionListener` interface

The class implements `javax.servlet.http.HttpSessionListener` interface
and annotated by `@javax.servlet.annotation.WebListener` annotation triggers when a session is created and destroyed
on the application server. So Whenever a new session has been created a `HttpSessionListener.sessionCreated` method will be
invoked and whenever a session has been invalidated a `HttpSessionListener.sessionDestroyed` method will be invoked
by the application server.

There is no distinct difference between session timeout and session invalidation from the perspective of the session object.
Whenever it happens the `HttpSessionListener.sessionDestroyed` method will be invoked by the application server.

#### Java Web Application Filter

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

#### Java Servlet Classes

Java Servlet Classes handling requests and responses.
The servlets classes marshal/unmarshal data or request dispatcher mechanism
to forward request to specific JSP page.

##### `IndexController` class

The root path main Java Servlet class responsible for handling default root request.
It uses an empty `url-pattern` string annotation instead of providing a welcome page with specific url pattern name.
The complete source code of `IndexController` class is:

```java
@WebServlet("")
public class IndexController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
    }
}
```

##### `PagesController` class

This class consider as a front controller servlet responsible for forwarding url requests for JSP pages inside
`WEB-INFO/pages/*` folder that does not have specific servlet for handling its url.
The following code provides its source code:

```java
@WebServlet("/pages/*")
public class PagesController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String requestPath = request.getPathInfo();
        String requestPage = null;
        if (!requestPath.endsWith(".html")) {
            requestPage = "/WEB-INF/pages" + requestPath + ".jsp";
        } else {
            requestPage = "/WEB-INF/pages" + requestPath;
        }
        logger.info("Request Page [" + requestPage + "]");
        request.getRequestDispatcher(requestPage).forward(request, response);
    }
}
```

*   Sometimes, We create a separate servlet for handling page request that need data to be populated before dispatching
to specific page. So we use `request.getRequestDispatcher("/WEB-INF/pages/...").forward(request, response);`.
*   Sometimes, The servlet is responsible for handling AJAX request and providing a JSON response only.
*   Sometimes, The Servlet need data in request parameters, so we read them.
*   Sometimes, The AJAX request has JSON data in the POST request body that should be read to provide another
JSON response as a result.