# Distinguished Names and Certificates Spring Boot Module

- Asymmetric encryption provides ways of allowing you to distribute keys with relative safety that other people can use
  to send encrypted messages or verify signatures you have created.
- Distinguished names and the certificates that carry them were created to solve the problem of determining the owner
  identity.
- Distinguished names contain information about the owner of a public key carried by a certificate.
- Certification requests provide a mechanism by which you can ask some other party, presumably trusted by the people you
  want to give the certificate to, to issue you with a certificate that can also be trusted. In general, this is done by
  issuing a certificate that can be verified using another certificate issued by the trusted party that is already in
  the hands of the people who you want to accept your new certificate.

## Distinguished Names

- The distinguished name, or DN, was originally proposed in X.501 in OSI to describe the X.500 directory structure. with
  each level down a particular branch being identified by a relative distinguished name, or RDN, with the full path
  being described by a distinguished name, or DN, which is made up of a col-lection of the RDNs traversed.
- The most common DN you are likely to have seen is a character string equivalent like the following:

```
"CN=www.bouncycastle.org, OU=Bouncy Castle, O=Legions, C=AU"
```

- The main way to define a DN in Java is using the X500Principal class that can be used to create a Java object
  representing an X.500 DN from an encoding, or from a character string.

### The X500Principal Class

- The javax.security.auth.x500.X500Principal class was introduced in JDK 1.4. It has constructors that allow you to make
  one from either an ASN.1-encoded stream, byte array, or a String.
- Provides two methods for retrieving the DN contained in the object as either a byte array, using getEncoded(), or a
  string using getName().

### X500Principal.getEncoded()

- The getEncoded() method returns the X500Principal’s DER encoding.

### X500Principal.getName()

- The getName() method returns a String representing the DN.

## Public Key Certificates

- Certificates, or to be more specific, public key certificates, provide a mechanism that allows a third party, or
  issuer, to vouch for the fact that a particular public key is linked with a particular owner, or subject.
- Every certificate has a private key associated with it, and a chain of certificates is a list of certificates where
  each certificate other than the first one and the last one have had its private key used to sign the next certificate
  after it.
- The first certificate, the root certificate, is normally self-signed; you have to accept it as trusted for the
  certificate chain to be valid.
- The last certificate, or the end entity certificate, simply provides you with a public key you are interested in,
  which, assuming you accept the root certificate, you can regard as authentic.
- The entity responsible for issuing the certificates is referred to as a certificate authority, or more commonly, a CA.

### The Certificate Class

- The `java.security.cert.Certificate` class provides the basic support for public key certificates.
- It provides the methods for extracting the public key stored in the certificate, identifying the certificate’s type,
  verifying the signature contained in the certificate, and getting an encoded version of the certificate.
- Certificate.getType()
- Certificate.getPublicKey()
- Certificate.verify()
- Certificate.getEncoded()

## X.509 Certificates

- There are still a lot of X.509 version 1 certificates in use, especially for self-signed root certificates. You will
  find version 3 certificates for virtually all other applications.
- The fundamental classes are the X509Certificate class and the X509Extension interface that’s implemented by the
  X509Certificate class. The X509Extension interface supports the use of version 3 extensions.
- The `java.security.cert.X509Certificate` Class
- an X.509 certificate is simply a sequence with three fields in it. tbsCertificate, AlgorithmIdentifier, signatureValue
- the tbsCertificate field contains the data that was used to generate the signature represented in the signatureValue
  field using the algorithm given by the details contained in the AlgorithmIdentifier field
- the TBSCertificate structure contains the details of the issuer of the certificate as well as information on who it
  was issued for

### X509Certificate.getTBSCertificate()

- The getTBSCertificate() method returns the bytes making up the ASN.1 encoding of the TBSCertificate structure.
- These are the bytes that are used as the input data for calculating the signature the certificate carries, so if you
  wanted to verify a certificate signature using the Signature class, you could do so using the public key of the
  certificate issuer and the bytes returned by getTBSCertificate().
- Main columns are: version, serialNumber, signature, issuer, validity, subject , subjectPublicKeyInfo , issuerUniqueID
  , subjectUniqueID , extensions

### X509Certificate.getVersion()

### X509Certificate.getSerialNumber()

### X509Certificate.getIssuerX500Principal()

### X509Certificate.getNotBefore() and X509Certificate.getNotAfter()

### X509Certificate.checkValidity()

### X509Certificate.getSubjectX500Principal()

### X509Certificate.getIssuerUniqueID()

### X509Certificate.getSubjectUniqueID()

### X509Certificate.getSignature()

- The getSignature() method returns the bytes making up the signature stored in the BIT STRING contained in the
  signatureValue field. These bytes are suitable for verification with a java. security.Signature class.

### X509Certificate.getSigAlgOID() and X509Certificate.getSigAlgParams()

- The contents of the signatureAlgorithm field and the signature field will always be equal in a valid certificate

### X509Certificate.getSigAlgName()

### Creating a Self-Signed Version 1 Certificate

### Creating a Self-Signed Version 1 Certificate using X509v1CertificateBuilder

### X.509 Extensions

- The extensions field in the TBSCertificate structure was added with the release of X.509 version 3. As you can see
  from the original definition of TBSCertificate, it is optional, explicitly tagged, and of the type Extensions.
