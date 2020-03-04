---
title: Testing and Reporting with Gradle
---
# {{ page.title }}

- Four different topics: testing with TestNG, integration testing, code coverage with JaCoCo, and code analysis with Sonar.
- TestNG is another widely used testing tool, like JUnit.
- Code coverage and code quality are the other two important aspects in test-driven development (TDD).
- Developers need continuous feedback on the code developed by them. Code quality tools help us to achieve this goal.
- these tools are integrated with the Continuous Integration (CI) systems so that these reports are created on a daily basis or after each commit,
shared among different teams, and even be persisted for future analysis.

## Testing with TestNG
- The very first step is to create the build file with TestNG dependencies and configure the test closure.
- The following build file adds the TestNG library as the testCompile dependency and in the test closure,
we added a testng.xml file to execute the test cases,
you can read more about TestNG configuration at http://testng.org/doc/documentation-main.html:

```
apply plugin:'java'
repositories {
  mavenCentral()
}
dependencies {
  testCompile 'org.testng:testng:6.8.21'
}
test {
  ignoreFailures = true
  useTestNG(){
    suites("src/test/resources/testng.xml")
  }
}
```

```xml
<!DOCTYPE suite SYSTEM "http://testng.org/testng-1.0.dtd" >
<suite name="Suite1" verbose="1" >
  <listeners>
    <listener class-name="org.testng.reporters.EmailableReporter" />
  </listeners>
  <test name="Smoke Test">
  <groups>
    <run>
      <exclude name="Integration"  />
      <include name="Smoke"  />
    </run>
  </groups>
  <classes>
    <class name="com.packtpub.ge.ch7.HashTest">
    </class>
  </classes>
  </test>
</suite>
```

## Integration testing
- It verifies the communication between different components working together as expected or not.
- To enable integration testing along with unit testing in Gradle, you need to customize the Gradle to enable both.
- Create a separate directory structure, `src/integrationTest/java`, for integration test cases,
and you can configure the same in your Gradle build scripts. The updated build script would be as follows:

```
apply plugin: 'java'
sourceSets {
   integrationTest {
       java.srcDir file('src/integrationTest/java')
       resources.srcDir file('src/integrationTest/resources') // to add the resources
   }
}
task runIntegrationTest(type: Test) {
   testClassesDir = sourceSets.integrationTest.output.classesDir
   classpath = sourceSets.integrationTest.runtimeClasspath
}
```

- Once we have added additional sourceSets to the build script,
the java plugin automatically adds two new dependency configurations to your build script
`integrationTestCompile` and `integrationTestRuntime`.
- `integrationTestCompile` can be used to configure dependencies required to compile the test cases and
`integrationTestRuntime` can be used to configure dependencies required to execute the test cases.
- Execute the following command to check for the current dependencies: `gradle dependencies`
- You can configure them under dependencies closure:

```
dependencies {
    // other configuration dependencies
    integrationTestCompile 'org.hibernate:hibernate:3.2.3.ga'
}
```

- to execute the integration test : `gradle runIntegrationTest`.
- If you want to execute these test cases each time you build your code,
you can link this task with other tasks using dependsOn
or any other dependency attributes.

## Code coverage
- High code coverage does not guarantee that the quality code has been written.
- A developer must use static code analysis tools such as PMD (https://pmd.github.io/) to find the quality of the code.
- The `build.gradle` file has the following content:

```
apply plugin: 'java'
apply plugin: 'jacoco'
repositories {
  mavenCentral()
}
dependencies {
  testCompile 'org.testng:testng:6.8.8'
}
test{
    systemProperty "url",System.properties['url']
    useTestNG()
}
jacocoTestReport.dependsOn test
```

- the report will be created in the `{build dir}/reports/jacoco/test/html` directory and an HTML report file will be generated.
- To execute the `jacocoTestReport` task to generate the code coverage report: `gradle clean jacocoTestReport`.
- In the coverage report, you can observe that all the methods of the Java class were tested unit tests.
- The default version of the jacoco plugin can be modified by modifying the jacoco extension as follows:

```
jacoco {
    toolVersion = "<Required-Version>"
    reportsDir = file("Path_to_Jacoco_ReportDir")
}
```

- The report can be customized by configuring the jacocoTestReport task as follows:

```
jacocoTestReport {
    reports {
        xml.enabled false
        html.destination "<Path_to_dircectory>"
    }
}
```

## Code analysis reports
- Sonar is one of the most popular quality management tools that gives
a complete analysis of a project in terms of lines of code, documentation,
test coverage, issues, and complexities.
- To integrate Gradle with Sonar. The only prerequisite is, the Sonar server should be installed and running.
- To run sonar-runner plugin, we just need to apply the plugin sonar-runner and configure it to connect to the Sonar server.
- Create the build file build.gradle for your project with the following contents:

```
apply plugin: 'java'
apply plugin: "sonar-runner"

repositories {
    mavenCentral()
}

version = '1.0'
repositories {
    mavenCentral()
}

sonarRunner {
  sonarProperties {
    property "sonar.host.url", "http://<IP_ADDRESS>:<PORT>"
    property "sonar.jdbc.url",
    "jdbc:h2:tcp://<IP_ADDRESS>:<PORT>/sonar"
    property "sonar.jdbc.driverClassName", "org.h2.Driver"
    property "sonar.jdbc.username", "sonar"
    property "sonar.jdbc.password", "sonar"
  }
}
```

- To run the `sonarRunner` task for code analysis. After successful execution of this task,
you will find the report hosted on the Sonar server: `gradle clean sonarRunner`
- You can find more on Sonar at http://docs.sonarqube.org/display/SONAR/Documentation/.