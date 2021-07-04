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

## Exploring the microservices world with Spring Cloud
- Spring Cloud offers a set of features that will allow us to quickly build
  microservice architectures with minimal configurations. like:
  - Spring Cloud Config. Spring Cloud Config has its own property management repository but also integrates with 
    open source projects like git, Consul, Eureka.
  - Spring Cloud Service Discovery. Spring Cloud Service Discovery abstract away the physical location (IP and/or 
    server name) of where your servers are deployed from the clients consuming the service.
    can be implemented using the following services: Consul, Zookeeper, Eureka.
  - Spring Cloud LoadBalancer and Resilience4j. 
  - Spring Cloud API Gateway. 
  - Spring Cloud Stream. 
  - Spring Cloud Sleuth.
  - Spring Cloud Security.
  
## Controlling your configuration with the Spring Cloud Configuration Server
- When a microservice starts up, it goes through multiple steps in its lifecycle. The application configuration data is read during the service’s bootstrapping phase.
- You can see the version dependences between Spring Boot and Spring Cloud, along with the different subproject versions contained within the release train, by referring to the Spring Cloud website 
  [http://projects.spring.io/spring-cloud/](http://projects.spring.io/spring-cloud/).

## On service discovery
- To Horizontal scaling or scale out and to be Resiliency.
- The solution for a cloud-based microservice environment is to use 
  a service discovery mechanism that’s Highly available, Peer-to-peer, 
  Load balanced, Resilient, Fault tolerant.
- Client-side load balancing caches the location of the services so that the service client doesn’t need to contact service discovery on every call.
- Once the Eureka service is up, we can point our browsers to http://localhost:8070 to view the Eureka dashboard.

## When bad things happen: Resiliency patterns with Spring Cloud and Resilience4j

## References
- [Spring Microservices in Action, Second Edition](https://www.manning.com/books/spring-microservices-in-action-second-edition)
- [Hands-On Microservices with Spring Boot and Spring Cloud](https://subscription.packtpub.com/book/web_development/9781789613476)