- The X509Extension interface provides some basic methods for investigating the extensions that are present in an X.509
  certificate. It allows you to find out which extensions are critical and which are not, to get the value for a
  particular extension, and, finally, to check if there are any extensions that are unsupported by the profile the
  extension was created in.

### Creating a Self-Signed Version 3 Certificate

## Reading and Writing Certificates

- There are two principal encodings used for reading and writing individual certificates: native DER format and the PEM
  format, which is described in some early RFCs on securing e-mail, RFC 1421 to RFC 1424, which were about Privacy
  Enhanced E-mail. The PEM format is basically a base 64-encoded version of the DER encoding with an ASCII header and
  footer attached.
- Getting the DER encoding of a certificate is easy — just call the Certificate.getEncoded() method on the certificate
  object. Writing PEM-encoded certificates is not directly supported in the JCA, but the Bouncy Castle APIs include a
  class for generating them called the PEMWriter.

### Using the CertificateFactory Class

### Reading Multiple Certificates

## Certification Requests

- A certification request is a structure that is supplied to a CA, giving the CA the details that a key owner wants to
  appear in a certificate the owner wants the CA to create.
- the public key contained in the subjectPKInfo object inside the CertificationRequestInfo structure is always the key
  that is used to verify the signature. This means the owner of the private key corresponding to the public key in the
  CertificationRequestInfo structure must have been the one who created the signed request.
- The challengePassword attribute is used to send the CA a password that can be used to request revocation of the
  certificate being issued.

### Creating a Certification Request

- the PEM encoding is simply a base 64 encoding of the DER encoding of the certifica-tion request structure between a
  header and footer.
- The basic information required to go into a certification request is the public key it is meant to contain and the
  X.500 name of the owner of the public key. The request needs to be signed using the private key corresponding to the
  public key, and a signature algorithm needs to be specified.

### Adding Extensions to a Certification Request

## Writing a Simple Certificate Authority

- Now you will look at taking a certification request and using it and an existing root certificate to generate a new
  certificate.
- Creating a certificate with a signature that can be verified by another certificate creates a relationship between the
  two certificates that is normally expressed in terms of a certificate path or a certificate chain, and the validation
  of these certificate paths is one of the things that various profiles concern themselves with. In Java terms the
  simplest way to think of a certificate path is as an array of certificates, with the first certificate in the array
  being the end entity certificate, whose signature can be verified by the next certificate in the array, and the last
  certificate in the array is the root certificate, which is normally self-signed and has to be accepted on trust.
- In X.509 terms there are a couple of steps to finding out which certificate has signed which. First you would expect
  if one certificate can be used to verify another one, that same certificate will have a subject that is equal to the
  issuer on the certificate being verified. Second, you would obviously expect that, given that the subject of any
  certificate is the issuer of another, the key on the first certificate will validate the signature on the second.

### Creating a Certificate from a Certification Request

- After the extensions are parsed and added in the certification request, the resulting certificate chain, consisting of
  the root certificate and the client certificate, is printed out. In the normal course of events this is what would be
  sent by the CA to the client; the only difference is that in the real world, clients would never need to expose their
  private keys. The CA would also normally use the same private key and root certificate for signing a number of
  certificates and may have a number of intermediate certificates resulting in a certificate path, or chain

## Certificate Paths and Stores

- Dealing with collections of certificates that are dependent on each other in some ways is the rule rather than the
  exception, and the JCA has two classes that can help you read, manipulate, and analyze collections of certificates.
- The first one, the `CertPath` class, provides you with a more useful alternative to using arrays for representing
  certificate chains that supports encoding and can be used with the path validation classes.
- The other one, the `CertStore` class, provides you with a collection class that can be searched in a variety of ways
  using implementations of a selection interface CertSelector.
- The `java.security.cert.CertPath` class provides a carrier for certificate chains, or paths. Objects of the class are
  not created directly; instead, you use one of the `CertificateFactory.generateCertPath()` methods.
- The `CertPath.getType()` method returns the type of the certificate contained in the CertPath. In this situation you
  would expect this to be “X.509”, but there are other proposals out there, so this may change.
- The `CertPath.getCertificates()` method returns an immutable, possibly empty, list of certificate objects representing
  the certificates making up the certificate path.
- One of the purposes of the `CertStore` class is used as a means to provide access to certificates through the
  provider-based architecture in the JCA.
- the `CertStore.getCertificates()` method provides a mechanism for arbitrarily searching for and retrieving
  certificates from a CertStore object.
- The `CertStore.getCertificates()` method is used by invoking it with an object implementing the CertSelector interface
  as a parameter. It is the object implementing CertSelector that is used by the CertStore to determine which
  certificates are being searched for.
- The JCA provides an implementation of CertSelector that can be used for retrieving X509Certificate objects from a
  CertStore. The class that provides this implementation is the X509CertSelector class.
- The java.security.cert.X509CertSelector class provides an implementation of the CertSelector interface that allows you
  to search a CertStore for certificates that match on a variety of X.509-related fields.
- Certificates provide you with a mechanism of publishing your identity, and by allowing for certificate chains, or
  paths, you are able to get others to vouch that a certificate you want them to accept is recognized by someone they
  trust. The problem then becomes what do you do if the private key on the certificate you have issued is compromised

### Using a CertStore and a X509CertSelector

### Writing a CertPath

## References

- [BC "Version 2" The post BC 1.46 changes](https://github.com/bcgit/bc-java/wiki/BC-%22Version-2%22---The-post-BC-1.46-changes)
- []()
