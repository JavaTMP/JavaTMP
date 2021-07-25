# SSL and TLS Spring Boot Module

- Having created discrete secured messages using CMS and S/MIME, it is now time to turn your attention to the issue of
  creating secure links over which you can transfer data and exchange messages.
- This chapter looks at SSL and its offspring, TLS. This family of protocols is very different from protocols like CMS.
  The main reason is that they are socket-based and designed to allow the creation of secured links between two end
  points for data transmission and exchange.
- The SSL API for Java is referred to as the JSSE (Java Secure Socket Extension).

## The SSL and TLS Protocols

- The protocol is an interesting one, as it designed to be extensible. The initial handshake done between two end points
  when they are setting up an SSL channel includes negotiation for both the algorithms to be used and the key size.
- The algorithm set used for an SSL channel normally includes at least one public key mechanism, a symmetric cipher, a
  MAC algorithm, as well as their associated key sizes. This collection of algorithms is normally referred to as a
  cipher suite.
- The Java API that deals with SSL and TLS is the Java Secure Socket Extension, or JSSE for short.

### the keystore creation utility, CreateKeyStores

- creates three keystores, using methods on the Utils class that were defined in previous chapters. The first file is
  for client credentials, the second file contains a single trusted certificate that will be used as the trust anchor
  for (eventually) both ends to validate the X.509 credentials passed to them, and the third keystore contains the
  server credentials.

## A Basic SSL Client and Server

- In the case of an X.509-based cipher suite, this is done by the server presenting the client with a certificate
  chain (the Certificate message) after the client initially connects.
