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

## Certification Requests

## Writing a Simple Certificate Authority

## Certificate Paths and Stores

## References

- []()
