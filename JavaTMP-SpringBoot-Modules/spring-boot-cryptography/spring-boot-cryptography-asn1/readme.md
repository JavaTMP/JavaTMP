# Object Description in Cryptography Using ASN.1 Spring Boot Module

- in order for communication to take place, require two implementations to have the same idea about how algorithms are
  implemented as well as have a common language for exchanging required parameter information for those algorithms.
- ASN.1, which is a language designed for just this purpose.
- ASN.1 binary encoding can be used with the Java APIs for encoding AlgorithmParameters
- Public and private keys can be encoded as ASN.1 objects and re-created later

## What Is ASN.1?

- Abstract Syntax Notation 1, or ASN.1 provides a standard notation for use in specifying protocols that was concise in
  its encoding. It describes key encodings, secure protocols, and algorithm parameters.
- The PKCS standards and the PKIX RFCs, uses ASN.1 somewhere.

## Basic ASN.1 Syntax

- There are three things you need to be able to recognize when you are trying to read an ASN.1 module:
    - Comment syntax
    - Object identifiers
    - The module structure

### Comment Syntax

- As with Java, there are two commenting styles used in ASN.1, one for block comments, which are delimited by /* and */,
  and one for single-line comments, which start with “--” and end with “--”.

### Object Identifiers

- Object identifiers, or OIDs for short, provide a unique handle for an object or ASN.1 module
- For example, the RSA Security algorithm that you are using when you call Signature.getInstance() with “SHA256withRSA”
  has an object identifier associated with it that goes like this :

```asn1
iso(1) member-body(2) us(840) rsadsi(113549) pkcs(1) pkcs-1(1) 11
```

- this OID would be seen as “1.2.840.113549.1.1.11”,
- The only complication is that, because OIDs are based around organization rather than subject, in some cases you will
  notice the same cryptographic algorithm will be referred to by different OIDs.

### The Module Structure

- A module is typically structured along the following lines:

```
ModuleName { ObjectIdentifier } 
DEFINITIONS Tagging TAGS ::= 
BEGIN 
EXPORTS export_list ; 
IMPORTS import_list ;
body 
END
```

- ModuleName and ObjectIdentifier have values that are used to identify the module being described.
- For example, the module defined in RFC 3161 (Time-Stamp Protocol) starts as follows:

```
PKIXTSP {iso(1) identified-organization(3) dod(6) internet(1) security(5) mechanisms(5) pkix(7) id-mod(0) id-mod-tsp(13)}
```

- This tells you the name of the module is PKIXTSP and that it is associated with an object identifier, which in its
  basic form will be 1.3.6.1.5.5.7.0.13.
- Tagging tells you the tagging environment for the module. you can expect to see one of IMPLICIT, EXPLICIT, or
  AUTOMATIC. If no tagging environment is specified, as in the TAGS ::= is missing altogether, you can assume tagging is
  EXPLICIT. In the case of RFC 3161, you will see the following:

```
DEFINITIONS IMPLICIT TAGS ::=
```

- The export_list is the list of types that this module defines that other ASN.1 modules can import. If EXPORTS is
  missing altogether, it means that everything defined in the module can be imported by another one. If you see the
  export list missing—that is, you just see `EXPORTS ;` — it means nothing is available for export.
- The import_list is the list of types that are being imported into the module and where they are from.
- An example of an import list, also from RFC 3161, is as follows:

```
IMPORTS 
    Extensions, AlgorithmIdentifier FROM PKIX1Explicit88 {iso(1) identified-organization(3) dod(6) internet(1) security(5) mechanisms(5) pkix(7) id-mod(0) id-pkix1-explicit-88(1)}
    GeneralName FROM PKIX1Implicit88 {iso(1) identified-organization(3) dod(6) internet(1) security(5) mechanisms(5) pkix(7) id-mod(0) id-pkix1-implicit-88(2)}
    ContentInfo FROM CryptographicMessageSyntax {iso(1) member-body(2) us(840) rsadsi(113549) pkcs(1) pkcs-9(9) smime(16) modules(0) cms(1)}
    PKIFreeText FROM PKIXCMP {iso(1) identified-organization(3) dod(6) internet(1) security(5) mechanisms(5) pkix(7) id-mod(0) id-mod-cmp(9)} ;
```

- As you can see, the component imports just follow a format of

```
import_item FROM source
```

