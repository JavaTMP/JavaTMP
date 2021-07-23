# Key and Certificate Management Using Keystores Spring Boot Module

- How can you store a private key safely and maintain the relationship it has with its associated
  certificates?
- what you are supposed to do if you need the public key and certificates to be around for more than
  the duration of an example program.
- Java `KeyStore` objects are used to store private keys and their associated certificates.
- The `javax.security.auth.x500.X500PrivateCredential` is a simple value object that can be used to
  contain a private key, its associated X.509 certificate, and an optional alias. It also has
  a `destroy()` method on it, which allows the credential to be destroyed when it is no longer
  required

## The KeyStore Class

- The KeyStore API supports the persisting of three types of entries:
    - Private keys. Private keys can be saved with their associated certificate chains. In most
      cases they can also be individually password protected.
    - Symmetric keys. Although the API now supports this explicitly some KeyStore types do not.
      Where the saving of symmetric keys does work they can be individually password protected.
    - Trusted certificates. These are the certificates used to create TrustAnchor objects when you
      need them. Ordinarily you will have obtained them from a third party and verified their
      authenticity through channels other than those you use for validating certificates that exist
      within certificate paths.
- Entries are stored under a given alias in the `KeyStore` object, and the alias, together with a
  password if required, is used to retrieve the entry that was saved.
- The API also allows you to find out some of the characteristics of the individual entries, as well
  as supporting the retrieval of some basic properties about the KeyStore object itself, such as its
  size and creation date.

### Keystore Types

- The range of the keystore types available is dependent on the providers you have installed.

### Standard JDK Keystore Types

- There are three basic keystore types that ship with the JDK, which also have some minor
  variations:
    - JCEKS. This is a Sun format type that was introduced with the JCE. In addition to being able
      to contain private keys and certificates, it can also contain symmetric keys. It differs from
      the JKS in that the encryption used to protect private keys is based on Triple-DES, which is
      much stronger than the algorithm used in the JKS. Aliases are case-insensitive.
    - JKS. This is the original Sun format keystore type. It will only contain private keys and
      certifi-cates, and aliases are case-insensitive. There is also a variation on it,
      CaseExactJKS, which recog-nizes the aliases with the same spelling but different case.
    - PKCS12. A version of the format defined in RSA Security’s PKCS #12. Up till JDK 1.5 this type
      was read-only, but you can now write them as well. Aliases are case-insensitive. The store
      cannot be used to store trusted certificates.

### Bouncy Castle Keystore Types

- The Bouncy Castle provider offers three types of keystore:
    - BKS. This store encrypts keys using Triple-DES but otherwise creates the store with the same
      level of security as the JKS store. Aliases are case-sensitive and the store can handle
      symmetric keys as well as private keys and certificates.
    - UBER. This store encrypts keys using Triple-DES and then encrypts the store using the Twofish
      algorithm. This offers a higher level of security than the BKS format, but it does mean it
      will not work with some tools, such as the keytool. Aliases are case-sensitive and the store
      can handle all the types the BKS store can handle.
    - PKCS12. Another version of the format defined in PKCS #12. The store is readable and writable,
      with case-sensitive naming. It can also be used to store trusted certificates. The type is
      also aliased, because BCPKCS12 and PKCS-12DEF. PKCS-12DEF uses the Sun certificate factory for
      creating X.509 certificates, rather than the Bouncy Castle one. Aliases are case-sensitive,
      and individual key passwords are ignored, but keys and certificates are encrypted using the
      password used to save the store

### The Basic KeyStore API

- The `KeyStore.aliases()` method returns a java.util.Enumeration of String objects representing the
  alias names present in the KeyStore.
- The boolean `KeyStore.containsAlias()` method returns true if the passed-in String represents an
  alias name present in the store, false otherwise.
- The KeyStore.deleteEntry() method deletes the entry with the alias name represented by the
  passed-in String from the contents of the store.
- The `KeyStore.getCertificate()` method takes a String alias name as an argument and returns the
  certificate associated with that alias. The certificate can be either a trusted certificate, or if
  the alias is actually the alias for a private key, it will return the certificate containing the
  public key associated with that private key.
- The `KeyStore.getCertificateChain()` method returns an array of java.security.cert.Certificate
  objects representing the certificate chain of the private key entry associated with the passed-in
  String alias name. The chain is ordered with the private key associated certificate first and the
  root authority certificate last.
- The early version of the load() method takes an java.io.InputStream and an array of char as
  parameters and reads in the keystore contained in the InputStream using the password to check the
  integrity of the store. You must do a load() to initialize a KeyStore object.

### Using a JKS Keystore

## KeyStore Nested Classes and Interfaces

- a number of nested classes and interfaces to the KeyStore class. They can be divided into four
  groups. The first group is represented by the classes implementing the interface KeyStore.Entry,
  the second the classes implementing the interface KeyStore.ProtectionParameter, and the last two
  are groups with only one member made up of the KeyStore.Builder class and the
  KeyStore.LoadStoreParameter interface, respectively.

### Using KeyStore.setEntry()

### The KeyStore.Builder Class

- The idea of the KeyStore.Builder class is that you can bundle the information required to create a
  keystore into a KeyStore.Builder but delay creation of the actual keystore until it is really
  required.

### Using KeyStore.Builder

## The PKCS #12 Format

