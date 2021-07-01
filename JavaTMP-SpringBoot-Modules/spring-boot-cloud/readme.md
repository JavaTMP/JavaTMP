# Microservices with Spring Boot and Spring Cloud
- you’ll be able to build microservices that are scalable and robust using Spring Boot and Spring Cloud.
- you may be interested in taking a look at the C4 model conventions, [https://c4model.com](https://c4model.com)
- 
## Introduction to Microservices
- a microservice architecture is about splitting up monolithic applications into smaller components, which achieves two major goals:
    - Faster development, enabling continuous deployments
    - Easier to scale, manually or automatically

- The 8 fallacies of distributed computing:
    - The network is reliable
    - Latency is zero
    - Bandwidth is infinite
    - The network is secure
    - Topology doesn't change
    - There is one administrator
    - Transport cost is zero
    - The network is homogeneous

- The design patterns we will cover are as follows:
    - Service discovery. How can clients find microservices and their instances?
    - Edge server. Add a new component, an Edge Server, to the system landscape that all incoming requests will go through
    - Reactive microservices. Use non-blocking I/O to ensure that no threads are allocated while waiting for processing to finish
    - Central configuration. Make it possible to store configuration information for a group of microservices in one place  
    - Centralized log analysis. Add a new component that can manage centralized logging 
    - Distributed tracing. ensure that all related requests and messages are marked with a common correlation ID and that the correlation ID is part of all log events.
    - Circuit Breaker. Add a Circuit Breaker that prevents new outgoing requests from a caller if it detects a problem with the service it calls. 
    - Control loop. it is very difficult to manually detect and correct problems such as crashed or hung microservice instances. 
    - Centralized monitoring and alarms. a monitor service capable of collecting metrics about hardware resource
      usage for each microservice instance level.
- The 12-factor app [https://12factor.net](https://12factor.net) is a set of design principles for building software that can be deployed in the cloud.

## Introduction to Spring Boot
- Spring Boot, and the Spring Framework that Spring Boot is based on, is a great framework for developing microservices in Java.

## Creating a Set of Cooperating Microservices
- 

## References
- [Spring Microservices in Action, Second Edition](https://www.manning.com/books/spring-microservices-in-action-second-edition)
- [Hands-On Microservices with Spring Boot and Spring Cloud](https://subscription.packtpub.com/book/web_development/9781789613476)
