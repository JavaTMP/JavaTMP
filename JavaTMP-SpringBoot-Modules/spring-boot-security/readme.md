# Spring Boot Security Modules

## Security Introduction

Nonfunctional software qualities such as performance, scalability, availability, and, of course, security, 
as well as others, can have an impact over time, from short to long term. 

A user mainly thinks about functional requirements. Sometimes, you might see them aware of performance, 
which is nonfunctional, but unfortunately, it’s quite unusual that a user cares about security. 
Nonfunctional requirements tend to be more transparent than functional ones.

### Spring Security
- Spring Security project link is 
[https://spring.io/projects/spring-security](https://spring.io/projects/spring-security).
- Spring Security described as a powerful and highly customizable framework for authentication and access control.
- Spring Security offers you a highly customizable way of implementing authentication, authorization, 
  and protection against common attacks.

### Why is security important?
- the company could be liable and could lose a significant amount of money.
- Customers will probably choose to change the service provider, and the image of the company developing 
  the application would be dramatically affected.

### Common security vulnerabilities in web applications
- An excellent start to understanding vulnerabilities is being aware of the Open Web Application Security Project, 
  also known as OWASP (https://www.owasp.org).
- At OWASP, you’ll find descriptions of the most common vulnerabilities that you should avoid in your applications.
- Among the common vulnerabilities that you should be aware of, you’ll find these items are related 
  to application-level security, and most of these are also directly related to using Spring Security:
  Broken authentication, Session fixation, Cross-site scripting (XSS), Cross-site request forgery (CSRF), Injections, 
  Sensitive data exposure, Lack of method access control, Using dependencies with known vulnerabilities.

#### Vulnerabilities in authentication and authorization
- `Authentication` represents the process in which an application identifies someone trying to use it.
- `Authorization` is the process of establishing if an authenticated caller has the privileges 
  to use specific functionality and data.
- A broken authorization happens if an individual with bad intentions somehow gains access to functionality 
  or data that doesn’t belong to them. 

#### Session fixation
- Session fixation vulnerability is a more specific, high-severity weakness of a web application. 
  If present, it permits an attacker to impersonate a valid user by reusing a previously generated session ID. 

#### Cross-site scripting (XSS)
- Cross-site scripting, also referred to as XSS, allows the injection of client-side scripts 
  into web services exposed by the server, thereby permitting other users to run these. 

#### Cross-site request forgery (CSRF)
- Cross-site request forgery (CSRF) vulnerabilities are also common in web applications. 
  CSRF attacks assume that a URL that calls an action on a specific server can be extracted and reused 
  from outside the application.
- One of the ways of mitigating this vulnerability is to use tokens to identify the request or 
  use cross-origin resource sharing (CORS) limitations.

#### Understanding injection vulnerabilities in web applications
- In an injection attack, the attacker employing a vulnerability introduces specific data into the system.
- Injection attacks inject a client-side script with the means of harming the system somehow. 
  Other examples could be SQL injection, XPath injection, OS command injection, LDAP injection, 
  and the list continues.

#### Dealing with the exposure of sensitive data
- Define the credentials directly in the configuration files for simplicity reasons. 
- The information in logs written by your application to the console or stored in databases such as Splunk or 
  Elasticsearch. 
- The application returns too many details that expose the implementations.

#### The lack of method access control
- You don’t apply authorization to only one of the tiers.
- Some future implementation could expose that use case without testing or without testing all the authorization 
  requirements. 

#### Using dependencies with known vulnerabilities
- the dependencies like libraries or frameworks that you use to build 
  the functionality has vulnerabilities.
- We have to take all the needed measures to avoid the use of any dependency 
  that has known vulnerabilities.  

### Security applied in various architectures
- It’s important to understand that different software architectures imply different possible leaks and vulnerabilities.

#### Designing a one-piece web application
- Spring Security helps you with a relatively easy way of configuring user management. 

#### Designing security for a backend/frontend separation
- Scalability refers to the quality of a software application 
  in which it can serve more or fewer requests while adapting 
  the resources used, without the need to change the application or 
  its architecture. 
  Mainly, we classify scalability into two types: vertical and horizontal.
- When a system is scaled vertically, when there are more requests, more memory and processing power are added to the system
- We accomplish horizontal scalability by changing the number of instances of the same application that are in execution

#### Understanding the OAuth 2 flow
- The OAuth 2 flow offers a better way to implement authentication and authorization
- The OAuth 2 framework defines two separate entities: the authorization server and the resource server.
- The purpose of the authorization server is to authorize the user and 
  provide them with a token that specifies, a set of privileges that 
  they can use.
- The part of the backend implementing this functionality is called the resource server.
- The endpoints that can be called are considered protected resources. 
  Based on the obtained token, and after accomplishing authorization, 
  a call on a resource is permitted or rejected.

#### Using API keys, cryptographic signatures, and IP validation to secure requests
- In some cases, you don’t need a username and a password to authenticate and authorize a caller, 
  but you still want to make sure that nobody altered the exchanged messages.

## Spring Security Project
- first application uses HTTP Basic to authenticate and authorize 
the user against an endpoint. The application exposes a REST endpoint 
at a defined path (/hello). For a successful call, 
the response returns an HTTP 200 status message and a body. 
This example demonstrates how the authentication and authorization configured 
by default with Spring Security works.
- The only dependencies you need to write for our first project are 
`spring-boot-starter-web` and `spring-boot-starter-security`,
- module root folder is [spring-boot-security-web-default](spring-boot-security-web-default)
-  The main components acting in the authentication process 
   for Spring Security and the relationships among these:
  - The request is intercepted by the authentication filter.
  - Authentication responsibility is delegated to the authentication manager.
  - The authentication manager uses the authentication provider, which implements the 
    authentication logic.
  - The authentication provider finds the user with a user details service and validates the password using a password encoder.
  - The result of the authentication is returned to the filter.
  - Details about the authenticated entity are stored in the security context.
- The authentication provider uses the `UserDetailsService` and `PasswordEncoder` to find users and to check their passwords.
- make all the endpoints accessible without the need for credentials using `http.authorizeRequests().anyRequest().permitAll();`
- In the configuration class, instead of defining these two objects as beans, we set them up through 
  the `configure(AuthenticationManagerBuilder auth)` method. We override this method from 
  the `WebSecurityConfigurerAdapter` class and use its parameter of type `AuthenticationManagerBuilder` 
  to set both the UserDetailsService and the PasswordEncoder as shown in the class
  [spring-boot-security-web-config/src/main/java/com/javatmp/demo/AnotherWayOfConfig.java]()
