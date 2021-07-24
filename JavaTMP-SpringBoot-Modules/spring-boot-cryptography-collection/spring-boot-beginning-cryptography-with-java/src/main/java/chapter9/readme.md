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

- CMS signed-data consists of a content holder, zero or more signature structures, and optionally a
  collec-tion of certificates and CRLs that may be associated with the signatures.
- The content holder can contain the data the signature structures were generated for, but it can
  also be empty, indicating that the signed-data message is actually detached and represents
  signatures created for an external data source.
- If there are no signature structures attached to the message, the message exists purely to carry
  the certificates and CRLs it contains — messages of this type are cre-ated when a certificate path
  is encoded in PKCS #7 format.
- Verifying a signature for a given signer is a matter of finding the signature structure that
  matches the signer you are trying to verify for. Once you have a match, the process is one of
  using the source data for the signature to verify the signature value using the public key of the
  signer you have matched.
- As usual, signature values are constructed using a combination of hashing and encryption. The
  recommend hash algorithms for signed-data are defined in RFC 3370.

## CMS Enveloped-Data

- Enveloped-data is constructed by first encrypting the data to be enveloped with a symmetric key
  and then encrypting the symmetric key with the algorithms appropriate for the intended recipients
  of the message
- The enveloped-data message is then the result of encapsulating the encrypted data in the message
  along with the information required for each recipient. When a recipient receives an
  enveloped-data message, the recipient extracts the pertinent recipient information and use it to
  recover the key used to encrypt the data. The recipient can then recover the encrypted data.

### Creating and Decoding CMS Enveloped-Data

### The KEKRecipientInformation Class

- The `org.bouncycastle.cms.KEKRecipientInformation` is the processing class for the second kind of
  recipient(those protected with key-encryption keys. It is also an extension of the
  RecipientInfomation class, and the class provides the necessary functionality to deal with
  enveloped-data where the data encryption key has been encrypted with a key-encryption key (KEK)
  using a symmetric algorithm such Triple-DES or AES, rather than a public key as you saw with the
  KeyTransRecipientInformation class.

### Using Key-Encrypted Keys with Enveloped-Data

- The first difference is, because you are using a symmetric key rather than an asymmetric one, the
  key has no certificates associated with it. To make things easy, you use the KeyGenerator class to
  create the key, but ordinarily you might instead fetch the key from some type of keystore.

## Data Compression in CMS

- The compressed-data content type for CMS is defined separately from RFC 3852 — it is defined in
  RFC 3274. As it does not involve encryption or authentication, it has a simpler ASN.1 structure
  than the others,
- The `org.bouncycastle.cms.CMSCompressedData` class has two general use constructors that can take
  either a byte array or an InputStream representing a binary encoding of a ContentInfo structure
  and the CompressedData structure it contains. `CMSCompressedData` objects can also be created
  using objects of the `CMSCompressedDataGenerator` class.

### Using Compression with CMS

## Secure/Multipurpose Internet Mail Extensions (S/MIME)

- S/MIME, or the Secure/Multipurpose Internet Mail Extensions, defines a method of sending MIME data
  securely. If you have ever received an e-mail that indicated it was signed or encrypted, chances
  are it was an S/MIME message you were looking at.

## S/MIME Signed Messages

- Signed messages in S/MIME can be represented using either single MIME body part messages or MIME
  multipart messages.
- You’ll encounter the MIME multipart message when the data signed has not being encapsulated in the
  signature. In this case the message will be in two body parts, the first part containing the
  contents that was signed and the second part containing the signature.
- When the data is encapsulated or the message is a certificate management message and only created
  to carry certificates, you will receive the message in a single MIME body part.
- In general, for signing data, you should use the multipart format whenever possible. As it is what
  is known as a clear signing technique, it has the advantage that the body part containing the data
  that was signed is readable by anyone, even if they use a MIME processor that is unable to deal
  with the body part containing the CMS signed-data message in the second part.
- The “Content-Type” header in the MIME message will reflect the kind of signed message you are
  looking at. If the MIME type indicated by the header is application/pkcs7-mime, then the body part
  contains either a signature with encapsulated data or a certificate management message. If it is
  an encapsulated data message, the header will also include a smime-type parameter that will be set
  to “signed-data”. If it is a certificate management message, the smime-type parameter will be
  “certs-only”.
- In the case of a multipart message, the MIME type of the body part containing the signature will
  be application/ pkcs7-signature with the smime-type parameter set to “signed-data” and the MIME
  type of the actual multipart will be multipart/signed with a protocol parameter that is set to the
  string “application/pkcs7-signature”.
- in S/MIME, all text is considered to end with CRLF for the purposes of signature calculation. The
  process of treating a text file like this is referred to as CRLF canonicalization.

### Creating and Validating a S/MIME Signed Message

- The encryption key preference attribute indicates which public key you would prefer people to use
  if they are including you in their list of recipients in an enveloped message.

## S/MIME Enveloped Messages

- Unlike S/MIME signed messages, S/MIME enveloped messages are only represented as a single MIME
  body part. The reason is that, as they contain CMS enveloped-data messages, the encrypted data
  that they hold the details for is also carried inside them. You can identify S/MIME enveloped
  messages as their MIME type will be application/pkcs7-mime with a smime-type parameter of
  “enveloped-data”.

### Using S/MIME Enveloped Messages

### Combining Signing with Encryption

- Often you want to sign and encrypt data to produce a single message. In some respects how you do
  this depends a lot on what you are trying to do. If you encrypt then sign, it makes it possible
  for the signa-tures to be checked without decrypting the data — you can reject data without having
  to decrypt it. On the other hand, perhaps you want the signatures to be protected as well.
- Consequently, the normal practice is to sign first and then encrypt.

### Enveloping a Signed Message

- This example first signs a message, envelopes it, and then reverses the process — recovering the
  data and verifying the signature.
- The signing, encryption, decryption, and verification processes are ones you are already familiar with.

## S/MIME Compressed Messages
- Like S/MIME enveloped messages, compressed messages do not have to deal with canonicalization issues, as the data they carry is obscured by the compression. You can identify S/MIME enveloped messages as their MIME type will be application/pkcs7-mime with a smime-type parameter of “compressed-data”.

### Using S/MIME Compression

## References

- [https://cloud.google.com/kms/docs/envelope-encryption](https://cloud.google.com/kms/docs/envelope-encryption)
- [https://docs.microsoft.com/en-us/windows/win32/seccrypto/encoding-enveloped-data](https://docs.microsoft.com/en-us/windows/win32/seccrypto/encoding-enveloped-data)
- [https://docs.microsoft.com/en-us/windows/win32/seccrypto/decoding-enveloped-data](https://docs.microsoft.com/en-us/windows/win32/seccrypto/decoding-enveloped-data)
