---
title: Java Build Automation Tool Apache Maven
---
# {{ page.title }}

Building and Managing Java and Java Spring Projects using the Java Build Tool - Apache Maven.

### Why Maven ?
- Support Multi developer environment because
it's independent of any IDE specific configurations.
- Manage your Version Control of Source Code.
- Provides lifecycle and dependencies management.
- Run, build, deploy your project or unit tests.
- Supported by a wide range of tools and software like IDE, CI - Continuous Integration.
- Describes 'How' the Java Project is Built.
- Describes 'Dependencies' the Java Project has.

### Objectives of Apache Maven
- A maven Java project is described by a 'POM' or Project Object Model and it's stored in
XML format.
- Low Configuration with POM inheritance & Aggregation. Which suggested build life cycle and
each life cycle is made up of phases.
- Maven is a Collection of plugins. which perform the action in Maven.
they are downloaded via internet (Downloaded only when needed and stored in a local
repository on your hard drive).
- Maven requires internet access. And Maven Central holds plugins and third party jar files.
- Maven encourages best practices and suggested default project structure
and default build life cycles.

### Development Environment Tools
- Apache Maven Tool. [http://maven.apache.org/download.cgi](http://maven.apache.org/download.cgi)
- Java JDK. [https://www.oracle.com/java/technologies/javase-downloads.html](https://www.oracle.com/java/technologies/javase-downloads.html)
- Eclipse JavaEE. [https://www.eclipse.org/downloads/](https://www.eclipse.org/downloads/)
- Apache Tomcat. [https://tomcat.apache.org/](https://tomcat.apache.org/)

### Installing Maven
- Download apache-maven-3.6.2-bin.zip from [http://maven.apache.org/download.cgi](http://maven.apache.org/download.cgi)
- Extract the downloaded file to c:
- Create new user environment variable 'M2_HOME' point to `'C:\apache-maven-3.6.2'`
- Create another variable 'M2' point to `'%M2_HOME%\bin'`
- Add %M2% variable to local user or system variable path.
- Check maven by open a new command line tool CMD and run `mvn --version`

### Installing Eclipse IDE
- Download and Install Eclipse IDE for Enterprise Java Developers.
- Run eclipse and go to help > About Eclipse IDE.
- Check m2 plugin or Maven Integration for Eclipse feature is installed
and its id is `org.eclipse.m2e.feature`.
- To activate a particular perspective when a program is launched, do the following:
Go to `Window > Preferences > Run/Debug > Perspectives` and check
Always open the associated perspective when launching.

### Installing Apache Tomcat
- Download and extract Apache Tomcat from [https://tomcat.apache.org/](https://tomcat.apache.org/) to `C:\apache-tomcat-9.0.14`
- Add `CATALINA_HOME` user variable pointing to `C:\apache-tomcat-9.0.14`
- Create a new file `setenv.bat` in `%CATALINA_HOME\bin` with the following line
or any values you would like:
```
set JAVA_OPTS=%JAVA_OPTS% -Dfile.encoding=UTF-8 -server -Xms1024m -Xmx1024m
```

- Add or Check for user environment variables `JRE_HOME` and `JAVA_HOME`.

### Setting up Apache tomcat with eclipse IDE
- Go to window > Preferences > server > Server Runtime Environment.
- Add previously installed Apache Tomcat above to Server Runtime Environments.
- Create a new local server for your current workspace.
- Check the setup by running added tomcat by starting and shuting down it.
- the following menu items would help you:
    - Window > Show View > *
    - Window > Perspective > *
    - Window > Preferences > *

### Setting up Maven with Eclipse IDE
- installed from [https://www.eclipse.org/m2e/](https://www.eclipse.org/m2e/)
- If it is not installed, Then go to
Help > Install New Software > `http://download.eclipse.org/technology/m2e/releases`
- Check its configurations by going to Window > Preferences > Maven
- Add previously installed Maven by going to Window > Preferences > Maven > Installations
- Check it as the default one.
- Check your local maven repository folder `.m2` in Window > Preferences > Maven > User Settings
- Create a user settings file `C:\Users\[local user name]\.m2\settings.xml`
with contents from [http://maven.apache.org/settings.html](http://maven.apache.org/settings.html) and then check it in user settings.
- In Project Explorer, Import a Maven Project that contains pom.xml file.
- Create a new Maven Project from File > New > Maven Project.
- Go to Any Maven Project dropdown Maven menu and see available submenu there.
- Go to Any Maven Project dropdown Run as menu and see available options.
- Go to Run As > Maven Build... > set goal `clean install`

### Maven Plugins
Maven is a plugin execution framework, all work is done by plugins.
This following page lists the core plugins and others.
There are the build and the reporting plugins: [http://maven.apache.org/plugins/index.html](http://maven.apache.org/plugins/index.html)

#### Apache Maven Clean Plugin
The Clean Plugin is used when you want to remove files generated at build-time in a project's directory.
Read more about clean plugin in the page [http://maven.apache.org/plugins/maven-clean-plugin/](http://maven.apache.org/plugins/maven-clean-plugin/)
- `clean:clean` attempts to clean a project's working directory of the files
that we're generated at build-time. By default, it discovers and deletes
the directories configured in `project.build.directory`, `project.build.outputDirectory`,
`project.build.testOutputDirectory`, and `project.reporting.outputDirectory`.

#### Apache Maven Compiler Plugin
- Read more about Apache Maven Compiler Plugin in page [http://maven.apache.org/plugins/maven-compiler-plugin/](http://maven.apache.org/plugins/maven-compiler-plugin/)
- `compiler:compile` is bound to the compile phase and is used to compile the main source files.

### Maven Archetype
Archetype is a Maven project templating toolkit. An archetype is defined as an original pattern
or model from which all other things of the same kind are made.
It is a system that provides a consistent means of generating Maven projects.
Archetype will help authors create Maven project templates for users,
and provides users with the means to generate parameterized versions of those project templates.
-To create a new project based on an Archetype, you need to call `mvn archetype:generate` goal,
like the following:
```
mvn archetype:generate ...
```

- Read more about Archetype in page [http://maven.apache.org/archetype/index.html](http://maven.apache.org/archetype/index.html)
- Read more about `maven-archetype-plugin` plugin in page [http://maven.apache.org/archetype/maven-archetype-plugin/index.html](http://maven.apache.org/archetype/maven-archetype-plugin/index.html)

### Creating Maven Project
- Read more about creating maven project in the page [https://maven.apache.org/guides/introduction/introduction-to-archetypes.html](https://maven.apache.org/guides/introduction/introduction-to-archetypes.html)
- Read more about Maven project creation in the page [http://maven.apache.org/archetype/maven-archetype-plugin/usage.html](http://maven.apache.org/archetype/maven-archetype-plugin/usage.html)
- To generate a sample Maven project.use the archetype ArtifactIds `maven-archetype-quickstart`
- Read about the generated folder structure for Maven Quickstart Archetype in the page
[https://maven.apache.org/archetypes/maven-archetype-quickstart/](https://maven.apache.org/archetypes/maven-archetype-quickstart/)
- To generate a new project from this archetype, type:
```
mvn archetype:generate -DarchetypeGroupId=org.apache.maven.archetypes -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4
```

- Maven Coordinate consists of Group Id + Artifact Id + Version.
- The above command will create the Maven project with its pom.xml file like the following:

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>javatmp</groupId>
  <artifactId>demo1</artifactId>
  <packaging>jar</packaging>
  <version>1.0-SNAPSHOT</version>
  <name>demo1</name>
  <url>http://www.javatmp.com</url>
  <dependencies>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>3.8.1</version>
      <scope>test</scope>
    </dependency>
  </dependencies>
</project>
```

- The default Maven project folders structure is:

```
└──demo1
    │   pom.xml
    └───src
        ├───main
        │   └───java
        │       └───com
        │           └───javatmp
        │               └───demo1
        │                       App.java
        └───test
            └───java
                └───com
                    └───javatmp
                        └───demo1
                                AppTest.java
```

- Run the following command to see available valid lifecycle phases or goals
in your Maven Project:
```
mvn
```

### Standard Maven Directory Layout
- Read more about standard Maven Directory layout in the page [https://maven.apache.org/guides/introduction/introduction-to-the-standard-directory-layout.html](https://maven.apache.org/guides/introduction/introduction-to-the-standard-directory-layout.html)
- Read more about Maven Project Structure in the page [https://examples.javacodegeeks.com/enterprise-java/maven/maven-project-structure-example/](https://examples.javacodegeeks.com/enterprise-java/maven/maven-project-structure-example/)
- A typical Maven project has a pom.xml file and a directory structure based on defined conventions:
```
maven-project
├───pom.xml
├───README.txt
├───NOTICE.txt
├───LICENSE.txt
├───src
    ├───main
        ├───java (all the application source files)
        ├───resources (the application resource files)
        ├───filters (all the application filters files)
        ├───config
        ├───scripts
        └───webapp
    ├───test
        ├───java (all the application test source files)
        ├───resources (all the application test resource files)
        └───filters (all the application test filters files)
    ├───it
    ├───site
    └───assembly
└───target
    ├───classes (Compiled source files are placed in this folder. This folder will also contain resources, such as XML and property files that are part of the source, placed in src/main/resources)
    ├───test-classes (Compiled test source files are available in this folder. In addition, it also contains test resources, which are files required for the purpose of testing, but not for running the project)
    ├───surefire-reports (Test reports are separately placed in this folder. Typically, both XML and HTML report formats are available. The latter can be opened in the browser, while the former can be integrated with a code coverage tool)
    ├───maven-archiver (hold information used by Maven during the build)
    ├───maven-status (hold information used by Maven during the build)
    └───[executable file like .jar] (The generated project artifact is also present in this folder)
```

- `src/main/java`
    - Classes and packages for the main (real) artifact should be put in this folder.
    - All the content inside of this directory will be put in the classpath of the generated artifact.
    - If the artifact is a jar file, all the classes and packages will be in the root folder of the generated jar,
    so it will be available by default on the runtime classpath.
    - If the artifact is a war, all the classes and packages will be put inside the WEB-INF/classes directory,
    so it will be available on the runtime classpath by default.
    - When the project is build or packaged all those classes and packages will be put in the target folder.
    - This directory will be put inside the java build path automatically.
- `src/main/resources`
    - Resources for the main (real) artifact should be put in this folder.
    - All the content inside of this directory will be put in the classpath of the generated artifact.
    - If the artifact is a jar file, all the resources will be in the root folder of the generated jar,
    so it will be available by default on the runtime classpath.
    - If the artifact is a war, all resources will be put inside the WEB-INF/classes directory,
    so it will be available on the runtime classpath by default.
    - When the project is build or packaged all those resources will be put in the target folder.
    - This directory will be put inside the java build path automatically.
- `src/main/filters`
    - Filters for the artifact should be put in this folder. Read more about Maven Filter in this page [https://maven.apache.org/shared/maven-filtering/](https://maven.apache.org/shared/maven-filtering/)
- `src/test/java`
    - Classes and packages for the application test source files should be put in this folder.
    - It will NOT be put in the classpath of the generated artifact.
    - When the project is build or packaged all those classes and packages will be put in the `target/test-classes` folder.
    - When you run your test you must be aware that maven surefire plugin will run the classes from the target directory.
    - This directory will be put inside the java build path automatically.
- `src/test/resources`
    - Resources for the test artifact should be put in this folder.
    - All the content inside of this directory will NOT be put in the classpath of the generated artifact.
    - When the project is build or packaged all those test resources will be put in the target folder.
    - When you run your test you must be awared that maven surefire plugin will use resources from the target directory.
    - This directory will be put inside the java build path automatically
- `src/test/filters`
    - Filters for the test artifact should be put in this folder. You can read more about Maven test filter in this page [https://maven.apache.org/shared/maven-filtering/](https://maven.apache.org/shared/maven-filtering/)
- `src/it`
    - Classes and packages for the integration test artifact should be put in this folder.
    - All the content inside of this directory will NOT be put in the classpath of the generated artifact.
    - When the project is build or packaged all those classes and packages will be put in the target folder.
    - When you run your integration test, the implicated plugin will run the classes from the target directory.
    - This directory will be put inside the java build path automatically.

### Importing a Java Maven Project into Eclipse
- To import the Maven Project demo1 created before above go to Eclipse IDE and import .. > Maven > Existing Maven Projects > Select Your Root Maven Directory contained pom.xml file
- From your imported Maven project select Maven > Update Project ...
- Run your Java main class from Run As > Java Application

### Creating a New Java Maven Project in Eclipse
- From Eclipse IDE Project Explorer select New > Project ...
- From New Project Dialog select Maven > Maven Project
- From New Maven Project select project name and location and press next
- From select an Archetype select archetype with artifact Id `maven-archetype-quickstart` and press next
- From Specifiy Archetype parameters fill group id, artifact Id, Version, package,
and properties available from archetype values and then press finish

### Importing a Java Maven Project into Eclipse IDE from GitHub
-