- where import_item is the type, or value, being imported and source is the name and OID for the module where
  import_item has been defined.
- Note the semicolon on the end of the collection of imports; it terminates the IMPORTS statement.

- Now consider body.

```
id-ct-TSTInfo OBJECT IDENTIFIER ::= { iso(1) member-body(2) us(840) rsadsi(113549) pkcs(1) pkcs-9(9) smime(16) ct(1) 4} 
TSAPolicyId ::= OBJECT IDENTIFIER
```

- The first line defines a value. In this case, it is saying id-ct-TSTInfo is of the type OBJECT IDENTIFIER and has the
  OID value 1.2.840.113549.1.9.16.1.4. Looking at the line also gives you the basic syntax for ASN.1 value definitions:

```
name type ::= value
```

- where name is the name you want to refer to value with, type is the type of the value, and then value is specified in
  whatever notation is appropriate for the particular type given by type.
- The second definition defines a new type that can be used in the module. What it is saying is that where you see
  TSAPolicyId, you are looking at a special case of OBJECT IDENTIFIER. As you can probably see, the basic syntax is

```
newType ::= type
```

- where newType is the new type being created and type is the existing type it is based on.
- ASN.1 names can consist of upper-and lowercase letters, numbers, and dashes
  (the “-” character). Like any language, there are also a couple of conventions for creating names. Module names and
  type names all start with uppercase letters, whereas names for everything else start with lowercase letters.

## ASN.1 Types

- ASN.1 types fall into three categories: simple types, string types, and structured types.
- The structured types consist of two container types—SEQUENCE and SET—that allow you to build complex structures using
  all the categories of type.

### Simple Types

- The simple types in ASN.1 are
    - BOOLEAN
    - ENUMERATED
    - INTEGER
    - NULL
    - OBJECT IDENTIFIER
    - UTCTime
    - GeneralizedTime

- ENUMERATED is a special case of INTEGER that can be used to represent signed integers of any magnitude.

### Bit String Types

- The two bit string types are BIT STRING and OCTET STRING.
- BIT STRING allows you to store an arbitrary string of bits of an arbitrary length.
- OCTET STRING allows you to store a string of octets and maps quite nicely onto a Java byte array

### Character String Types

- ASN.1 has many character string types, almost all of which appear in some standard or another. The character string
  types are as follows:
    - BMPString
    - GeneralString
    - GraphicString
    - IA5String
    - NumericString
    - PrintableString
    - TeletexString (T61String)
    - UniversalString
    - UTF8String
    - VideotexString
    - VisibleString

### Structured Types

- ASN.1 has two structured types: SEQUENCE and SET.
- You will also see these used as SEQUENCE OF and SET OF. When you see the OF keyword, the SET or SEQUENCE will only
  contain ASN.1 objects of the type specified afterwards. For example:

```
Counters ::= SEQUENCE OF INTEGER 
```

- indicates that an object of type Counters contains only 0, or more, ASN.1 objects of type INTEGER.
- As for the difference between a SEQUENCE and a SET: A SEQUENCE specifies the order of its components in its
  declaration, whereas a SET is an unordered collection. For example:

```
DigestInfo ::= SEQUENCE {
    digestAlgorithm AlgorithmIdentifier, 
    digest OCTET STRING 
}
```

- tells you that an ASN.1 object of type DigestInfo is a sequence with two elements, the first of which is an
  AlgorithmIdentifier, the second an OCTET STRING. On the other hand, if you created a similar example for a SET, as in:

```
InfoSet ::= SET {
    digestAlgorithm AlgorithmIdentifier, 
    digest OCTET STRING 
    }
```

- it just means you will find the two component types in the SET, but not necessarily in that order. For the most part,
  uses of SET will look like this:

```
attrValues SET OF AttributeValue 
```

### Type Annotations

- Two annotations can be applied to types. One is OPTIONAL, which when applied to a field means it can be left out
  totally. The other is DEFAULT, which specifies the value for field if it is not present.
- You will see both of these in the context of SEQUENCE and SET objects, for example:

```
VersionedData ::= SEQUENCE {
    version INTEGER DEFAULT 0,
    data OCTET STRING OPTIONAL 
    }
```

- DEFAULT tells you that the value may be left out of the encoding of the SEQUENCE. If it is, you should set the value
  of the version field in whatever Java object you are representing your VersionedData object with the value 0.

