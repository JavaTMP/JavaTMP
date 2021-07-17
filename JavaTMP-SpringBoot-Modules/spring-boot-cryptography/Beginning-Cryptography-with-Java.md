# Beginning Cryptography with Java

## Chapter 1: The JCA and the JCE
- Basic Architecture
- Provider Signing
- Jurisdiction Policy Files
    - Installing the Unrestricted Policy Files
    - Troubleshooting Other Issues
    - How Do You Know the Policy Files Really Behave as Sun Says They Do?
- Installing the Bouncy Castle Provider
    - Installing by Configuring the Java Runtime
        - Install the JAR File Containing the Provider
        - Enable the Provider by Adding It to the java.security File
    - Installing During Execution
- How Provider Precedence Works
- Examining the Capabilities of a Provider
- Module source code is [/JavaTMP-SpringBoot-Modules/spring-boot-cryptography/spring-boot-cryptography-provider](/JavaTMP-SpringBoot-Modules/spring-boot-cryptography/spring-boot-cryptography-provider)

## Chapter 2: Symmetric Key Cryptography
- The SecretKeySpec Class
- The Cipher Class 
    - Cipher.getInstance()
    - Cipher.init() 
    - Cipher.update()
    - Cipher.doFinal()
- Symmetric Block Cipher Padding.
    - PKCS #5/PKCS #7 Padding
    - Other Padding Mechanisms.
- Symmetric Block Cipher Modes
    - ECB Mode
    - CBC Mode
        - Inline IVs
        - Creating an IV
        - Random IVs
        - Creating a SecureRandom Object
        - Pseudorandom IVs
    - A Look at Cipher Parameter Objects.
    - The AlgorithmParameters Class.
    - CTS Mode: A Special Case of CBC.
    - Streaming Symmetric Block Cipher Modes.
        - CTR Mode
        - OFB Mode
        - CFB Mode
- Symmetric Stream Ciphers.
- Generating Random Keys.
    - The Key Interface.
        - Key.getAlgorithm()
        - Key.getEncoded()
        - Key.getFormat()
    - The KeyGenerator Class
        - KeyGenerator.getInstance() 43
        - KeyGenerator.init() 43
        - KeyGenerator.generateKey()  
- Password-Based Encryption.
    - Basic PBE.
        - The Password
        - The Salt
        - The Iteration Count
    - PBE in the JCE
        - The PBEParameterSpec Class
        - The PBEKeySpec Class
        - The SecretKeyFactory Class
- Key Wrapping
- Doing Cipher-Based I/O
- Module source code is [/JavaTMP-SpringBoot-Modules/spring-boot-cryptography/spring-boot-cryptography-symmetric](/JavaTMP-SpringBoot-Modules/spring-boot-cryptography/spring-boot-cryptography-symmetric)

## Chapter 3: Message Digests, MACs, and HMACs 
- Tampering with an Encrypted Stream
- Message Digests
- The MessageDigest Class
- Tampering with the Digest
- Tampering with an Encrypted Stream
- MACs Based on Digests — the HMAC
- Using a HMAC
- MACs Based on Symmetric Ciphers
- Digests in Pseudorandom Functions
- Mask Generation
- Doing Digest-Based I/O

## Chapter 4: Asymmetric Key Cryptography
- The PublicKey and PrivateKey Interfaces
- The RSA Algorithm
- The KeyFactory Class
- Creating Random RSA Keys
- Improving RSA Performance
- RSA Padding Mechanisms
- OAEP Padding
- Wrapping RSA Keys
- Secret Key Exchange
- Key Agreement
- The Diffie-Hellman Algorithm
- Diffie-Hellman with Elliptic Curve
- Diffie-Hellman for More Than Two Parties
- The El Gamal Algorithm
- Digital Signatures
- The Digital Signature Algorithm
- Elliptic Curve DSA
- RSA-Based Signature Algorithms

## Chapter 5: Object Description in Cryptography Using ASN.1
- Implementing an ASN.1-Based Java Object
- Encoding Public and Private Keys

## Chapter 6: Distinguished Names and Certificates
- Distinguished Names
- Public Key Certificates
- X.509 Certificates
- Reading and Writing Certificates
- Certification Requests
- Writing a Simple Certificate Authority
- Certificate Paths and Stores

## Chapter 7: Certificate Revocation and Path Validation
- Certificate Revocation Lists
- X.509 Certificate Revocation Lists
- X.509 CRL Entry Extensions
- Online Certificate Status Protocol
- OCSP Request Extensions
- The Acceptable Response Types Extension
- Certificate Path Validation
- Building a Valid Path from a CertStore

## Chapter 8: Key and Certificate Management Using Keystores
- The KeyStore Class
- Standard JDK Keystore Types
- Bouncy Castle Keystore Types
- The PKCS #12 Format
- Using PKCS #12 with the KeyStore API
- The Keytool
- Jarsigning and Java Policy

## Chapter 9: CMS and S/MIME
- Cryptographic Message Syntax
- CMS Enveloped-Data
- Secure/Multipurpose Internet Mail Extensions (S/MIME)
- S/MIME Signed Messages
- S/MIME Enveloped Messages
- Combining Signing with Encryption

## Chapter 10: SSL and TLS
- The SSL and TLS Protocols
- Client-Side Authentication
- Managing SSL Session Information
- 
- 

## 











