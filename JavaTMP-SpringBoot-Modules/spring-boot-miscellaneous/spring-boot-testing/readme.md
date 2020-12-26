# Spring Boot Testing Miscellaneous Module

## A Guide to JUnit 5
* JUnit is one of the most popular unit-testing frameworks in the Java ecosystem.
* JUnit 5 Test can be found in class 
`com.javatmp.testing.JUnitTest`

## Testing in Spring Boot
* Databased Integration Testing With `@DataJpaTest`
* `@DataJpaTest` provides some standard setup needed for testing the persistence layer
* The Spring Boot `TestEntityManager` class is an alternative 
  to the standard JPA EntityManager that provides methods
  commonly used when writing tests.
* The `assertThat()` comes from the `Assertj` library, 
  which comes bundled with Spring Boot.
* To test the Service layer, we don't need to know or care about 
  how the persistence layer is implemented.
  we should be able to write and test our Service layer code 
  without wiring in our full persistence layer.
  To achieve this, we can use the mocking support provided 
  by Spring Boot Test.
* Spring Boot provides the `@TestConfiguration` annotation 
  that we can add on classes in `src/test/java` to indicate that 
  they should not be picked up by scanning.
* Test Web Controllers using `@WebMvcTest`. Since we're only focused on the Controller code, 
  it's natural to mock the Service layer code for our unit tests
* To test the Controllers, we can use @WebMvcTest. It will auto-configure the Spring MVC infrastructure 
  for our unit tests.
* `@WebMvcTest` will be limited to bootstrap a single controller. 
  We can also use it along with `@MockBean` to provide mock implementations 
  for any required dependencies.
* `@WebMvcTest` auto-configures MockMvc, which offers a powerful way of easy testing MVC controllers without 
  starting a full HTTP server.
* The `@SpringBootTest` annotation is useful when we need to bootstrap the entire container.
* the `@TestPropertySource` annotation helps configure the locations of properties files specific to our tests.
  Note that the property file loaded with `@TestPropertySource` will override the existing application.properties file.

  

  


## References
- [https://junit.org/junit5/](https://junit.org/junit5/)
- [https://www.baeldung.com/junit-5](https://www.baeldung.com/junit-5)
- [https://junit.org/junit5/docs/current/user-guide/](https://junit.org/junit5/docs/current/user-guide/)
