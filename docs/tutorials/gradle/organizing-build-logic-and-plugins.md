---
title: Organizing Build Logic and Plugins
---
# {{ page.title }}

- Developers just include the plugin, configure the required tasks, and leverage the functionalities.

## Extracting build logic to buildSrc
- Plugins are nothing but the group of tasks with specific orders and default configurations, which are created to provide a certain functionality.
- The following is the sample code of a plugin, which a developer can write in build.gradle and use it:

```
apply plugin: CustomPlugin
class CustomPlugin implements Plugin<Project> {
  void apply(Project project) {
    project.task('task1') << {
      println "Sample task1 in custom plugin"
    }
    project.task('task2') << {
      println "Sample task2 in custom plugin"
    }
  }
}
task2.dependsOn task1
```

- All the tasks that you want to implement, you need to define inside the apply method.
- To use a plugin in the build file, you always need to use `apply plugin:<plugin name/plugin class>`
(if a plugin is implemented in the same script or in the buildSrc directory).
- to write plugin code separate from the build logic, Gradle provides two different ways as follows:
    - Extract plugin code to buildSrc
    - Independent plugin
- To extract plugin code to buildSrc, Gradle recommends you to create a buildSrc directory
inside the project directory and keep the plugin code there.
- You just need to import the package and add the apply plugin statement.
- If you want to add some more features for task1, you can do it as follows:

```
task1.doLast {
    println "Added more functionality to task1"
}
task2.dependsOn task1
```

- You can use this plugin only with the same project or the sub-projects defined in the root project.
- You can plug out the plugin code into a standalone plugin and package it into a JAR file,
which you can publish to a repository so that it can be reused by any projects.

## Gradle Plugin
- To make the plugin reusable for all the other projects, Gradle allows you to separate the plugin code and package it in a JAR file.
- You can include this JAR file in any projects in which you want to reuse this functionality.
- You can create the standalone project in Java or Groovy.
- In the build.gradle plugin file, you will package the plugin code into a jar file.
- to include the plugin into other build files. You need a plugin ID for this plugin. To add a plugin ID to your plugin,
you need to create a property file `customplugin.properties` inside the `src/main/resources/META-INF/gradle-plugins` directory.
- To refer to the custom plugin JAR using the flatDir configuration. Use the following in your build.gradle file:

```
buildscript {
    repositories {
        flatDir {dirs "../CustomPlugin/build/libs/"}
    }
    dependencies {
        classpath group: 'ch8', name: 'CustomPlugin',version: '1.0'
    }
}
apply plugin: 'customplugin'
```

- Use the organization's local repository; thus, it can be centrally accessed by any of the organization's projects.
