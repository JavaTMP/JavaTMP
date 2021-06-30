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
- module location [spring-boot-security-web-authorization-restrictions](spring-boot-security-web-authorization-restrictions)
- To choose the requests to which we apply authorization configuration, 
  we use matcher methods. Spring Security offers you three types of matcher methods:
  - MVC matchers. You use MVC expressions for paths to select endpoints.
  - Ant matchers. You use Ant expressions for paths to select endpoints.
  - regex matchers. You use regular expressions (regex) for paths to select endpoints.
- When you use matchers to refer to requests, the order of the rules should be from particular to general.
- the Ant matchers apply exactly the given Ant expressions for patterns but know nothing about subtle 
  Spring MVC functionality.

## Implementing filters
- The filter chain receives the request. Each filter uses a manager to apply specific logic 
  to the request and, eventually, delegates the request further along the chain to the next filter.
- You can customize the filter chain by adding new filters before, after, or at the position of 
  existing ones. This way, you can customize authentication as well as the entire process applied
  to request and response.
- Each filter has an order number. This determines the order in which filters are applied to 
  a request. You can add custom filters along with the filters provided by Spring Security.
- Spring Security provides some filter implementations and their order for us. 
  Among the provided filters: BasicAuthenticationFilter, CsrfFilter , CorsFilter .
- Filter module is [spring-boot-security-web-filter](spring-boot-security-web-filter) 

## Applying CSRF protection and CORS
- The CsrfFilter is one of the filters in the filter chain. It receives the request 
  and eventually forwards it to the next filter in the chain. To manage CSRF tokens, 
  CsrfFilter uses a CsrfTokenRepository.
- The default form login uses a hidden input to send the CSRF token in the request. 
  This is why the login request that uses an HTTP POST method works with CSRF 
  protection enabled.
- Without sending the CSRF token, the server won’t accept the request done with the HTTP POST method.
  The application redirects the user to a default error page, which confirms that the status 
  on the response is HTTP 403 Forbidden.
- First, the GET request generates the CSRF token and stores its value 
  in the database. Any following POST request must send this value. 
  Then, the CsrfFilter checks if the value in the request corresponds
  with the one in the database. Based on this, 
  the request is accepted or rejected.
- browsers don’t allow requests made for any domain other than 
  the one from which the site is loaded.
- CORS allows you to specify from which domain your application 
  allows requests and what details can be shared. The most important are
  - Access-Control-Allow-Origin--Specifies the foreign domains (origins) that can access resources on your domain.
  - Access-Control-Allow-Methods--Lets us refer only to some HTTP methods in situations in which we want to allow 
    access to a different domain, but only to specific HTTP methods. You use this if you’re going to enable example.com to call some endpoint, but only with HTTP GET, for example.
  - Access-Control-Allow-Headers--Adds limitations to which headers you can use in a specific request.
- You can place the @CrossOrigin annotation directly above the method that defines
  the endpoint and configure it using the allowed origins and methods.
  The value parameter of @CrossOrigin receives an array to let you define multiple origins
- By allowing all origins, you expose the application to cross-site scripting (XSS) requests, 
  which eventually can lead to DDoS attacks
- You can configure CORS both for an endpoint using the @CrossOrigin 
  annotation or centralized in the configuration class using the cors()
  method of the HttpSecurity object.

## Authentication and Authorization Applications
- The client calls the endpoints exposed by the business logic server.
  To authenticate the user, the business logic server uses the
  responsibility implemented by the authentication server.
  The authentication server stores the user credentials in its
  database.
- The first authentication step consists of identifying the user with
  their username and password. The user sends their credentials,
  and the authentication server returns an OTP for the second 
  authentication step.
- The second authentication step. The client sends the code they
  received through the SMS message, together with their username.
  The business logic server calls the authentication server to validate the OTP.
  If the OTP is valid, the business logic server issues a token
  back to the client. The client uses this token to call any other
  endpoint on the business logic server.
- The third authentication step. To call any endpoint exposed
  by the business logic server, the client adds a valid token
  in the authorization HTTP request header.
- When the client authenticates, the server generates a token
  and returns it to the client. This token is then used by the client
  to access resources on the server.
- When the client needs to access a user resource, they must
  provide a valid token in the request. A valid token is one
  previously issued by the server when the user authenticates.
- We send credentials only in the first request to authenticate. 
  Once authenticated, we get a token, and we can use it to get authorized for
  calling resources. This way, we only have to send credentials once to obtain 
  the token.
- A JWT has three parts, each part separated from the others by a dot (a period).
- A JWT is composed of three parts: the header, the body, and the signature.
  The header and the body are JSON representations of the data stored in the token.
  To make these easy to send in a request header, they are Base64 encoded.
  The last part of the token is the signature. The parts are concatenated with
  dots.
- In many cases, you find more than one good solution for solving a problem.
  Always consider all possible solutions and, if time allows, implement 
  proof-of-concepts for all options to understand which better fits your scenario.

## How does OAuth 2 work?
- When using HTTP Basic authentication, you need to send credentials 
  and repeat authentication logic with all requests. This approach implies 
  sharing credentials often over the network.
- In an organization, you work with multiple applications. Most of these need 
  you to authenticate to use them. It would be challenging for you to know
  multiple passwords and for the organization to manage multiple 
  sets of credentials.
- An easier-to-maintain architecture keeps credentials separately and allows
  all applications to use the same set of credentials for its users.
- The main components of the OAuth 2 architecture are 
  the resource owner, the client, the authorization server, and the resource server.
  Each of these has its own responsibility, which is essential in the
  authentication and authorization process.
  - The resource server. The application hosting resources owned by users. 
    Resources can be users’ data or their authorized actions.
  - The user (also known as the resource owner). The individual who owns
    resources exposed by the resource server. A user generally has a username
    and a password that they use to identify themselves.
  - The client. The application that accesses the resources owned by the user on their behalf. The client uses a 
    client ID and a client secret to identify itself. Be careful, these credentials are not the same as the user credentials. The client needs its own credentials to identify itself when making a request.
  - The authorization server. The application that authorizes the client to
    access the user’s resources exposed by the resource server. When the
    authorization server decides that a client is authorized to access
    a resource on behalf of the user, it issues a token. The client uses 
    this token to prove to the resource server that it was authorized by 
    the authorization server. The resource server allows the client to
    access the resource it requested if it has a valid token.
- OAuth 2 refers to using tokens for authorization. OAuth 2 offers multiple 
  possibilities for obtaining a token, called grants. Here are the most
  common OAuth 2 grants you can choose from:
  - Authorization code
  - Password
  - Refresh token
  - Client credentials
  
- 
