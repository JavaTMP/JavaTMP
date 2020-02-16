---
title: Gradle Essentials
---
# {{ page.title }}

Building a software artifact is a complex process involving various activities such as compiling source code,
running automated tests, packaging distributable files, and so on.
These activities are further split into many steps, often dependent on the execution order, fetching dependent artifacts,
resolving configuration variables, and so on.
Executing all these activities manually is cumbersome and often error-prone.
A good build automation tool helps us reduce the effort and time it takes to build correct artifacts in a repeatable manner.

## Introduction

### Gradle is
- an advanced build automation tool that brings the best from various proven build tools and innovates on top of them.
- can be used to produce different kind of artifacts such as web applications, static sites, and desktop applications.
- Works by conventions over configuration.
- can be configured using very human-friendly Groovy DSL.

### Installing Gradle
- Gradle needs Java Runtime Environment (JRE) 6 or Java Development Kit (JDK) 1.6 or higher.
- Download page is https://gradle.org/install/
- Gradle User Manual is https://docs.gradle.org/current/userguide/userguide.html
- Export or add Environment Variables to your OS to run gradle from any command line shell.
- Verifying the installation by `gradle --version` or `gradle -v`
- In case we need to set some global options for the JVM that Gradle will use,
we can set the `GRADLE_OPTS` environment variable with acceptable flags to tune the JVM.
- Gradle also honors the `JAVA_OPTS` environment variable. but his affects the setting for all the Java programs on a machine.

### The Gradle command-line interface
- `gradle` command is issued from the root of a project directory with some tasks to be executed. like `gradle help`
- Gradle tasks may vary depending on the project in which the gradle command is being run.
- Gradle tasks are currently available on project by `gradle tasks` command.

### Gradle build script
- Gradle treats the current directory as a project root and tries to find the build.gradle file there.
- Create and open the `build.gradle` file and declare a task by adding the following line `task helloWorld`
- Task helloWorld and run it using command `gradle -q helloFirstTask`:
```
task helloWorld {
  println "Hello, World!"
  println ("Hello, World!")
  println ("Hello, World!");
  System.out.println("Hello, World!")
  System.out.println("Hello, World!");
  System.out.println "Hello, World!";
  System.out.println "Hello, World!"
}
```

- While calling a gradle task from a command line, we can save a few keystrokes by typing only
the characters that are enough to uniquely identify the task name. For example,
the task helloWorld can be called using gradle hW. We can also use helloW, hWorld, or even heWo
- Gradle Daemon is a process that keeps running in the background to speed up the builds significantly.

### Gradle Wrapper
- A Gradle Wrapper consists of a `gradlew` shell script for Linux/Mac OS X,
a `gradlew.bat` batch script for Windows, and a few helper files.
- These files can be generated by running a `gradle wrapper` task
and should be checked into the version control system (VCS) along with project sources.
Instead of using the system-wide gradle command, we can run the builds via the wrapper script.
- the advantages of running builds via a wrapper script are
    - We don’t need to download and install Gradle manually. The wrapper script takes care of this.
    - It uses a specific version of Gradle that the project needs.
- To generate the wrapper scripts and supporting files, just execute the following code from the command line:
`gradle wrapper` or `gradle wrapper --gradle-version 5.0`
- To running a build via wrapper use it like any other command `gradlew helloWorld`
and we can use the arguments and flags exactly in the same way as we pass to the gradle command.

## Building Java Projects
- In the root of the project directory create the `build.gradle` file and add the following code line to it:

```java
apply plugin: 'java'
```

- Adding source files in the same structure for any standard maven project in `src/main/java` directory.
- To compile the project and produce the class files call the following task from a command line: `gradle compileJava`
and the compiled classes go into `build/classes/main` relative to the project root.
- To generate the `.jar` file for our application run the following task: `gradle build`
and the jar will be in the `build/libs` directory.
- Note that when we run the `build` task, Gradle also invokes the `compileJava` and other dependent tasks
before actually executing the build task. So, we don't need to explicitly call `compileJava` here to compile classes.
- The name of the .jar file is the same as that of the project.
This can be configured by setting the `archivesBaseName` property in the build.gradle file. as

```java
archivesBaseName = "my-app"
```

- To see what all tasks were brought into our build by the java plugin run `gradle –q tasks` command.
- Gradle by itself is nothing more than a task runner. It does not know how to compile a Java file
or where to read the source files. It means that these tasks are not there by default.
and a Gradle build file, without any plugin applied, contained very few tasks.
- A plugin adds relevant tasks and conventions to a Gradle build.
all the tasks such as compileJava, build, clean, and many more are essentially brought in by the java plugin
that we applied to our build.
- There are number of plugins that come out of the box with Gradle. The `java` plugin is one such plugin.

### Unit testing
- Java test sources are kept in the `src/test/java` directory relative to the project root.
- To compile tests use the `compileTestJava` task, which is exactly the same as `compileJava`, but compiles the test source files.

#### Adding the JUnit to the classpath
- we need JUnit library on the classpath. And this dependency is only required
while compiling and running the tests.
- In the dependencies section, we list down all the dependencies of the project along with their scope.
We declared JUnit to be made available in the testCompile scope.
- In the repositories section, we configure the type and location of the repository where external dependencies will be found.
- We need to update the build.gradle file as follows:

```java
apply plugin: 'java'

repositories {
    mavenCentral()
}

dependencies {
    testCompile 'junit:junit:4.12'
}
```

- Running the test by command `gradle test`
- Whether the test passes or not, a nice HTML report is created with details of all the tests that are run.
By default, this report is located at build/reports/tests/index.html relative to the project root.
- We just need to call the last task in the flow, and all the tasks that the called tasks depend on will be called sequentially
and the build will not succeed if any of the tasks fails.
- If we need to force run task actions even if nothing has changed between the two runs,
we can pass the `--rerun-tasks` flag on the command line so that all task actions can run.

### Bundling an application distributable
- applies the `application` plugin to our build by `apply plugin: 'application'`
- Add `mainClassName` and `run.args` attributes.
- The `application` plugin adds the `run` task to our build.
- as we are applying the application plugin, it is not necessary to explicitly apply the java plugin
as an application plugin implicitly applies the java plugin to our build.
- It also implicitly applies the distribution plugin so that we get the tasks to package the application
as a ZIP or TAR archive and also gets the task to install the application distribution locally.
- More information on the application plugin can be found at https://docs.gradle.org/current/userguide/distribution_plugin.html.
- Running the application with Gradle by `gradle run` or `gradle -q run`.
- The –P adds properties to the Gradle Project. like `gradle -q run -PrunArgs=world` and access it by `project.runArgs`.
- We could create a gradle.properties in project’s root parallel to the build.gradle file.
- There are ways to declare properties which can be found at https://docs.gradle.org/current/userguide/build_environment.html.

### Building the distribution archive
