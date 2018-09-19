---
title: Java Bootstrap Backend Features And Resources
---
# Java Bootstrap Backend Features And Resources
`JavaTMP-Java-Ajax` project is a dynamic version of JavaTMP Bootstrap admin and dashboard template which consists of the following backend features and resouces:

1.  Create a Java Web Application Project from NetBeans IDE 8.2 new web application project.

2.  Copy all static files and resources from JavaTMP-Static-Ajax-Starter/-RTL projects.

3.  Convert all .html pages and Ajax snippets to .jsp equivalent and move them to /WEB-INF to be restricted access through servlets only.
4.  add `<%@page contentType="text/html" pageEncoding="UTF-8"%>` to the top of all JSP pages.
5.  Create a custom Java Web MVC using Java Servlet/JSP and below libraries.
6.  Use Apache Commons BeanUtils 1.9.3 for auto injection of request parameters into specific bean instance.
    [https://commons.apache.org/proper/commons-beanutils/](https://commons.apache.org/proper/commons-beanutils/)
    [http://www-us.apache.org/dist//commons/beanutils/binaries/commons-beanutils-1.9.3-bin.zip](http://www-us.apache.org/dist//commons/beanutils/binaries/commons-beanutils-1.9.3-bin.zip)

7.  Use Apache Commons Collections 3.2.2 as a dependency for above Apache Commons BeanUtils
    [http://commons.apache.org/proper/commons-collections/](http://commons.apache.org/proper/commons-collections/)
    [http://www-us.apache.org/dist//commons/collections/binaries/commons-collections-3.2.2-bin.zip](http://www-us.apache.org/dist//commons/collections/binaries/commons-collections-3.2.2-bin.zip)

8.  Use Apache Commons Logging 1.2 as a dependency for above Apache Commons BeanUtils
    [http://commons.apache.org/proper/commons-logging/](http://commons.apache.org/proper/commons-logging/)
    [http://www-us.apache.org/dist//commons/logging/binaries/commons-logging-1.2-bin.zip](http://www-us.apache.org/dist//commons/logging/binaries/commons-logging-1.2-bin.zip)

9.  Use Apache Commons Lang 3.7 for auto converting of bean instance to string for printing.
    [http://commons.apache.org/proper/commons-lang/](http://commons.apache.org/proper/commons-lang/)
    [http://www-eu.apache.org/dist//commons/lang/binaries/commons-lang3-3.7-bin.zip](http://www-eu.apache.org/dist//commons/lang/binaries/commons-lang3-3.7-bin.zip)

10.  Use Google Gson 2.8.2 for marshaling and unmarshaling of AJAX request and response beans.
    [https://github.com/google/gson](https://github.com/google/gson)
    [https://repo1.maven.org/maven2/com/google/code/gson/gson/2.8.2/](https://repo1.maven.org/maven2/com/google/code/gson/gson/2.8.2/)

11.  Use Standard Taglib 1.2 in JSP pages for formatting and looping.
    [http://central.maven.org/maven2/javax/servlet/jstl/1.2/](http://central.maven.org/maven2/javax/servlet/jstl/1.2/)
    [https://tomcat.apache.org/taglibs/standard/](https://tomcat.apache.org/taglibs/standard/)
