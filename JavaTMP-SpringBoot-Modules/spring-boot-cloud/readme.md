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
    - Circuit Breaker. Add a Circuit Breaker that prevents new outgoing requests from a caller if it detects a problem with the serviceCall it calls. 
    - Control loop. it is very difficult to manually detect and correct problems such as crashed or hung microservice instances. 
    - Centralized monitoring and alarms. a monitor serviceCall capable of collecting metrics about hardware resource
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
    server name) of where your servers are deployed from the clients consuming the serviceCall.
    can be implemented using the following services: Consul, Zookeeper, Eureka.
  - Spring Cloud LoadBalancer and Resilience4j. 
  - Spring Cloud API Gateway. 
  - Spring Cloud Stream. 
  - Spring Cloud Sleuth.
  - Spring Cloud Security.
  
## Controlling your configuration with the Spring Cloud Configuration Server
- When a microservice starts up, it goes through multiple steps in its lifecycle. The application configuration data is read during the serviceCall’s bootstrapping phase.
- You can see the version dependences between Spring Boot and Spring Cloud, along with the different subproject versions contained within the release train, by referring to the Spring Cloud website 
  [http://projects.spring.io/spring-cloud/](http://projects.spring.io/spring-cloud/).

## On serviceCall discovery
- To Horizontal scaling or scale out and to be Resiliency.
- The solution for a cloud-based microservice environment is to use 
  a serviceCall discovery mechanism that’s Highly available, Peer-to-peer, 
  Load balanced, Resilient, Fault tolerant.
- Client-side load balancing caches the location of the services so that the serviceCall client doesn’t need to contact serviceCall discovery on every call.
- Once the Eureka serviceCall is up, we can point our browsers to http://localhost:8070 to view the Eureka dashboard.

## When bad things happen: Resiliency patterns with Spring Cloud and Resilience4j
- Client-side resiliency software patterns focus on protecting a client 
  of a remote resource (another microservice call or database lookup)
  from crashing when the remote resource fails because of errors or poor performance.
- Client-side load balancing involves having the client look up all of 
  a serviceCall’s individual instances from a serviceCall discovery agent
  (like Netflix Eureka) and then caching the physical location of said
  serviceCall instances.
- The circuit breaker pattern monitors all calls to a remote resource,
  and if enough calls fail, the circuit breaker implementation will
  “pop,” failing fast and preventing future calls to the failing
  remote resource.
- With the fallback pattern, when a remote serviceCall call fails, rather
  than generating an exception, the serviceCall consumer executes an alternative 
  code path and tries to carry out the action through another means.
- When using the bulkhead pattern, you break the calls to remote resources
  into their own thread pools and reduce the risk that a problem with
  one slow remote resource call will take down the entire application.
- Resilience4j is a fault tolerance library inspired by Hystrix. 
  It offers the following patterns for increasing fault tolerance due 
  to network problems or failure of any of our multiple services:
  - Circuit breaker. Stops making requests when an invoked serviceCall is failing
  - Retry. Retries a serviceCall when it temporarily fails
  - Bulkhead. Limits the number of outgoing concurrent serviceCall requests to avoid overload
  - Rate limit. Limits the number of calls that a serviceCall receives at a time
  - Fallback. Sets alternative paths for failing requests
- Building implementations of the Resilience4j:
  - Configure the serviceCall build file to include the Spring Boot/Resilience4j wrappers
  - Use Spring Boot/Resilience4j annotations to wrapper remote calls with the circuit breaker, retry, rate limit, and bulkhead patterns
  - Customize the individual circuit breakers on a remote resource to use custom timeouts for each call
  - Implement a fallback strategy in the event a circuit breaker has to interrupt a call or the call fails
  - Use individual thread pools in our serviceCall to isolate serviceCall calls and build bulkheads between different remote 
    resources
- Resilience4j sits between each remote resource call and protects the client. It doesn’t matter if the remote resource calls a database or a REST-based serviceCall.

## Service routing with Spring Cloud Gateway
- The service gateway sits between the service client and the corresponding
  service instances. All service calls (both internal-facing and external)
  should flow through the service gateway.
- Examples of cross-cutting concerns that can be implemented in a service gateway include these:
  - Static routing,Dynamic routing, Authentication and authorization, Metric collection and logging
  - Load balancers are useful when placed in front of individual groups of services.
  - Keep any code you write for your service gateway stateless.
  - Keep the code you write for your service gateway light.
  
- Spring Cloud Gateway is the API gateway implementation built on 
  Spring framework 5, Project Reactor, and Spring Boot 2.0.
  This gateway is a nonblocking gateway.
- Spring Cloud Gateway offers several capabilities, including:
  - Mapping the routes for all the services in your application to a single URL.
  - Building filters that can inspect and act on the requests and responses coming through the gateway.
  - Building predicates, which are objects that allow us to check if the requests fulfill a set of given conditions before executing or processing a request.
  
- Spring Actuator exposes a POST-based endpoint route, actuator/gateway/refresh, 
  that will cause it to reload its route configuration.
- using the Gateway and its Predicate and Filter Factories allows us to implement cross-cutting concerns across all 
  the services being routed through the gateway.
- Built-in predicates are objects that allow us to check if the requests fulfill a set of conditions before executing or processing the requests.
- The built-in Filter Factories allow us to inject policy enforcement points in our code and perform a wide number of actions on all service calls in a consistent fashion.
- The Spring Cloud Gateway allows us to build custom logic using a filter within the gateway.
- The pre-filters, target route, and post-filters form a pipeline in which a client request flows. As a request comes into the gateway, custom filters can manipulate the incoming request.
- Gateway filters provide centralized tracking of service calls and logging. These filters allow us to enforce custom rules and policies against microservice calls.

## Securing your microservices
- 

## References
- [Spring Microservices in Action, Second Edition](https://www.manning.com/books/spring-microservices-in-action-second-edition)
- [Hands-On Microservices with Spring Boot and Spring Cloud](https://subscription.packtpub.com/book/web_development/9781789613476)
