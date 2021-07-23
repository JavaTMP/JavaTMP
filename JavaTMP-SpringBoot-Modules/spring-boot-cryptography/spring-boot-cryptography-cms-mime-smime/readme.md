# CMS and S/MIME Spring Boot Module

- the secure messaging standards known as Cryptographic Message Syntax (CMS) and a related standard
  built on top of CMS for processing MIME messages securely — S/MIME.

## Cryptographic Message Syntax

- Cryptographic Message Syntax, or CMS, provides an encapsulation syntax for data that is encrypted
  or signed. A feature of it is that it allows different types of protection mechanisms to be
  nested(a signed message can then be used as the plaintext for an encrypted one, or an encrypted
  one can be signed.
- Signed messages can also have attributes attached to them that can be included in the final
  signature. It’s an important protocol because not only is it used by itself, but it also forms the
  basis of other protocols such as those used by S/MIME and its variants, such as AS2 (Applicability
  Statement 2) and RosettaNet.
- In the Bouncy Castle APIs, there are two packages devoted to CMS: `org.bouncycastle.cms` contains
  the high-level classes that handle the creation of messages involving encryption, signing, and
  compression, as well as their processing; and `org.bouncycastle.asn1.cms` is a collection of
  low-level classes that provide Java object equivalents for the ASN.1 structures defined in the CMS
  ASN.1 module.
- The basic structure in CMS is the `ContentInfo` object.
- four types that can be contained in a ContentInfo object: Data, SignedData, EnvelopedData, and
  CompressedData.
- The fundamental content type in CMS is the `Data` content type.
- The `org.bouncycastle.CMSProcessable` interface provides the means for introducing a stream of
  data into the CMS classes, in some ways providing a Java equivalent to the Data content type.
- CMS signed-data consists of a content holder, zero or more signature structures, and optionally a
  collec-tion of certificates and CRLs that may be associated with the signatures.
- CMS signed-data is created by wrapping a SignedData structure in a ContentInfo structure with the
  contentType field set to the OID id-signedData.
- When the value id-signedData is found in the contentType field of a ContentInfo structure, the
  value present in the content field will be a sequence of predefined attributes.
- The Java equivalent for the structure is represented by the `CMSSignedData` class in
  the `org. bouncycastle.cms` package. As the CMSSignedData class abstracts some of the internals of
  the SignedData structure.
- Most signatures you deal with will be what are commonly referred to as detached or external
  signatures, where the signature and the data the signature is for are separate. When the data is
  contained in the sig-nature, the data plus signature is referred to as encapsulated signed data.
- The certificates and crls fields have the types CertificateRevocationLists and CertificateSet
  respectively.
- The `org.bouncycastle.cms.SignerInformation` class provides the Java equivalent to the SignerInfo
  objects.
- The `org.bouncycastle.cms.SignerInformatiomStore` class is a simple collection class for
  containing SignerInformation objects.
- The `org.bouncycastle.cms.CMSSignedData` class has four public constructors for general use.

### Creating and Validating a Detached Signature

## CMS Signed-Data

## CMS Enveloped-Data

## Data Compression in CMS

## Secure/Multipurpose Internet Mail Extensions (S/MIME)

## S/MIME Signed Messages

## S/MIME Enveloped Messages

## S/MIME Compressed Messages

## References

- []()