- If the protocol is using RSA, the client then uses the end entity certificate to encrypt an appropriate pre-master
  secret, which it sends back to the server(the ClientKeyExchange message.
- The pre-master secret is then converted by both ends into a master secret, which provides the bits required for a
  symmetric key required for doing encryption on the data and the MACs used for verifying the integrity of the data.
- Both ends start encrypting and communication on the link then proceeds.
- The optional ServerKeyExchange message is there, because SSL includes key agreement in the mechanisms that can be used
  for the client and the server to arrive at an agreed secret. If the server is using key agreement, this message will
  be used to pass the server’s parameters to the client so the necessary calculations can be done on the client side.
- you need to be able to use only four JSSE classes to get this to work. Two of them are factory classes, and the other
  two are socket classes used to represent the end points of the SSL connection.
- The `javax.net.ssl.SSLSocketFactory` is used to create SSLSocket socket objects.
- Like the SSLServerSocketFactory class, it is also possible to create SSLSocketFactory objects using an SSLContext
  object.
- The `javax.net.ssl.SSLServerSocketFactory` is used to create SSLServerSocket socket objects.
- objects of the type `javax.net.ssl.SSLSocket` are not created directly but are created using a factory methods
  on `SSLSocketFactory` objects or as a result of an `SSLServerSocket.accept()` returning.
- The extra methods added by the SSLSocket class can be divided into three categories: methods for basic configuration,
  adding listeners, and configuring client-side authentication.
- The `javax.net.ssl.SSLServerSocket` class is an extension of java.net.ServerSocket, and objects of the SSLServerSocket
  type are created using factory objects of the type SSLServerSocketFactory.

### A Basic SSL Client and Server

- Run CreateKeyStores initially
- Now you can start the SSLServerExample server using the following command that should be entered on one line:
  `java -Djavax.net.ssl.keyStore=server.jks -Djavax.net.ssl.keyStorePassword=serverPassword chapter10.SSLServerExample`
- run the client using the following command:
  `java -Djavax.net.ssl.trustStore=trustStore.jks chapter10.SSLClientExample`

- In the Server Side: The “magic” is the default factory that picks up the values of the system properties you have
  passed to the command line configuring a keystore and the password to be used with it. The keystore is used by the
  default factory implementation to provide the necessary credentials to be used to identify the server to the other end
  of the link.
- In the Client Side:  the “magic is performed by the default factory. It uses the value of the system property you
  passed to the JVM to find a keystore that contains trusted certificates. These trusted certificates allow the default
  factory to validate any credentials, in this case a certificate chain from the server, presented to it.
- The default factories also have a default place to look for the trust store if the command-line setting of the
  `javax.net.ssl.trustStore` property is not specified. I have already mentioned in Chapter 8 that the JVM’s security
  directory contains a file called cacerts that contains a keystore. It is also possible to create a keystore in the
  same directory called jssecacerts, and if the javax.net.ssl.trustStore property is not set, the JVM will first look
  for the jssecacerts file. If the jssecacerts file does not exist, it will use the cacerts file.
- Other properties that can be set for the trust store are `javax.net.ssl.trustStorePassword`, which represents the
  password to be used with the trust store keystore; `javax.net.ssl.trustStoreProvider`, which is the provider used to
  create it; and `javax.net.ssl.trustStoreType`, which is the type of keystore being used as a trust store if it isn’t
  the JVM’s default one. In production, you should use the `javax.net.ssl.trustStorePassword` property, because it will
  force an integrity check on the file. If the trust store you are using is actually a hardware device rather than a
  file, the keystore type you use for the trust store is NONE.
- The properties `javax.net.ssl.keyStoreProvider` and `javax.net.ssl.keyStoreType` can also be used in a similar fashion
  for specifying a source of identifying credentials for a server or a client.
- It is also possible to attach a listener to an SSLSocket so that you can be informed as to when the hand-shake
  calculation has finally been done between the two ends of the link.
-

## Client-Side Authentication

- the SSL protocol enables this by allowing the client to also send back a certificate chain in the Certificate message
  along with the pre-master secret and then sending a signature, the CertificateVerify message, which can be validated
  using the end entity certificate in the client’s certificate chain. The signature is calculated on the data stream
  that represents all the messages that have been exchanged starting from the initial client message. Doing it this way
  is quite useful, as it does not require the client to have a public key that can be used for encryption. Instead, the
  client can also use a range of digital signature specific algorithms as well to authenticate itself.
- As client-side authentication is an option with SSL, introducing it requires you to make use of some addi-tional
  configuration methods. Normally you will just use the ones on the SSLServerSocket class; how-ever, it is also possible
  to customize an SSLSocket object in server mode to use client-side authentication. The next section starts with the
  configuration methods on the SSLServerSocket class.
- The `javax.net.ssl.SSLContext` class is used as a carrier for the credentials and other information associated with
  particular SSL links. You have already used this class indirectly, because the default factory objects are created
  using an SSLContext object, which uses the system properties you were setting to locate the credentials that were used
  to identity the server and the trust store that was used by the client to validate them.

### Introducing Client-Side Authentication

- The first thing you will notice is that most of the changes are on the client class and that they relate to the
  creation of an SSLContext object, which can be used to create the SSLSocket object that the client uses to connect to
  the server process.
- The first thing to do is to start the new server using the following command:
  `java -Djavax.net.ssl.keyStore=server.jks -Djavax.net.ssl.keyStorePassword=serverPassword -Djavax.net.ssl.trustStore=trustStore.jks chapter10.SSLServerWithClientAuthExample`
- Now that the server is running, you can run the new client as well:
  `java -Djavax.net.ssl.trustStore=trustStore.jks chapter10.SSLClientWithClientAuthExample`
- In this case, you haven’t had to set the javax.net.ssl.keyStore properties as you did for the server, because the
  client is providing its own KeyManager objects.
- The second change is the setting of the javax.net.ssl.trustStore parameter on the command line. This needed to be done
  because, otherwise, the server would have tried using one of the default trust store locations and would have been
  unable to validate the client’s certificate chain.

### Using the TrustManagerFactory

- The first thing to do is to start the server as before, using the following command:
  `java -Djavax.net.ssl.keyStore=server.jks -Djavax.net.ssl.keyStorePassword=serverPassword -Djavax.net.ssl.trustStore=trustStore.jks chapter10.SSLServerWithClientAuthExample`
- Next, you should run the client in the other window using
  `java chapter10.SSLClientWithClientAuthTrustExample`
- Because the SSLContext is now initialized with a TrustManager object as well as a KeyManager object, you no longer
  have to set the JVM properties on the command line.

## Managing SSL Session Information

- In addition to connections having a context associated with them, the JSSE also makes it possible to get access to and
  manage session information that is related to the connection taking place. This is done via objects that implement the
  SSLSession interface.

### Using SSLSession

- This example uses the information about a client’s principal in an SSLSession object to restrict connections that can
  be made to the server to only those where the principal the client is using is the one belonging to the example end
  entity certificate.
- you can start the server with just
  `java chapter10.SSLServerWithClientAuthIdExample`
- and run the last client you used with
  `java chapter10.SSLClientWithClientAuthTrustExample`
- As with the client, creating your own SSLContext in the server frees you from having to use command-line property
  setting to provide local identity information and a trust store.

## Dealing with HTTPS

- HTTPS stands for Hypertext Transport Protocol (Secure) and is simply HTTP done over an SSL connection.
- Just as Java provides the HttpURLConnection class in java.net for dealing with regular HTTP connections, the JSSE
  provides a class for dealing with HTTPS connections — HttpsURLConnection.

### Using HttpsURLConnection and HostnameVerifier
- Starting the server is a simple matter of running: `java chapter10.HTTPSServerExample`
- Once the server is running, you can try running the client program as follows: `java chapter10.HTTPSClientExample`
- Next, try using your favorite browser, pointing it at the URL https://localhost:9020. If the browser supports SSL, it will prompt you to see whether you accept the certificate being offered by the server program.
 
## References

- [Transport Layer Security](https://en.wikipedia.org/wiki/Transport_Layer_Security#Protocol_details)
