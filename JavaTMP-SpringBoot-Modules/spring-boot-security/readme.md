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
  [spring-boot-security-web-config/src/main/java/com/javatmp/demo/AnotherWayOfConfig.java](spring-boot-security-web-config/src/main/java/com/javatmp/demo/AnotherWayOfConfig.java)
- Overriding the AuthenticationProvider implementation by creating a custom authentication provider as in module [spring-boot-security-web-config-custom](spring-boot-security-web-config-custom) 
- Using multiple configuration classes in your project as in module [spring-boot-security-web-config-multiple](spring-boot-security-web-config-multiple)

## Managing users
- `UserDetails` which describes the user for Spring Security.
- `GrantedAuthority` which allows us to define actions that the user 
  can execute.
- `UserDetailsManager` which extends the `UserDetailsService` contract. 
  Beyond the inherited behavior, it also describes actions like creating 
  a user and modifying or deleting a user’s password.

### Implementing authentication in Spring Security
- The `UserDetailsService` is only responsible for retrieving 
  the user by username. This action is the only one needed by 
  the framework to complete authentication. 
- The `UserDetailsManager` adds behavior that refers to adding, modifying,
  or deleting the user, which is a required functionality in most applications. 
- the actions granted for a user are called authorities. To describe the authorities in Spring Security, 
  you use the `GrantedAuthority` interface.
- The `SimpleGrantedAuthority` class offers a way to create immutable 
  instances of the type `GrantedAuthority`.   
- You could quickly obtain an instance representing your user with 
  the `org.springframework.security.core.userdetails.User` builder class.
- We might implement the `UserDetailsService` to load the user from a database, 
  an external system, a vault, and so on.
- Using a JdbcUserDetailsManager for user management in module [spring-boot-security-web-user-jdbc](spring-boot-security-web-user-jdbc)
- Using an LdapUserDetailsManager for user management in module [spring-boot-security-web-user-ldap](spring-boot-security-web-user-ldap)
- To set up the embedded LDAP server, define a simple LDAP Data Interchange 
  Format (LDIF) file.

## Dealing with passwords
- The `AuthenticationProvider` uses the `PasswordEncoder` 
  to validate the user’s password in the authentication process.
- The purpose of the `encode(CharSequence rawPassword)` method 
  is to return a transformation of a provided string.
- You can use the `matches(CharSequence rawPassword, String encodedPassword)` method
  afterward to check if an encoded string matches a raw password.
- Spring Security provides you with some advantageous implementations
  of `PasswordEncoder` like:
  - `NoOpPasswordEncoder`. Doesn’t encode the password but keeps it in cleartext.
  - `StandardPasswordEncoder`. Uses SHA-256 to hash the password and 
    it's deprecated as it uses a hashing algorithm that we don’t consider 
    strong enough anymore
  - `Pbkdf2PasswordEncoder`. Uses the password-based key derivation function 2 (PBKDF2).
  - `BCryptPasswordEncoder`. Uses a bcrypt strong hashing function to encode the password.
  - `SCryptPasswordEncoder`. Uses an scrypt hashing function to encode the password.

- The `DelegatingPasswordEncoder` has a list of PasswordEncoder implementations to which it delegates. The DelegatingPasswordEncoder stores each of the instances in a map. 

### the Spring Security Crypto module
- Install Java Cryptography Extension (JCE) unlimited strength jurisdiction policy files.
- You’ll see examples of how to use two essential features from the SSCM:
  - Key generators. Objects used to generate keys for hashing and encryption algorithms
  - Encryptors. Objects used to encrypt and decrypt data.

#### Using key generators
- A key generator is an object used to generate a specific kind of key, 
  generally needed for an encryption or hashing algorithm.
- The two main types of key generators: 
  BytesKeyGenerator and StringKeyGenerator.

#### Using encryptors for encryption and decryption operations
- An encryptor is an object that implements an encryption algorithm. 
- There are two types of encryptors defined by the SSCM: `BytesEncryptor` and `TextEncryptor`.
- the standard byte encryptor uses 256-byte AES encryption to encrypt input. 
- `TextEncryptors` come in three main types. You create these three types by calling 
  the `Encryptors.text()`, `Encryptors.delux()`, or `Encryptors.queryableText()` methods.

