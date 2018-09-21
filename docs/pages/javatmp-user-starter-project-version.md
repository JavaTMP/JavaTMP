---
title: JavaTMP-User-Starter Project Version
---
# JavaTMP-User-Starter Project Version

`JavaTMP-User-Starter` project is an advanced dynamic Java Bootstrap LTR/RTL multi languages User Management Web application Template
derived from `JavaTMP-Java-Ajax` project with support for data persistent using Mysql Database Management System through
java Persistent API and hibernate JPA implementation.

`JavaTMP-User-Starter` porject is a dynamic Java Bootstrap LTR/RTL multi languages User Management Web Application Version
of our Java starter version `JavaTMP-Java-Ajax` customized to provide a user specific features built mainly using
`Java Servlet 4.0` and `JSP 2.3` and deployed on `Apache tomcat 9` and it is a Netbeans IDE 8.2 project, so you can directly
import and open it there.
The [Online Dynamic Java Bootstrap User Management Web Application](http://java.javatmp.com:8080/JavaTMP-User-Starter/ "Dynamic Java Bootstrap LTR/RTL multi languages User Management Web application Template")
provides a running version of this template war file on tomcat 9.

It depends mainly on the following external backend java opensource libraries to provide a dynamic web application features
with custom web MVC for serving JSP pages and handling Servlet requests:
*   Use Apache Commons [BeanUtils 1.9.3](https://commons.apache.org/proper/commons-beanutils/ "Apache Commons beanutils Java Library"), [Collections 3.2.2](http://commons.apache.org/proper/commons-collections/ "Apache Commons Collections Java Library"), [Logging 1.2](http://commons.apache.org/proper/commons-logging/ "Apache Commons Logging Java Library"), and [Lang 3.7](http://commons.apache.org/proper/commons-lang/ "Apache Commons Lang Java Library")
*   Use [Google Gson 2.8.2](https://github.com/google/gson "Google Gson JSON Java Library")
*   Use [Standard Taglib 1.2](http://central.maven.org/maven2/javax/servlet/jstl/1.2/ "Java Web Standard Taglib maven repository")
*   Use [hibernate-5.2.17](http://hibernate.org/orm/releases/5.2/ "Hibernate 5.2.17 Home & Download Page").
*   Use [mysql-connector-java-8.0.11.jar](https://dev.mysql.com/downloads/connector/j/8.0.html "Java Mysql Connector 8 for JDBC driver").
*   Use [simplecaptcha-1.2.1.jar](https://sourceforge.net/projects/simplecaptcha/ "Simplecaptcha Home & Download Page").

`JavaTMP-User-Starter` project is a specific dynamic users web application with a subset of dynamic plugins and pages
from `JavaTMP-Java-Ajax` to provide a simple users management demo. The following documentation page provide you with
more information for our General dynamic Java web application version :
[Dynamic Java Bootstrap Web Application Documentation Home Page](/pages/javatmp-java-ajax-project-version "Dynamic Java Bootstrap Web Application Documentation Home Page").

The following list provides the main features of Dynamic Java Bootstrap Users Management web application
Template version `JavaTMP-User-Starter` Project:
*   Public Registration Page for user.
*   Login Page for Register User Authentication.
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

## Installation and Deploying

The JavaTMP-User-Starter project folder structure is the same as JavaTMP-Java-Ajax one with the following main contents of its folder root:
```
./JavaTMP-User-Starter
|---.eslintrc (ESLint plugin configuration file which contains directive and parameters to gulp-eslint gulp plugin)
|---.gitignore (git SCM meta file to exclude mainly ./node_modules and ./nbproject/private/ folders from versioning)
|---build.xml (Netbeans IDE auto generated ant build script. used to compile, build, package project through Netbeans IDE or manually by command line)
|---gulpfile.js (gulp's configuration file for automating front end resources and generate assets/dist JS/CSS files)
|---package.json (A Node.js's NPM meta file. This file holds various metadata relevant to the project)
+---conf
    ...
    |---javatmp-27-08-2018.sql (Oracle Mysql Database dump script to start the Users Web Application from)
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

`mysql > grant all on appdb.* to ‘javatmpUser’@’localhost’ identified by ‘javatmpUserPassword’;`

Note: The localhost field usually doesn’t have to be edited, but you can set it to the specific address.

The above example grants all privileges, obviously. But you will likely want to limit privileges under many circumstances.
These parameters include select, insert, and delete, For example:

`mysql > grant select, insert, delete, update on appdb.* to ‘javatmpUser’@’localhost’ identified by ‘javatmpUserPassword’;`

always be sure to reload all the privileges and changes through the command:

`mysql > FLUSH PRIVILEGES;`

quit to import our database script to your local database instance appdb from `console command line`:

`mysql -ujavatmpUser -pjavatmpUserPassword -D appdb < ./JavaTMP-User-Starter/conf/javatmp-27-08-2018.sql`

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

Please refer to tables description and corresponding Java bean classes in `com.javatmp.domain` package for more information about their fields and values.
