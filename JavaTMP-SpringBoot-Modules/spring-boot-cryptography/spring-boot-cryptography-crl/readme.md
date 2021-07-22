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
- The invalidity date provides the date on which it is known, or suspected, that the certificate became
  invalid.
- The certificate issuer extension is used to indicate who the real issuer of a certificate was.
- The version 2 profile for CRLs introduced extensions. They provide extensions that take advantage of X.509 
  certificate extensions.
- The issuingDistributionPoint identifies the distribution point and scope for a particular CRL, and it indicates 
  whether the CRL covers revocation for some factors.
- The freshest CRL extension identifies how delta CRL information can be obtained for the CRL it is found in.

### Creating a CRL
### Building a CRL Using the CertificateFactory

## Online Certificate Status Protocol

## Certificate Path Validation

## Building a Valid Path from a CertStore

## References

- []()