## Implementing authentication
- The authentication process has only two possible results:
  - The entity making the request is not authenticated.
    Usually, in this case, the response status sent back to the client is HTTP 401 Unauthorized.
  - The entity making the request is authenticated.
    The details about the requester are stored such that the application 
    can use these for authorization,  the SecurityContext interface is the instance that stores the details 
    about the current authenticated request.
- The `Authentication` interface represents the authentication request 
  event and holds the details of the entity that requests access 
  to the application.
- The `Authentication` contract inherits from the `Principal` contract. 
  Authentication adds requirements such as the need for a password or 
  the possibility to specify more details about the authentication request. 
  Some of these details, like the list of authorities, 
  are Spring Security-specific.
- The `AuthenticationProvider` in Spring Security takes care of the authentication logic.
- Override the `supports(Class<?> c)` method to specify which type of 
  authentication is supported by the AuthenticationProvider that we define.
- To plug in the new implementation of the `AuthenticationProvider`, 
  override the `configure(AuthenticationManagerBuilder auth)` method 
  of the `WebSecurityConfigurerAdapter` class in the configuration class 
  of the project.   
- After successful authentication, the authentication filter stores 
  the details of the authenticated entity in the security context. 
  From there, the controller implementing the action mapped to the 
  request can access these details when needed.
- Spring Security offers three strategies to manage the SecurityContext 
  with an object in the role of a manager. It’s named the 
  `SecurityContextHolder`:
  - `MODE_THREADLOCAL`. Allows each thread to store its own details in the security context. In a thread-per-request 
  web application, this is a common approach as each request has an individual thread.
  - `MODE_INHERITABLETHREADLOCAL`. Similar to MODE_THREADLOCAL but also instructs Spring Security to copy the security 
    context to the next thread in case of an asynchronous method. This way, we can say that the new thread running the @Async method inherits the security context.
  - `MODE_GLOBAL`. Makes all the threads of the application see the same security context instance.

- Spring offers various implementations of the utility classes that you 
  can use in your application to manage the security context when creating 
  your own threads. like:
  - DelegatingSecurityContextExecutor
  - DelegatingSecurityContextExecutorService
  - DelegatingSecurityContextScheduledExecutorService
  - DelegatingSecurityContextRunnable
  - DelegatingSecurityContextCallable
  
- To customize the response for a failed authentication, 
  we can implement an AuthenticationEntryPoint like 
  in module [spring-boot-security-web-user-authentication-failure](spring-boot-security-web-user-authentication-failure)
- An unauthenticated user is redirected to a form where they can use 
  their credentials to authenticate. Once the application authenticates 
  them, they are redirected to the homepage of the application.
  
## Configuring authorization: Restricting access
- Authorization is the process during which the application decides whether an authenticated entity 
  is allowed to access a resource. Authorization always happens after authentication.
- When the client makes the request, the authentication filter authenticates the user. 
  After successful authentication, the authentication filter stores the user details in the security context 
  and forwards the request to the authorization filter. The authorization filter decides whether 
  the call is permitted. To decide whether to authorize the request, the authorization filter uses 
  the details from the security context.

### Restricting access based on authorities and roles
- A user has one or more authorities (actions that a user can do). During the authentication process, 
  the UserDetailsService obtains all the details about the user, including the authorities. 
  The application uses the authorities as represented by the GrantedAuthority interface for authorization 
  after it successfully authenticates the user.
- Authorities are actions that users can perform in the application. Based on these actions, 
  you implement the authorization rules. Only users having specific authorities can make 
  a particular request to an endpoint. 
- you can configure access using `hasAuthority()`,`hasAnyAuthority()`, and `access()` methods.
- Roles are coarse grained. Each user with a specific role can only do 
  the actions granted by that role. When applying this philosophy 
  in authorization, a request is allowed based on the purpose of the 
  user in the system. Only users who have a specific role can call 
  a certain endpoint.
- When defining a role, its name should start with the `ROLE_` prefix.
- To set constraints for user roles, you can use one of the following 
  methods: hasRole(), hasAnyRole(), access().
- When building users with the User builder class as we did in the 
  example for this section, you specify the role by using the roles() method.
  This method creates the GrantedAuthority object and automatically 
  adds the ROLE_ prefix to the names you provide.  
- the `access()` method is generic. It receives any SpEL expression. 
  It doesn’t need to be related to authorities and roles.

## Configuring authorization: Applying restrictions
-






