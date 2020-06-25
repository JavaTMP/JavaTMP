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

## Copyright and License
JavaTMP is copyrighted by [JavaTMP](http://www.javatmp.com) and released under
[JavaTMP License](https://github.com/JavaTMP/JavaTMP/blob/master/LICENSE).

