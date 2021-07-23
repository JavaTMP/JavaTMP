# Certificate Revocation and Path Validation Spring Boot Module

- X.509 digital certificates provide you with standardized formats that allow you to link public keys with particular
  entities in an otherwise device-independent fashion.
- Certificate paths, or chains, provide a mechanism that allow you to recognize a given entity as trusted providing you
  trust the parties involved in creating the validation certificates leading up to that of the entity.

## Certificate Revocation Lists

- The original method for dealing with certificate revocation was to use certificate revocation lists, or CRLs. The
  concept is a fairly simple one to understand. In addition to the root certificate you are using to validate
  certificates that come your way, you have a CRL for the root certificate that contains a list of the certificates
  issued for that root certificate that have, for one reason or another, been revoked.
- CRLs are distributed by a server and held by the client that needs them to check certificates.
- As well as providing a blacklist of certificates, a CRL is also said to have a particular scope, and it is the scope
  that defines what certificates can end up in a CRL.
- So, using CRLs to determine whether a given certificate is revoked involves finding a CRL of the correct scope and
  seeing if the certificate is present in it. The most general way of doing this in the JCA is provided by the CRL class
  in the java.security.cert package.
- The CRL class provides a high-level abstraction of a certificate revocation list. It is a very simple abstract class
  with only a few methods on it.
- The isRevoked() method takes a single Certificate object as a parameter and returns true if the certificate is present
  in the CRL.

## X.509 Certificate Revocation Lists

- Given a X.509 certificate, there are a couple of ways you might locate a valid CRL for it: It might be given to you,
  or the X.509 certificate may contain a CRL distribution points extension that gives you information on where to find
  the certificate.
- The `java.security.cert.X509CRL` class provides the basic support for X.509 CRLs in the JCA
- The X509CRLEntry class provides a type-safe way of representing the three fields contained in the SEQUENCE OF SEQUENCE
  contained in the revokedCertificates field in the TBSCertList.
- The reason code extension is used to indicate the reason why the certificate has ended up in the CRL
- The hold instruction code allows a certificate to be temporarily suspended, rather than revoked.
- The invalidity date provides the date on which it is known, or suspected, that the certificate became invalid.
- The certificate issuer extension is used to indicate who the real issuer of a certificate was.
- The version 2 profile for CRLs introduced extensions. They provide extensions that take advantage of X.509 certificate
  extensions.
- The issuingDistributionPoint identifies the distribution point and scope for a particular CRL, and it indicates
  whether the CRL covers revocation for some factors.
- The freshest CRL extension identifies how delta CRL information can be obtained for the CRL it is found in.

### Creating a CRL

### Building a CRL Using the CertificateFactory

- The java.security.cert.X509CRLSelector class provides an implementation of the CRLSelector interface that allows you
  to search a CertStore for CRLs that match on a variety of X.509 related fields.
- The X509CRLSelector provides a range of set() methods, each of which can be used to provide values to be matched
  against in a X.509 CRL.

### Retrieving a CRL from a CertStore

## Online Certificate Status Protocol

- is an answer to the online method for working out the revocation status of a certificate.
- an OCSP server, or responder, provides real-time responses to client queries about the status of certificates.
- The `org.bouncycastle.ocsp.CertificateID` class provides a high-level implementation of the CertID structure that
  appears in RFC 2560.
- The CertID structure is used to uniquely identify certificates that are the subject of an OCSP request or response
- Objects of the type CertificateID are constructed directly using a String representing the hash algorithm, an issuer
  certificate, and the serial number of the certificate of interest.
- the `org.bouncycastle.ocsp.OCSPReq` object provides the data structure that must be filled in to produce a valid OCSP
  request.
- The `OCSPReq.isSigned()` method returns true if the OCSP request has been signed. Signing of an OCSP request is purely
  optional, unless it is mandated by the OCSP responder you want to talk to.
- an OCSP client may specify the response types it understands. It can do this by including the acceptable response
  types extension in the requestExtensions field of its request and an AcceptableResponses structure as the extension
  value.
- In some cases an OCSP responder may be able reroute requests to another OCSP responder, which is known to be
  authoritative from information in the certificate being checked.

### OCSP Request Generation

### The OCSPResp Class

- The `org.bouncycastle.ocsp.OCSPResp` class is an implementation of the ASN.1 type OCSPResponse defined in RFC 2560. As
  its name implies, the OCSPResponse object provides the data structure that defines a valid OCSP response.
- The OCSPResp class is normally constructed using a byte array representing the DER encoding of the OCSP response or,
  if you are an OCSP responder, using an object of the type OCSPRespGenerator.
- Basic OCSP responders return a DER encoding of a BasicOCSPResponse structure in the response field of the
  ResponseBytes structure.