### Tagging

- Every encoding of a standard ASN.1 type has a default tag value of one octet already, which serves the purpose of
  allowing someone parsing a byte stream containing ASN.1-encoded objects to work out how to interpret the bytes
  following.
- In addition to the predefined tag values, ASN.1 also allows the users to specify their own tag values. The syntax used
  to specify a tagged type in ASN.1 follows the pattern:

```
  [(class) number] (TagStyle) Type
```

#### EXPLICIT Tagging

- If you see nothing in the definition’s block of an ASN.1 module, or you see

```
DEFINITIONS EXPLICIT TAGS ::=
```

- then the default tagging style for that module is EXPLICIT. You might also see something like this:

```
encodedKey [1] EXPLICIT OCTET STRING
```

- which means regardless of the default tagging for the module, encodedKey is an explicitly tagged OCTET STRING with the
  tag value 1.

#### IMPLICIT Tagging

- Often you will see

```
DEFINITIONS IMPLICIT TAGS ::=
```

at the start of an ASN.1 module. If you see this, it means that the tagging style in the module is IMPLICIT. You may
also see a declaration like

```
keyEncoded [1] IMPLICIT OCTET STRING 
```

This also indicates that you are looking at an IMPLICIT tag.

#### AUTOMATIC Tagging

- it means that everything in a SEQUENCE or SET is automatically tagged, with the first element tagged as 0.
-

### CHOICE

- The CHOICE type indicates that the ASN.1 field, or variable, will be one of a group of possible ASN.1 types or
  structures.

### CLASS

- The CLASS type was introduced in 1994

## Encoding Rules

- There are currently five encoding methods recognized for encoding ASN.1 objects into streams of bytes:
    - BER encoding includes the Basic Encoding Rules.
    - DER encoding includes the Distinguished Encoding Rules.
    - CER encoding includes the Canonical Encoding Rules.
    - PER encoding includes the Packed Encoding Rules.
    - XER encoding includes the XML Encoding Rules.

### BER Encoding
- BER encoding follows the tag-length-value (TLV) convention.
- A tag is used to identify the type, a value defining the length of the 
  content is next, and then the actual value of the content follows.
- BER encoding offers three methods for encoding an ASN.1 object:
    - Primitive definite-length
    - Constructed definite-length
    - Constructed indefinite-length
  
#### The Primitive Definite-Length Method
- The definite-length methods all require that you know the length of what you are trying to encode in advance.

#### The Constructed Definite-Length Method
- Length octets in this case are generated the same way as for the primitive
  definite-length method, but the initial byte in the tag associated with any
  object encoded in this fashion will have bit 6 set, indicating the encoding
  is of the constructed type.

#### The Constructed Indefinite-Length Method
- Unlike the previous two methods, the constructed indefinite-length method
  does not require you to know the length of the encoding you are trying to
  construct in advance.

### DER Encoding
- The Distinguished Encoding Rules, or DER, are so called because they make
  identical data within identical ASN.1 definitions reduce to identical binary
  encodings.
- DER encoding is the most common form of encoding you will encounter, 
  and it is also the simplest to per-form.

## The Bouncy Castle ASN.1 API
- The Bouncy Castle ASN.1 API evolved to deal with the ASN.1 binary encoding
  and binary decoding requirements of the other Bouncy Castle APIs and 
  the provider implementation.
- The main package for the API is `org.bouncycastle.asn1`

### Creating the Basic ASN.1 Types
- The root object for all the simple types, bit string types, 
  and structured and tagged types is DERObject.

### Dealing with Tagging 
- if an object is implicitly tagged, the actual tag the object is meant to 
  have is implicit from the context in which its encoding appears.

### Defining Your Own Objects
- The first thing you can notice is the presence of tagging.

### Analyzing an Unknown Encoded Object
- The API also provides a general-purpose class that allows you to get a, more or less, human-readable
  dump of an ASN.1-encoded object.
  
## Using ASN.1 in Java: Some Real Examples
- Encoding an IV with ASN.1
- Encoding PSS Signature Parameters
- Encoding Public and Private Keys
- Using the X509EncodedKeySpec
- Using EncryptedPrivateKeyInfo and PBE

## References

- [https://letsencrypt.org/docs/a-warm-welcome-to-asn1-and-der/](https://letsencrypt.org/docs/a-warm-welcome-to-asn1-and-der/)
