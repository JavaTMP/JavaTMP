# Java Web Services Tutorial
Web Services work on client-server model where they communicate over 
the network. 
Server side component provides the `endpoint` URL where service 
is located and client application can `invoke` different methods.

There are two types of web services:
- SOAP Web Services
- Restful Web Services

In this JAX-WS tutorial, we will use `JAX-WS` to create SOAP based web services. 
But first we will go through some web services words used 
in SOAP web services.
- SOAP
    - SOAP stands for Simple Object Access Protocol. 
    - SOAP is an XML based industry standard protocol 
    for designing and developing web services.
- WSDL
    - WSDL stands for Web Service Description Language. 
    - WSDL is an XML based document that provides technical details 
    about the web service. 
    - Some useful information in WSDL document are: method name, 
    port types, service end point, binding, method parameters etc.
- UDDI
    - UDDI is acronym for Universal Description, Discovery and Integration. 
    - UDDI is a directory of web services where client applications 
    can lookup for web services. 
    - Web Services can register to the UDDI server and make them 
    available to client applications.
- JAX-WS
    - JAX-WS stands for Java API for XML Web Services. 
    - JAX-WS is XML based Java API to build web services server and client application. 
    - It’s part of standard Java API, so we don’t need to include anything else which working with it.
    
## Advantages of Web Services
- Interoperability: Because web services work over network and use XML technology to communicate, 
it can be developed in any programming language supporting web services development.
- Reusability: One web service can be used by many client applications at the same time. 
For example, we can expose a web service for technical analysis of a stock and it can be used by all 
the banks and financial institutions.
- Loose Coupling: Web services client code is totally independent with server code, 
so we have achieved loose coupling in our application. This leads to easy maintenance and easy to extend.
- Easy to deploy and integrate
- Multiple service versions can be running at same time.

## JAX-WS Example
- Create a web service that will expose methods to add, delete and get person objects. 
So first of all we will create a model bean for our data.
- Create an interface where we will declare the methods we will expose in our JAX-WS example web services.
- We use the `@WebService` and `@SOAPBinding` annotations from JAX-WS API. 
- We can create SOAP web services in RPC style or Document style. 
- We can use any of these styles to create web services, 
the different is seen in the way WSDL file is generated.
- The `@WebService` annotation where we are providing endpointInterface value as the interface 
we have for our web service. 
This way JAX-WS know the class to use for implementation when web service methods are invoked.
- Publish your business services using JAX-WS Endpoint class.
- Just run a program and your web service will be published at the given endpoint in the program. 
We can access it’s WSDL document by adding `?wsdl` to the endpoint url.
- A client program where we are invoking our JAX-WS example web service.
- web services just expose WSDL and third party applications don’t have access to these classes. 
So in that case, we can use wsimport utility to generate the client stubs.
This utility comes with standard installation of JDK.

```
wsimport -s . [URL or wsdl file]
```

- copy classes into your client project, the only change would be the way we get service instance.