- The PKCS #12 format is defined in RSA Security’s PKCS #12 standard and was primarily designed as a
  means of encoding personal credentials that consisted of private keys and certificates.
- The format is important, as it is the most common way of dealing with private keys when you need
  to import them into another application such as a Web browser to introduce personal credentials or
  some other application that allows you to receive encrypted data or send signed information.
- The encoding specified for the format is ASN.1 using the BER rules and the file structure is built
  around the PFX structure
- In the context of PKCS #12 the local key ID is the most important of these, because it is
  generally used to tell the program reading the file which end entity certificate is related to
  which private key.

### Using PKCS #12 with the KeyStore API

### Using a PKCS #12 Keystore

## The Keytool

- The keytool is a basic command-line tool for manipulating keystores. It provides a range of basic
  facilities for generation of keys with version 1 certificates, export and import of X.509
  certificates, as well as the ability to produce certification requests.

### The JVM’s CA Keystore

- In addition to the java.security file that lives in `JDK_HOME/jre/lib/security`,
  or `JRE_HOME/lib/security` depending on which type of distribution you are looking at, there is a
  also file called cacerts.

```
keytool -list -keystore cacerts -storepass changeit
```

or

```
keytool -list -keystore "%JAVA_HOME%\jre\lib\security\cacerts" -storepass changeit
```

- As it is just a regular JKS file, you can also use the keytool command to import your own trusted
  certificates into cacerts:

```
keytool -import -alias trust -file trust.cer -keystore cacerts -storepass changeit
```

- where trust is the alias you want to assign to your new trust anchor and trust.cer is a file
  containing either the ASN.1 binary or PEM encoding of your trust anchor.

### Generating Some Sample Keystore Files

- after running the program `KeyStoreFileUtility` you will get the two key stores
  files `keystore.jks` and `keystore.p12`
- Having created the files, first try to list the contents of both keystores using the command:

```
keytool -list -keystore keystore.jks -storepass storePassword
keytool -list -keystore keystore.p12 -storetype PKCS12 -storepass storePassword 
```

- Now try adding a key to the JKS keystore using -genkey using the following:

```
keytool -genkey -alias eric -keystore keystore.jks -storepass storePassword
```  

- One last thing to try: exporting a certificate from the PKCS12 store and importing it into the JKS
  one. First you need to export a certificate — in this case, the one associated with key entry end:

```
keytool -export -alias end -rfc -file end.pem -keystore keystore.p12 -storetype PKCS12 -storepass storePassword
```  

- Then you import the file into keystore.jks with:

```
keytool -import -alias new -file end.pem -keystore keystore.jks -storepass storePassword
```

- The initial attempt at listing the PKCS12 keystore showed you that you were using the JDK-provided
  PKCS12 implementation, so it did not pick up the certificate entry. In theory all you should have
  to do is add a -provider option giving you something like:
  `keytool -list -keystore keystore.p12 -storetype PKCS12 -storepass storePassword -provider org.bouncycastle.jce.provider.BouncyCastleProvider`
- use the following
  command : `keytool -list -keystore keystore.p12 -storetype PKCS12-DEF -storepass storePassword`
- Naturally, the certificate is self-signed. If you wanted to get it validated by one of your trust
  anchors, or perhaps someone else’s, you would need to use -certreq to generate a PKCS #10
  certification request for you. After that, you could process the certification request using the
  methods you saw in Chapter 6 producing a CertPath, write it out in “PKCS7” format, and then use
  the -import command to replace the self-signed certificate with the certificate chain you just
  constructed.

## Jarsigning and Java Policy

- There are some other tools and features of JDK/JRE that also make use of keystore files: the
  jarsigner tool and the Java policy mechanisms.

### The Jarsigner

- The jarsigner is used to sign Java archive files (JAR) and to verify the signatures, if any, that
  are attached to them. The basic command syntax for the two modes is as follows:
  `jarsigner options jar-file key_entry_alias` to sign a JAR file
  and `jarsigner -verify options jar-file`
  to verify the signatures attached to one. You can find the jarsigner in the same bin directory you
  found the keytool command.

### Java Policy Files

- The JVM has a system policy file as well as a notion of a user policy file. The system policy
  file, called java.policy, can be found in the lib/security directory along with the cacerts file
  and the java.security file. The user policy file is called .java.policy and can be found in the
  system’s idea of what the user’s home directory is.
- Policy files can be manipulated using the policytool, which is also in the same bin directory as
  the jarsigner, or by using a regular text editor.
- The grant entry can then start with an optional signedBy clause as in:

```
grant signedBy “eric” { 
    permission_list...
}
```  

- granting the permissions detailed in permission_list to the class files that come from a source
  signed by the key entry with the name “eric” from the keystore file described by the keystore
  entry.

## References

- [https://docs.oracle.com/cd/E19830-01/819-4712/ablqw/index.html](https://docs.oracle.com/cd/E19830-01/819-4712/ablqw/index.html)
- [https://docs.oracle.com/javase/7/docs/technotes/tools/windows/keytool.html](https://docs.oracle.com/javase/7/docs/technotes/tools/windows/keytool.html)
- [https://stackoverflow.com/questions/11700132/how-to-import-a-jks-certificate-in-java-trust-store](https://stackoverflow.com/questions/11700132/how-to-import-a-jks-certificate-in-java-trust-store)
