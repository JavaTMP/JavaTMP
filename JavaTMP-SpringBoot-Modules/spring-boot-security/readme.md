# Spring Boot Security Modules

## Security Introduction

Nonfunctional software qualities such as performance, scalability, availability,
and, of course, security, as well as others, can have an impact over time, from
short to long term.

A user mainly thinks about functional requirements. Sometimes, you might see
them aware of performance, which is nonfunctional, but unfortunately, it’s quite
unusual that a user cares about security. Nonfunctional requirements tend to be
more transparent than functional ones.

### Spring Security

- Spring Security project link is
  [https://spring.io/projects/spring-security](https://spring.io/projects/spring-security)
  .
- Spring Security described as a powerful and highly customizable framework for
  authentication and access control.
- Spring Security offers you a highly customizable way of implementing
  authentication, authorization, and protection against common attacks.

### Why is security important?

- the company could be liable and could lose a significant amount of money.
- Customers will probably choose to change the serviceCall provider, and the
  image of the company developing the application would be dramatically
  affected.

### Common security vulnerabilities in web applications

- An excellent start to understanding vulnerabilities is being aware of the Open
  Web Application Security Project, also known as OWASP (https://www.owasp.org).
- At OWASP, you’ll find descriptions of the most common vulnerabilities that you
  should avoid in your applications.
- Among the common vulnerabilities that you should be aware of, you’ll find
  these items are related to application-level security, and most of these are
  also directly related to using Spring Security:
  Broken authentication, Session fixation, Cross-site scripting (XSS),
  Cross-site request forgery (CSRF), Injections, Sensitive data exposure, Lack
  of method access control, Using dependencies with known vulnerabilities.

#### Vulnerabilities in authentication and authorization

- `Authentication` represents the process in which an application identifies
  someone trying to use it.
- `Authorization` is the process of establishing if an authenticated caller has
  the privileges to use specific functionality and data.
- A broken authorization happens if an individual with bad intentions somehow
  gains access to functionality or data that doesn’t belong to them.

#### Session fixation

- Session fixation vulnerability is a more specific, high-severity weakness of a
  web application. If present, it permits an attacker to impersonate a valid
  user by reusing a previously generated session ID.

#### Cross-site scripting (XSS)

- Cross-site scripting, also referred to as XSS, allows the injection of
  client-side scripts into web services exposed by the server, thereby
  permitting other users to run these.

#### Cross-site request forgery (CSRF)

- Cross-site request forgery (CSRF) vulnerabilities are also common in web
  applications. CSRF attacks assume that a URL that calls an action on a
  specific server can be extracted and reused from outside the application.
- One of the ways of mitigating this vulnerability is to use tokens to identify
  the request or use cross-origin resource sharing (CORS) limitations.

#### Understanding injection vulnerabilities in web applications

- In an injection attack, the attacker employing a vulnerability introduces
  specific data into the system.
- Injection attacks inject a client-side script with the means of harming the
  system somehow. Other examples could be SQL injection, XPath injection, OS
  command injection, LDAP injection, and the list continues.

#### Dealing with the exposure of sensitive data

- Define the credentials directly in the configuration files for simplicity
  reasons.
- The information in logs written by your application to the console or stored
  in databases such as Splunk or Elasticsearch.
- The application returns too many details that expose the implementations.

#### The lack of method access control

- You don’t apply authorization to only one of the tiers.
- Some future implementation could expose that use case without testing or
  without testing all the authorization requirements.

#### Using dependencies with known vulnerabilities

- the dependencies like libraries or frameworks that you use to build the
  functionality has vulnerabilities.
- We have to take all the needed measures to avoid the use of any dependency
  that has known vulnerabilities.

### Security applied in various architectures

- It’s important to understand that different software architectures imply
  different possible leaks and vulnerabilities.

#### Designing a one-piece web application

- Spring Security helps you with a relatively easy way of configuring user
  management.

#### Designing security for a backend/frontend separation

- Scalability refers to the quality of a software application in which it can
  serve more or fewer requests while adapting the resources used, without the
  need to change the application or its architecture. Mainly, we classify
  scalability into two types: vertical and horizontal.
- When a system is scaled vertically, when there are more requests, more memory
  and processing power are added to the system
- We accomplish horizontal scalability by changing the number of instances of
  the same application that are in execution

#### Understanding the OAuth 2 flow

- The OAuth 2 flow offers a better way to implement authentication and
  authorization
- The OAuth 2 framework defines two separate entities: the authorization server
  and the resource server.
- The purpose of the authorization server is to authorize the user and provide
  them with a token that specifies, a set of privileges that they can use.
- The part of the backend implementing this functionality is called the resource
  server.
- The endpoints that can be called are considered protected resources. Based on
  the obtained token, and after accomplishing authorization, a call on a
  resource is permitted or rejected.

#### Using API keys, cryptographic signatures, and IP validation to secure requests

- In some cases, you don’t need a username and a password to authenticate and
  authorize a caller, but you still want to make sure that nobody altered the
  exchanged messages.

## Spring Security Project

- first application uses HTTP Basic to authenticate and authorize the user
  against an endpoint. The application exposes a REST endpoint at a defined
  path (/hello). For a successful call, the response returns an HTTP 200 status
  message and a body. This example demonstrates how the authentication and
  authorization configured by default with Spring Security works.
- The only dependencies you need to write for our first project are
  `spring-boot-starter-web` and `spring-boot-starter-security`,
- module root folder
  is [spring-boot-security-web-default](spring-boot-security-web-default)
- The main components acting in the authentication process for Spring Security
  and the relationships among these:
- The request is intercepted by the authentication filter.
- Authentication responsibility is delegated to the authentication manager.
- The authentication manager uses the authentication provider, which implements
  the authentication logic.
- The authentication provider finds the user with a user details serviceCall and
  validates the password using a password encoder.
- The result of the authentication is returned to the filter.
- Details about the authenticated entity are stored in the security context.
- The authentication provider uses the `UserDetailsService`
  and `PasswordEncoder` to find users and to check their passwords.
- make all the endpoints accessible without the need for credentials
  using `http.authorizeRequests().anyRequest().permitAll();`
- In the configuration class, instead of defining these two objects as beans, we
  set them up through the `configure(AuthenticationManagerBuilder auth)` method.
  We override this method from the `WebSecurityConfigurerAdapter` class and use
  its parameter of type `AuthenticationManagerBuilder`
  to set both the UserDetailsService and the PasswordEncoder as shown in the
  class
  [spring-boot-security-web-config/src/main/java/com/javatmp/demo/AnotherWayOfConfig.java](spring-boot-security-web-config/src/main/java/com/javatmp/demo/AnotherWayOfConfig.java)
- Overriding the AuthenticationProvider implementation by creating a custom
  authentication provider as in
  module [spring-boot-security-web-config-custom](spring-boot-security-web-config-custom)
- Using multiple configuration classes in your project as in
  module [spring-boot-security-web-config-multiple](spring-boot-security-web-config-multiple)

## Managing users

- `UserDetails` which describes the user for Spring Security.
- `GrantedAuthority` which allows us to define actions that the user can
  execute.
- `UserDetailsManager` which extends the `UserDetailsService` contract. Beyond
  the inherited behavior, it also describes actions like creating a user and
  modifying or deleting a user’s password.

### Implementing authentication in Spring Security

- The `UserDetailsService` is only responsible for retrieving the user by
  username. This action is the only one needed by the framework to complete
  authentication.
- The `UserDetailsManager` adds behavior that refers to adding, modifying, or
  deleting the user, which is a required functionality in most applications.
- the actions granted for a user are called authorities. To describe the
  authorities in Spring Security, you use the `GrantedAuthority` interface.
- The `SimpleGrantedAuthority` class offers a way to create immutable instances
  of the type `GrantedAuthority`.
- You could quickly obtain an instance representing your user with
  the `org.springframework.security.core.userdetails.User` builder class.
- We might implement the `UserDetailsService` to load the user from a database,
  an external system, a vault, and so on.
- Using a JdbcUserDetailsManager for user management in
  module [spring-boot-security-web-user-jdbc](spring-boot-security-web-user-jdbc)
- Using an LdapUserDetailsManager for user management in
  module [spring-boot-security-web-user-ldap](spring-boot-security-web-user-ldap)
- To set up the embedded LDAP server, define a simple LDAP Data Interchange
  Format (LDIF) file.

## Dealing with passwords

- The `AuthenticationProvider` uses the `PasswordEncoder`
  to validate the user’s password in the authentication process.
- The purpose of the `encode(CharSequence rawPassword)` method is to return a
  transformation of a provided string.
- You can use the `matches(CharSequence rawPassword, String encodedPassword)`
  method afterward to check if an encoded string matches a raw password.
- Spring Security provides you with some advantageous implementations
  of `PasswordEncoder` like:
    - `NoOpPasswordEncoder`. Doesn’t encode the password but keeps it in
      cleartext.
    - `StandardPasswordEncoder`. Uses SHA-256 to hash the password and it's
      deprecated as it uses a hashing algorithm that we don’t consider strong
      enough anymore
    - `Pbkdf2PasswordEncoder`. Uses the password-based key derivation function
      2 (PBKDF2).
    - `BCryptPasswordEncoder`. Uses a bcrypt strong hashing function to encode
      the password.
    - `SCryptPasswordEncoder`. Uses an scrypt hashing function to encode the
      password.

- The `DelegatingPasswordEncoder` has a list of PasswordEncoder implementations
  to which it delegates. The DelegatingPasswordEncoder stores each of the
  instances in a map.

### the Spring Security Crypto module

- Install Java Cryptography Extension (JCE) unlimited strength jurisdiction
  policy files.
- You’ll see examples of how to use two essential features from the SSCM:
    - Key generators. Objects used to generate keys for hashing and encryption
      algorithms
    - Encryptors. Objects used to encrypt and decrypt data.

#### Using key generators

- A key generator is an object used to generate a specific kind of key,
  generally needed for an encryption or hashing algorithm.
- The two main types of key generators:
  BytesKeyGenerator and StringKeyGenerator.

#### Using encryptors for encryption and decryption operations

- An encryptor is an object that implements an encryption algorithm.
- There are two types of encryptors defined by the SSCM: `BytesEncryptor`
  and `TextEncryptor`.
- the standard byte encryptor uses 256-byte AES encryption to encrypt input.
- `TextEncryptors` come in three main types. You create these three types by
  calling the `Encryptors.text()`, `Encryptors.delux()`,
  or `Encryptors.queryableText()` methods.

## Implementing authentication

- The authentication process has only two possible results:
    - The entity making the request is not authenticated. Usually, in this case,
      the response status sent back to the client is HTTP 401 Unauthorized.
    - The entity making the request is authenticated. The details about the
      requester are stored such that the application can use these for
      authorization, the SecurityContext interface is the instance that stores
      the details about the current authenticated request.
- The `Authentication` interface represents the authentication request event and
  holds the details of the entity that requests access to the application.
- The `Authentication` contract inherits from the `Principal` contract.
  Authentication adds requirements such as the need for a password or the
  possibility to specify more details about the authentication request. Some of
  these details, like the list of authorities, are Spring Security-specific.
- The `AuthenticationProvider` in Spring Security takes care of the
  authentication logic.
- Override the `supports(Class<?> c)` method to specify which type of
  authentication is supported by the AuthenticationProvider that we define.
- To plug in the new implementation of the `AuthenticationProvider`, override
  the `configure(AuthenticationManagerBuilder auth)` method of
  the `WebSecurityConfigurerAdapter` class in the configuration class of the
  project.
- After successful authentication, the authentication filter stores the details
  of the authenticated entity in the security context. From there, the
  controller implementing the action mapped to the request can access these
  details when needed.
- Spring Security offers three strategies to manage the SecurityContext with an
  object in the role of a manager. It’s named the
  `SecurityContextHolder`:
    - `MODE_THREADLOCAL`. Allows each thread to store its own details in the
      security context. In a thread-per-request web application, this is a
      common approach as each request has an individual thread.
    - `MODE_INHERITABLETHREADLOCAL`. Similar to MODE_THREADLOCAL but also
      instructs Spring Security to copy the security context to the next thread
      in case of an asynchronous method. This way, we can say that the new
      thread running the @Async method inherits the security context.
    - `MODE_GLOBAL`. Makes all the threads of the application see the same
      security context instance.

- Spring offers various implementations of the utility classes that you can use
  in your application to manage the security context when creating your own
  threads. like:
    - DelegatingSecurityContextExecutor
    - DelegatingSecurityContextExecutorService
    - DelegatingSecurityContextScheduledExecutorService
    - DelegatingSecurityContextRunnable
    - DelegatingSecurityContextCallable

- To customize the response for a failed authentication, we can implement an
  AuthenticationEntryPoint like in
  module [spring-boot-security-web-user-authentication-failure](spring-boot-security-web-user-authentication-failure)
- An unauthenticated user is redirected to a form where they can use their
  credentials to authenticate. Once the application authenticates them, they are
  redirected to the homepage of the application.

## Configuring authorization: Restricting access

- Authorization is the process during which the application decides whether an
  authenticated entity is allowed to access a resource. Authorization always
  happens after authentication.
- When the client makes the request, the authentication filter authenticates the
  user. After successful authentication, the authentication filter stores the
  user details in the security context and forwards the request to the
  authorization filter. The authorization filter decides whether the call is
  permitted. To decide whether to authorize the request, the authorization
  filter uses the details from the security context.

### Restricting access based on authorities and roles

- A user has one or more authorities (actions that a user can do). During the
  authentication process, the UserDetailsService obtains all the details about
  the user, including the authorities. The application uses the authorities as
  represented by the GrantedAuthority interface for authorization after it
  successfully authenticates the user.
- Authorities are actions that users can perform in the application. Based on
  these actions, you implement the authorization rules. Only users having
  specific authorities can make a particular request to an endpoint.
- you can configure access using `hasAuthority()`,`hasAnyAuthority()`,
  and `access()` methods.
- Roles are coarse grained. Each user with a specific role can only do the
  actions granted by that role. When applying this philosophy in authorization,
  a request is allowed based on the purpose of the user in the system. Only
  users who have a specific role can call a certain endpoint.
- When defining a role, its name should start with the `ROLE_` prefix.
- To set constraints for user roles, you can use one of the following methods:
  hasRole(), hasAnyRole(), access().
- When building users with the User builder class as we did in the example for
  this section, you specify the role by using the roles() method. This method
  creates the GrantedAuthority object and automatically adds the ROLE_ prefix to
  the names you provide.
- the `access()` method is generic. It receives any SpEL expression. It doesn’t
  need to be related to authorities and roles.

## Configuring authorization: Applying restrictions

- module
  location [spring-boot-security-web-authorization-restrictions](spring-boot-security-web-authorization-restrictions)
- To choose the requests to which we apply authorization configuration, we use
  matcher methods. Spring Security offers you three types of matcher methods:
    - MVC matchers. You use MVC expressions for paths to select endpoints.
    - Ant matchers. You use Ant expressions for paths to select endpoints.
    - regex matchers. You use regular expressions (regex) for paths to select
      endpoints.
- When you use matchers to refer to requests, the order of the rules should be
  from particular to general.
- the Ant matchers apply exactly the given Ant expressions for patterns but know
  nothing about subtle Spring MVC functionality.

## Implementing filters

- The filter chain receives the request. Each filter uses a manager to apply
  specific logic to the request and, eventually, delegates the request further
  along the chain to the next filter.
- You can customize the filter chain by adding new filters before, after, or at
  the position of existing ones. This way, you can customize authentication as
  well as the entire process applied to request and response.
- Each filter has an order number. This determines the order in which filters
  are applied to a request. You can add custom filters along with the filters
  provided by Spring Security.
- Spring Security provides some filter implementations and their order for us.
  Among the provided filters: BasicAuthenticationFilter, CsrfFilter , CorsFilter
  .
- Filter module
  is [spring-boot-security-web-filter](spring-boot-security-web-filter)

## Applying CSRF protection and CORS

- The CsrfFilter is one of the filters in the filter chain. It receives the
  request and eventually forwards it to the next filter in the chain. To manage
  CSRF tokens, CsrfFilter uses a CsrfTokenRepository.
- The default form login uses a hidden input to send the CSRF token in the
  request. This is why the login request that uses an HTTP POST method works
  with CSRF protection enabled.
- Without sending the CSRF token, the server won’t accept the request done with
  the HTTP POST method. The application redirects the user to a default error
  page, which confirms that the status on the response is HTTP 403 Forbidden.
- First, the GET request generates the CSRF token and stores its value in the
  database. Any following POST request must send this value. Then, the
  CsrfFilter checks if the value in the request corresponds with the one in the
  database. Based on this, the request is accepted or rejected.
- browsers don’t allow requests made for any domain other than the one from
  which the site is loaded.
- CORS allows you to specify from which domain your application allows requests
  and what details can be shared. The most important are
    - Access-Control-Allow-Origin--Specifies the foreign domains (origins) that
      can access resources on your domain.
    - Access-Control-Allow-Methods--Lets us refer only to some HTTP methods in
      situations in which we want to allow access to a different domain, but
      only to specific HTTP methods. You use this if you’re going to enable
      example.com to call some endpoint, but only with HTTP GET, for example.
    - Access-Control-Allow-Headers--Adds limitations to which headers you can
      use in a specific request.
- You can place the @CrossOrigin annotation directly above the method that
  defines the endpoint and configure it using the allowed origins and methods.
  The value parameter of @CrossOrigin receives an array to let you define
  multiple origins
- By allowing all origins, you expose the application to cross-site scripting (
  XSS) requests, which eventually can lead to DDoS attacks
- You can configure CORS both for an endpoint using the @CrossOrigin annotation
  or centralized in the configuration class using the cors()
  method of the HttpSecurity object.

## Authentication and Authorization Applications

- The client calls the endpoints exposed by the business logic server. To
  authenticate the user, the business logic server uses the responsibility
  implemented by the authentication server. The authentication server stores the
  user credentials in its database.
- The first authentication step consists of identifying the user with their
  username and password. The user sends their credentials, and the
  authentication server returns an OTP for the second authentication step.
- The second authentication step. The client sends the code they received
  through the SMS message, together with their username. The business logic
  server calls the authentication server to validate the OTP. If the OTP is
  valid, the business logic server issues a token back to the client. The client
  uses this token to call any other endpoint on the business logic server.
- The third authentication step. To call any endpoint exposed by the business
  logic server, the client adds a valid token in the authorization HTTP request
  header.
- When the client authenticates, the server generates a token and returns it to
  the client. This token is then used by the client to access resources on the
  server.
- When the client needs to access a user resource, they must provide a valid
  token in the request. A valid token is one previously issued by the server
  when the user authenticates.
- We send credentials only in the first request to authenticate. Once
  authenticated, we get a token, and we can use it to get authorized for calling
  resources. This way, we only have to send credentials once to obtain the
  token.
- A JWT has three parts, each part separated from the others by a dot (a period)
  .
- A JWT is composed of three parts: the header, the body, and the signature. The
  header and the body are JSON representations of the data stored in the token.
  To make these easy to send in a request header, they are Base64 encoded. The
  last part of the token is the signature. The parts are concatenated with dots.
- In many cases, you find more than one good solution for solving a problem.
  Always consider all possible solutions and, if time allows, implement
  proof-of-concepts for all options to understand which better fits your
  scenario.

## How does OAuth 2 work?

- When using HTTP Basic authentication, you need to send credentials and repeat
  authentication logic with all requests. This approach implies sharing
  credentials often over the network.
- In an organization, you work with multiple applications. Most of these need
  you to authenticate to use them. It would be challenging for you to know
  multiple passwords and for the organization to manage multiple sets of
  credentials.
- An easier-to-maintain architecture keeps credentials separately and allows all
  applications to use the same set of credentials for its users.
- The main components of the OAuth 2 architecture are the resource owner, the
  client, the authorization server, and the resource server. Each of these has
  its own responsibility, which is essential in the authentication and
  authorization process.
    - The resource server. The application hosting resources owned by users.
      Resources can be users’ data or their authorized actions.
    - The user (also known as the resource owner). The individual who owns
      resources exposed by the resource server. A user generally has a username
      and a password that they use to identify themselves.
    - The client. The application that accesses the resources owned by the user
      on their behalf. The client uses a client ID and a client secret to
      identify itself. Be careful, these credentials are not the same as the
      user credentials. The client needs its own credentials to identify itself
      when making a request.
    - The authorization server. The application that authorizes the client to
      access the user’s resources exposed by the resource server. When the
      authorization server decides that a client is authorized to access a
      resource on behalf of the user, it issues a token. The client uses this
      token to prove to the resource server that it was authorized by the
      authorization server. The resource server allows the client to access the
      resource it requested if it has a valid token.

### Implementation choices with OAuth 2

- OAuth 2 refers to using tokens for authorization. OAuth 2 offers multiple
  possibilities for obtaining a token, called grants. Here are the most common
  OAuth 2 grants you can choose from:
    - Authorization code
    - Password
    - Refresh token
    - Client credentials

#### Implementing the authorization code grant type

The authorization code grant type. The client asks the user to interact directly
with the authorization server to grant it permission for the user’s request.
Once authorized, the authorization server issues a token that the client uses to
access the user’s resources.

Here’s how the authorization code grant type works. Following this, we dive into
the details about each step.

1. Make the authentication request
2. Obtain an access token
3. Call the protected resource

##### Step 1: Making the authentication request with the authorization code grant type

The client redirects the user to an endpoint of the authorization server where
they need to authenticate.

when the client redirects the user to the authorization server, the client calls
the authorization endpoint with the following details in the request query:

- `response_type` with the value code, which tells the authorization server that
  the client expects a code. The client needs the code to obtain an access
  token, as you’ll see in the second step.
- `client_id` with the value of the client ID, which identifies the application
  itself.
- `redirect_uri`, which tells the authorization server where to redirect the
  user after successful authentication. Sometimes the authorization server
  already knows a default redirect URI for each client. For this reason, the
  client doesn’t need to send the redirect URI.
- `scope`, which is similar to the granted authorities we discussed in chapter
    5.
- `state`, which defines a cross-site request forgery (CSRF) token used for the
  CSRF protection we discussed in chapter 10.

After successful authentication, the authorization server calls back the client
on the redirect URI and provides a code and the state value. The client checks
that the state value is the same as the one it sent in the request to confirm
that it was not someone else attempting to call the redirect URI. The client
uses the code to obtain an access token as presented in step 2.

##### Step 2: Obtaining an access token with the authorization code grant type

To allow the user to access resources, the code resulting from step 1 is the
client’s proof that the user authenticated. You guessed correctly, this is why
this is called the authorization code grant type. Now the client calls the
authorization server with the code to get the token.

In the first step, the interaction was between the user and the authorization
server. In this step, the interaction is between the client and the
authorization server

By sending an authorization code first, the client has to prove again who they
are by using their credentials to obtain an access token. The client makes a
final call to get an access token and sends

- The authorization code, which proves the user authorized them
- Their credentials, which proves they really are the same client and not
  someone else who intercepted the authorization codes

the client now makes a request to the authorization server. This request
contains the following details:

`code`, which is the authorization code received in step 1. This proves that the
user authenticated.
`client_id` and `client_secret`, the client’s credentials.
`redirect_uri`, which is the same one used in step 1 for validation.
`grant_type` with the value authorization_code, which identifies the kind of
flow used. A server might support multiple flows, so it’s essential always to
specify which is the current executed authentication flow.

the server sends back an `access_token`. This token is a value that the client
can use to call resources exposed by the resource server.

##### Step 3: Calling the protected resource with the authorization code grant type

After successfully obtaining the access token from the authorization server, the
client can now call for the protected resource. The client uses an access token
in the authorization request header when calling an endpoint of the resource
server.

#### Implementing the password grant type

This grant type is also known as the resource owner credentials grant type.

Applications using this flow assume that the client collects the user
credentials and uses these to authenticate and obtain an access token from the
authorization server.

The password grant type assumes that the user shares their credentials with the
client. The client uses these to obtain a token from the authorization server.
It then accesses the resources from the resource server on behalf of the user.

You use this authentication flow only if the client and authorization server are
built and maintained by the same organization.

With the password grant type, you would instead expect to have the application
present a login form to the user, and let the client take care of sending the
credentials to the server to authenticate. The user doesn’t need to know how you
designed the authentication responsibility in your application. Let’s see what
happens when using the password grant type. The two tasks are as follows:

1. Request an access token.
2. Use the access token to call resources.

##### Step 1: Requesting an access token when using the password grant type

The client collects the user credentials and calls the authorization server to
obtain an access token. When requesting the access token, the client also sends
the following details in the request:

`grant_type` with the value password.
`client_id` and `client_secret`, which are the credentials used by the client to
authenticate itself.
`scope`, which you can understand as the granted authorities.
`username` and `password`, which are the user credentials. These are sent in
plain text as values of the request header.

The client receives back an access token in the response. The client can now use
the access token to call the endpoints of the resource server.

##### Step 2: Using an access token to call resources when using the password grant type

Once the client has an access token, it uses the token to call the endpoints on
the resource server, which is exactly like the authorization code grant type.
The client adds the access token to the requests in the authorization request
header.

In this flow, I need to share credentials with the client. For this reason, we
say that this grant type applies only if the resource owner “trusts” the client.

#### Implementing the client credentials grant type

The client credentials grant type. We use this flow if a client needs to access
a resource but not on behalf of a resource owner. This resource can be an
endpoint that isn’t owned by a user.

The steps for the client credentials grant type are similar to the password
grant type. The only exception is that the request for an access token doesn’t
need any user credentials. Here are the steps to implement this grant type:

1. Request an access token
2. Use the access token to call resources

##### Step 1: Requesting an access token with the client credential grant type

To obtain an access token, the client sends a request to the authorization
server with the following details:
`grant_type` with the value `client_credentials`
`client_id` and `client_secret`, which represent the client credentials
`scope`, which represents the granted authorities

In response, the client receives an access token. The client can now use the
access token to call the endpoints of the resource server.

##### Step 2: Using an access token to call resources with the client credential grant type

Once the client has an access token, it uses that token to call the endpoints on
the resource server, which is exactly like the authorization code grant type and
the password grant type. The client adds the access token to the requests in the
authorization request header.

#### Using refresh tokens to obtain new access tokens

The refresh tokens that we discuss in this section represent an alternative to
using credentials for obtaining a new access token.

The refresh token. The client has an access token that expired. To avoid forcing
the user to log in again, the client uses a refresh token to issue a new access
token.

To avoid the need to reauthenticate, the authorization server can issue a
refresh token, which has a different value and purpose than an access token. The
app uses the refresh token to obtain a new access token instead of having to
reauthenticate.

Refresh tokens also have advantages over reauthentication in the password grant
type. Even if with the password grant type, if we don’t use refresh tokens, we
would either have to ask the user to authenticate again or store their
credentials.

Once the client has a refresh token, the client should issue a request with the
following details when the access token expires:
`grant_type` with value refresh_token.
`refresh_token` with the value of the refresh token.
`client_id` and `client_secret` with the client credentials.
`scope`, which defines the same granted authorities or less. If more granted
authorities need to be authorized, a reauthentication is needed.

### The sins of OAuth 2

OAuth 2 has its vulnerabilities of which we must be aware and which we must
consider when building our applications. I enumerate here some of the most
common:

1. `Using cross-site request forgery (CSRF) on the client`--With a user logged
   in, CSRF is possible if the application doesn’t apply any CSRF protection
   mechanism.
2. `Stealing client credentials`--Storing or transferring unprotected
   credentials can create breaches that allow attackers to steal and use them.
3. Replaying tokens
4. Token hijacking--Implies someone interferes with the authentication process
   and steals tokens that they can use to access resources.

### Implementing a simple single sign-on application

A single sign-on (SSO) application is, as the name suggests, one in which you
authenticate through an authorization server, and then the app keeps you logged
in, using a refresh token. In our case, it represents only the client from the
OAuth 2 architecture.

Our application takes the role of the client in the OAuth 2 architecture. We use
GitHub as the authorization server, but it also takes the role of the resource
server, which allows us to retrieve the user’s details.

#### Managing the authorization server

A client uses these credentials to authenticate itself at the authorization
server, so the OAuth application must be registered with the GitHub
authorization server. To do this, we complete a short form using the following
link:
[https://github.com/settings/applications/new](https://github.com/settings/applications/new)

The OAuth 2 grant type on which this works is the authorization code grant type.
This grant type assumes that the client redirects the user to the authorization
server (GitHub, in our case) for login, and then the authorization server calls
the client back at a defined URL.

To use your application as an OAuth 2 client with GitHub as the authorization
server, you must register it first. You do this by filling in the form to add a
new OAuth application on GitHub.

When you register an OAuth application with GitHub, you receive the credentials
for your client. You use these in your application configuration.

#### Starting the implementation

By calling the oauth2Login() method on the HttpSecurity object, we add the
OAuth2LoginAuthenticationFilter to the filter chain. It intercepts the request
and applies OAuth 2 authentication logic.

The ClientRegistration interface represents the client in the OAuth 2
architecture. For the client, you need to define all its needed details

if the authorization server is not developed by you, as in our case, you need to
get them from the documentation. For GitHub, for example, you can find them
here:

https://developer.github.com/apps/building-oauth-apps/authorizing-oauth-apps/

The framework defines a class named CommonOAuth2Provider. This class partially
defines the ClientRegistration instances for the most common providers you can
use for authentication

If your authorization server is not among the common providers, then you have no
other option but to define ClientRegistration entirely

adding ClientRegistrationRepository as a bean in the Spring context is enough
for Spring Security to find it and work with it. As an alternative to this way
of registering ClientRegistrationRepository, you can use a Customizer object as
a parameter of the oauth2Login() method of the HttpSecurity object.

Spring Boot is designed to use its magic and build the ClientRegistration and
ClientRegistrationRepository objects directly from the properties file.

```
spring.security.oauth2.client.registration.github.client-id=a7553955a0c534ec5e6b
spring.security.oauth2.client.registration.github.client-secret=1795b30b425ebb79e424afa51913f1c724da0dbb
```

We don’t need to specify any details about ClientRegistration and
`ClientRegistrationRepository` because they are created automatically by Spring
Boot based on the properties file. If we use a provider other than the common
ones known by Spring Security, we need to also specify the details for the
authorization server using the property group starting with
`spring.security.oauth2.client.provider`

You’re already aware that in the Spring Security architecture, it’s the
SecurityContext that stores the details of an authenticated user. Once the
authentication process ends, the responsible filter stores the Authentication
object in the SecurityContext.

The implementation of the Authentication object used by the framework is named
`OAuth2AuthenticationToken` in this case. You can take it directly from the
`SecurityContext` or let Spring Boot inject it for you in a parameter of the
endpoint

The application uses GitHub as an authorization server and also as a resource
server. When the user wants to log in, the client redirects the user to the
GitHub login page. When the user logs in successfully, GitHub calls back to our
application with an authorization code. Our application uses the authorization
code to request an access token. The application can then access the user
details from the resource server (GitHub) by providing the access token. The
response from the resource server provides the user details along with the URL
for the main page.

## 13 OAuth 2: Implementing the authorization server

The role of the authorization server is to authenticate the user and provide a
token to the client. The client uses this token to access resources exposed by
the resource server on behalf of the user.

The authorization server is one of the OAuth 2 actors. It identifies the
resource owner and provides an access token to the client. The client needs the
access token to access resources on behalf of the user.

Implementing a custom authorization server helps you better understand how this
component works. Of course, it’s also the only way at present to implement an
authorization server.

### 13.1 Writing your own authorization server implementation

define a configuration class, which I call AuthServerConfig. Besides the classic
@Configuration annotation, we also need to annotate this class with
@EnableAuthorizationServer. This way, we instruct Spring Boot to enable the
configuration specific to the OAuth 2 authorization server. We can customize
this configuration by extending the AuthorizationServerConfigurerAdapter class
and overriding specific methods

### 13.2 Defining user management

The authentication process. A filter intercepts the user request and delegates
the authentication responsibility to an authentication manager. Further, the
authentication manager uses an authentication provider that implements the
authentication logic. To find the user, the authentication provider uses a
UserDetailsService, and to verify the password, the authentication provider uses
a PasswordEncoder.

### 13.3 Registering clients with the authorization server

The contract that defines the client for the authorization server is
ClientDetails. The contract defining the object to retrieve `ClientDetails` by
their IDs is `ClientDetailsService`.

### 13.4 Using the password grant type

The password grant type. The authorization server receives the user credentials
and authenticates the user. If the credentials are correct, the authorization
server issues an access token that the client can use to call resources that
belong to the authenticated user.

### 13.5 Using the authorization code grant type

In the authorization code grant type, the client redirects the user to the
authorization server for authentication. The user directly interacts with the
authorization server and, once authenticated, the authorization server returns
to the client a redirect URI. When it calls back to the client, it also provides
an authorization code. The client uses the authorization code to obtain an
access token.

### 13.6 Using the client credentials grant type

The client credentials grant type doesn’t involve the user. Generally, we use
this grant type for authentication between two backend solutions. The client
needs only its credentials to authenticate and obtain an access token.

### 13.7 Using the refresh token grant type

When the user authenticates, the client also receives a refresh token besides
the access token. The client uses the refresh token to get a new access token.

## 14 OAuth 2: Implementing the resource server

A client obtains an access token from the authorization server and uses it to
call for resources on the resource server by adding the token to the HTTP
request headers.

The resource server is one of the components acting in the OAuth 2 architecture.
The resource server manages user data. To call an endpoint on the resource
server, a client needs to prove with a valid access token that the user approves
it to work with their data.

To validate the token, the resource server calls the authorization server
directly. The authorization server knows whether it issued a specific token or
not.

The second option uses a common database where the authorization server stores
tokens, and then the resource server can access and validate the tokens. This
approach is also called blackboarding.

Blackboarding. Both the authorization server and the resource server access a
shared database. The authorization server stores the tokens in this database
after it issues them. The resource server can then access them to validate the
tokens it receives.

Finally, the third option uses cryptographic signatures. The authorization
server signs the token when issuing it, and the resource server validates the
signature. Here’s where we generally use JSON Web Tokens (JWTs).

When issuing an access token, the authorization server uses a private key to
sign it. To verify a token, the resource server only needs to check if the
signature is valid.

### 14.1 Implementing a resource server

We use the default implementation provided by Spring Boot, which allows the
resource server to directly call the authorization server to find out if a token
is valid

### 14.2 Checking the token remotely

To validate a token and obtain details about it, the resource server calls the
endpoint /oauth/check_token of the authorization server. The resource server
uses the details retrieved about the token to authorize the call.

The network is not 100% reliable. If the connection between the resource server
and the authorization server is down, tokens cannot be validated. This implies
that the resource server refuses the client access to the user’s resources even
if it has a valid token.

### 14.3 Implementing blackboarding with a JdbcTokenStore

When the authorization server issues a token, it also stores the token in a
shared database. This way, the resource server can get the token and validate it
later.

The resource server searches for the token in the shared database. If the token
exists, the resource server finds the details related to it in the database,
including the username and its authorities. With these details, the resource
server can then authorize the request.

The authorization server uses a token store to generate tokens at the end of the
authentication process. The client uses these tokens to access resources managed
by the resource server.

The resource server uses the token store to validate the token and retrieve
details needed for authorization. These details are then stored in the security
context.

## 15 OAuth 2: Using JWT and cryptographic signatures

Using cryptographic signatures to validate tokens has the advantage of allowing
the resource server to validate them without needing to call the authorization
server directly and without needing a shared database.

### 15.1 Using tokens signed with symmetric keys with JWT

The most straightforward approach to signing tokens is using symmetric keys.
With this approach, using the same key, you can both sign a token and validate
its signature.

#### 15.1.1 Using JWTs

A token consists of three parts: the header, the body, and the signature.

A JWT is composed of three parts: the header, the body, and the signature. The
header and the body contain details represented with JSON. These parts are
Base64 encoded and then signed. The token is a string formed of these three
parts separated by dots.

When a JWT is signed, we also call it a JWS (JSON Web Token Signed).

A hacker intercepts a token and changes its content. The resource server rejects
the call because the signature of the token no longer matches the content.

If a token is encrypted, we also call it a JWE (JSON Web Token Encrypted). You
can’t see the contents of an encrypted token without a valid key.

#### 15.1.2 Implementing an authorization server to issue JWTs

Using symmetric keys. Both the authorization server and the resource server
share the same key. The authorization server uses the key to sign the tokens,
and the resource server uses the key to validate the signature.

#### 15.1.3 Implementing a resource server that uses JWT

A key used for symmetric encryption or signing is just a random string of bytes.
You generate it using an algorithm for randomness.

The resource server needs the key to validate a token’s signature. The next
listing defines the resource server configuration class.

We can now start our resource server and call the /hello endpoint using a valid
JWT that you obtained earlier from the authorization server. You have to add the
token to the Authorization HTTP header on the request prefixed with the word
'Bearer'

### 15.2 Using tokens signed with asymmetric keys with JWT

To sign the token, someone needs to use the private key. The public key of the
key pair can then be used by anyone to verify the identity of the signer.

#### 15.2.1 Generating the key pair

This is an asymmetric key pair (which means it has a private part used by the
authorization server to sign a token and a public part used by the resource
server to validate the signature).

To generate the key pair, I use keytool and OpenSSL

Generating a private key To generate a private key, run the keytool command in
the next code snippet. It generates a private key in a file named ssia.jks. I
also use the password “ssia123” to protect the private key and the alias “ssia”
to give the key a name. In the following command, you can see the algorithm used
to generate the key, RSA:
`keytool -genkeypair -alias ssia -keyalg RSA -keypass ssia123 -keystore ssia.jks -storepass ssia123`

Obtaining the public key To get the public key for the previously generated
private key, you can run the keytool command:
`keytool -list -rfc --keystore ssia.jks | openssl x509 -inform pem -pubkey`

#### 15.2.2 Implementing an authorization server that uses private keys

we configure the authorization server to use a private key for signing JWTs.

#### 15.2.3 Implementing a resource server that uses public keys

we implement a resource server that uses the public key to verify the token’s
signature.

#### 15.2.4 Using an endpoint to expose the public key

If the keys are changed periodically, the system is less vulnerable to key
theft. But if the keys are configured in both applications, it’s more difficult
to rotate them.

Both keys are configured at the authorization server. To get the public key, the
resource server calls an endpoint from the authorization server. This approach
allows us to rotate keys easier, as we only have to configure them in one place.

For the authorization server, We need to override the endpoint’s configuration
and allow anyone with client credentials to access it.

You can start the authorization server and call the /oauth/token_key endpoint to
make sure you correctly implement the configuration.

For the resource server to use this endpoint and obtain the public key, you only
need to configure the endpoint and the credentials in its properties file.

### 15.3 Adding custom details to the JWT

#### 15.3.1 Configuring the authorization server to add custom details to tokens

To add additional details to your token, you need to create an object of type
TokenEnhancer.

#### 15.3.2 Configuring the resource server to read the custom details of a JWT

Once you change your authorization server to add custom details to a JWT, you’d
like the resource server to be able to read these details.

`AccessTokenConverter` is the object that converts the token to an
Authentication. This is the object we need to change so that it also takes into
consideration the custom details in the token.

## 16 Global method security: Pre- and postauthorizations

Global method security enables you to apply authorization rules at any layer of
your application. This approach allows you to be more granular and to apply
authorization rules at a specifically chosen level.

global method security offers the opportunity to implement authorization rules
even if we don’t have endpoints.

### 16.1 Enabling global method security

This approach provides you with greater flexibility in applying authorization.
It’s an essential skill that allows you to solve situations in which
authorization simply cannot be configured just at the endpoint level.

you can do two main things with global method security:

- Call authorization: Decides whether someone can call a method according to
  some implemented privilege rules (preauthorization) or if someone can access
  what the method returns after the method executes (postauthorization).
- Filtering: Decides what a method can receive through its parameters (
  prefiltering) and what the caller can receive back from the method after the
  method executes (postfiltering).

#### 16.1.1 Understanding call authorization

When we enable global method security, an aspect intercepts the call to the
protected method. If the given authorization rules aren't respected, the aspect
doesn't delegate the call to the protected method.

With preauthorization, the authorization rules are verified before delegating
the method call further. The framework won’t delegate the call if the
authorization rules aren’t respected, and instead, throws an exception to the
method caller.

With postauthorization, the aspect delegates the call to the protected method.
After the protected method finishes execution, the aspect checks the
authorization rules. If the rules aren’t respected, instead of returning the
result to the caller, the aspect throws an exception.

Even with the `@Transactional` annotation, a change isn’t rolled back if
postauthorization fails. The exception thrown by the postauthorization
functionality happens after the transaction manager commits the transaction.

#### 16.1.2 Enabling global method security in your project

You can use global method security with any authentication approach, from HTTP
Basic authentication to OAuth 2.

### 16.2 Applying preauthorization for authorities and roles

To call the getName() method of NameService, the authenticated user needs to
have write authority. If the user doesn't have this authority, the framework
won't allow the call and throws an exception.

When implementing preauthorization, we can use the values of the method
parameters in the authorization rules. In our example, only the authenticated
user can retrieve information about their secret names.

### 16.3 Applying postauthorization

With postauthorization, we don't protect the method from being called, but we
protect the returned value from being exposed if the defined authorization rules
aren't respected.

You can use both @PreAuthorize and @PostAuthorize on the same method if your
requirements need to have both preauthorization and postauthorization.

### 16.4 Implementing permissions for methods

When you need to implement complex authorization rules, instead of writing long
SpEL expressions, take the logic out in a separate class. Spring Security
provides the concept of permission, which makes it easy to write the
authorization rules in a separate class so that your application is easier to
read and understand.

It’s our duty to implement the permission logic. And we do this by writing an
object that implements the PermissionEvaluator contract.

**Using the @Secured and @RolesAllowed annotations**

The @EnableGlobalMethodSecurity annotation offers two other similar attributes
that you can use to enable different annotations. You use the jsr250Enabled
attribute to enable the @RolesAllowed annotation and the securedEnabled
attribute to enable the @Secured annotation.

## 17 Global method security: Pre- and postfiltering

Suppose you don’t want to forbid the call to a method, but you want to make sure
that the parameters sent to it follow some rules. Or, in another scenario, you
want to make sure that after someone calls the method, the method’s caller only
receives an authorized part of the returned value. We name such a functionality
filtering, and we classify it in two categories:

- Prefiltering. The framework filters the values of the parameters before
  calling the method.
- Postfiltering. The framework filters the returned value after the method call.

The client calls the endpoint providing a value that doesn’t follow the
authorization rule. With preauthorization, the method isn’t called at all and
the caller receives an exception. With prefiltering, the aspect calls the method
but only provides the values that follow the given rules.

### 17.1 Applying prefiltering for method authorization

With prefiltering, an aspect intercepts the call to the protected method. The
aspect filters the values that the caller provides as the parameter and sends to
the method only values that follow the rules you define.

With prefiltering, we decouple the authorization responsibility from the
business implementation. The aspect provided by Spring Security only takes care
of the authorization rules, and the service method only takes care of the
business logic of the use case it implements.

When using prefiltering by filterObject, we refer to the objects inside the list
that the caller provides as a parameter. The authentication object is the one
stored after the authentication process in the security context.

The aspect intercepts and changes the collection given as the parameter. You
need to provide a mutable instance of a collection so the aspect can change it.

### 17.2 Applying postfiltering for method authorization

Postfiltering scenario. A client calls an endpoint to retrieve data it needs to
display in the frontend. A postfiltering implementation makes sure that the
client only gets data owned by the currently authenticated user.

In Postfiltering. An aspect intercepts the collection returned by the protected
method and filters the values that don’t follow the rules you provide. Unlike
postauthorization, postfiltering doesn’t throw an exception to the caller when
the returned value doesn’t follow the authorization rules.

In the SpEL expression used for authorization, we use filterObject to refer to
the objects in the returned collection, and we use authentication to refer to
the Authentication instance from the security context.

### 17.3 Using filtering in Spring Data repositories

We have two options:
- Using @PreFilter and @PostFilter annotations
- Directly applying filtering within queries

The anatomy of a bad design. When you need to apply filtering at the repository level, it’s better to first make sure you only retrieve the data you need. Otherwise, your application can face heavy memory and performance issues.

## 18 Hands-on: An OAuth 2 application
