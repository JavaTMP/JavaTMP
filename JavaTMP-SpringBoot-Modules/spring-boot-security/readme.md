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
- 