### The BasicOCSPResp Class

- Other than obtaining a BasicOCSPResp object using the getResponseObject() method on an OCSPResp object, if you are an
  OCSP responder, an object of the type `org.bouncycastle.ocsp.BasicOCSPResp` can also be created using a generator
  class

### OCSP Response Extensions

- Response extensions can appear in both the responseExtensions field in the TBSResponse structure and the
  singleExtensions field. Apart from the nonce extension, which you have already seen and should be included in the
  responseExtensions field of any response to a request that contained a nonce extension, there are several other
  extensions that you can use in responses.
- In some cases, such as for auditing purposes, it can be useful for the OCSP responder to specify the CRL it found a
  revoked or “on hold” certificate on. This information will be included in the singleExtensions field of the
  SingleResponse the CRL is associated with, and the CRL may be specified using the URL at which the CRL is available,
  the CRL number, or the time at which the relevant CRL was created.

### Generating an OCSP Response

## Certificate Path Validation

- Certificate path validation algorithms are provided to make sure the certificate is valid in addition to verifying the
  signature on the certificate, path validation algorithms also verify that the extensions are appropriate and that if
  any are critical, they have been correctly processed.
- The certificate you are prepared to trust is also often referred to as a trust anchor.
- The `java.security.cert.TrustAnchor` class provides a container for a public key that you have to trust in order to be
  able to validate a certificate path.
- There are three constructors for the TrustAnchor class. All of them can be supplied with optional name constraints via
  a byte array containing the DER-encoded value of a X.509 NameConstraints extension structure. After that, it is a
  question of whether you want to make use of a certificate containing the pub-lic key and use the constructor that
  takes an X509Certificate, or if you have to use the public key and an identifying X.500 Name to identify the trust
  anchor instead.
- The `java.security.cert.PKIXParameters` class implements the `java.security.cert.CertPathParameters` interface
- The `java.security.cert.CertPathValidator` class is another JCA class whose implementation is provider-based and is
  constructed using the getInstance() factory pattern.
- The `java.security.cert.PKIXCertPathValidatorResult` class contains methods that allow you to get all the possible
  outputs of the PKIX certificate path validation algorithm.

### Validating a Certificate Path

### The PKIXCertPathChecker Class

- The `java.security.cert.PKIXCertPathChecker` class provides you with the ability to introduce your own forms of
  validation, or other processing, into a CertPathValidator implementation provided by a JCA services provider.
- `PKIXCertPathChecker` objects are passed to CertPathValidator implementations using calls to the addCertPathChecker()
  method or a call to the setCertPathCheckers() method on the PKIXParameters object.

### Using a PKIXCertPathChecker

## Building a Valid Path from a CertStore

- certificate chains do not arrive well ordered and a collection of certificates and CRLs that arrive with a particular
  message may even include certificates and CRLs that are not relevant to the particular certificate you are trying to
  verify.
- the JCA includes a certificate path builder that works in conjunction with the CertPathValidator to allow you to
  easily create the certificate path that gets you from the root certificate you trust to the end entity certificate you
  are trying to validate.
- The class for doing this is the `CertPathBuilder` that returns an object implementing a `CertPathBuilderResult`, an
  interface that provides a single method, `getCertPath()`, which allows you to retrieve the constructed `CertPath`
  object.
- Objects of the `java.security.cert.CertPathBuilder` class has a single `build()` method that will construct a
  validated `CertPath` from the parameter information it is provided.
- The `build()` method takes a class implementing the `java.security.cert.CertPathParameters` interface and returns a
  `java.security.cert.CertPathBuilderResult`.
- the most important class of `java.security.cert.CertPathParameters` interface is the one supplied with the JCA, the
  `PKIXBuilderParameters` class.
- The `java.security.cert.PKIXBuilderParameters` is an extension of the `PKIXParameters` class
- It adds one extra set() method, `setMaxPathLength()`, which takes a single int as a parameter and limits the number of
  non-self-issued certificates that can be put into a path. The main addition the PKIXBuilderParameters class makes to
  the `PKIXParameters` class it extends is in the manner of its construction.
- In addition to the trust anchors required to construct the `PKIXParameters`, the `PKIXBuilderParameters` also takes a
  `CertSelector` specifying the target constraints for the end entity certificate the path is to be built to.
- Using the extra information the target constraints provide, the `CertPathBuilder` then tries to construct a valid path
  leading from the end entity certificate to one of the trust anchors that the `PKIXBuilderParameters` indicates the
  caller of the `build()` method is prepared to trust.

## Summary

- In this chapter, you looked at the fundamentals of dealing with the validation and verification of X.509 certificates
  using the PKIX profile outlined in RFC 3280.
- 
## References

- []()
