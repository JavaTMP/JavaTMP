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
