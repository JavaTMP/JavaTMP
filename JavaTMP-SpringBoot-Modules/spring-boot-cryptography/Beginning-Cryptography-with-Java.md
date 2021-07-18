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
- Module source code
  is [/JavaTMP-SpringBoot-Modules/spring-boot-cryptography/spring-boot-cryptography-provider](/JavaTMP-SpringBoot-Modules/spring-boot-cryptography/spring-boot-cryptography-provider)

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
- Module source code
  is [/JavaTMP-SpringBoot-Modules/spring-boot-cryptography/spring-boot-cryptography-symmetric](/JavaTMP-SpringBoot-Modules/spring-boot-cryptography/spring-boot-cryptography-symmetric)

## Chapter 3: Message Digests, MACs, and HMACs

- The Problem of Tampering
- Message Digests
    - The MessageDigest Class
    - MessageDigest.update()
    - MessageDigest.digest()
    - MessageDigest.isEqual()
- Tampering with the Digest
- MACs Based on Digests — the HMAC
    - The Mac Class
    - Mac.init()
    - Mac.update()
    - Mac.doFinal()
- MACs Based on Symmetric Ciphers
- Digests in Pseudorandom Functions
    - PBE Key Generation 74
    - Mask Generation
- Doing Digest-Based I/O
- Module source code
  is [/JavaTMP-SpringBoot-Modules/spring-boot-cryptography/spring-boot-cryptography-digests](/JavaTMP-SpringBoot-Modules/spring-boot-cryptography/spring-boot-cryptography-digests)

## Chapter 4: Asymmetric Key Cryptography

- Module source code
  is [/JavaTMP-SpringBoot-Modules/spring-boot-cryptography/spring-boot-cryptography-Asymmetric](/JavaTMP-SpringBoot-Modules/spring-boot-cryptography/spring-boot-cryptography-Asymmetric)

## Chapter 5: Object Description in Cryptography Using ASN.1

- Module source code
  is [/JavaTMP-SpringBoot-Modules/spring-boot-cryptography/spring-boot-cryptography-asn1](/JavaTMP-SpringBoot-Modules/spring-boot-cryptography/spring-boot-cryptography-asn1)

## Chapter 6: Distinguished Names and Certificates

- Module source code
  is [/JavaTMP-SpringBoot-Modules/spring-boot-cryptography/spring-boot-cryptography-certificate](/JavaTMP-SpringBoot-Modules/spring-boot-cryptography/spring-boot-cryptography-certificate)
  
## Chapter 7: Certificate Revocation and Path Validation

- Module source code
  is [/JavaTMP-SpringBoot-Modules/spring-boot-cryptography/spring-boot-cryptography-crl](/JavaTMP-SpringBoot-Modules/spring-boot-cryptography/spring-boot-cryptography-crl)
  
## Chapter 8: Key and Certificate Management Using Keystores

- Module source code
  is [/JavaTMP-SpringBoot-Modules/spring-boot-cryptography/spring-boot-cryptography-keystore](/JavaTMP-SpringBoot-Modules/spring-boot-cryptography/spring-boot-cryptography-keystore)
  
## Chapter 9: CMS and S/MIME

- Module source code
  is [/JavaTMP-SpringBoot-Modules/spring-boot-cryptography/spring-boot-cryptography-cms-mime-smime](/JavaTMP-SpringBoot-Modules/spring-boot-cryptography/spring-boot-cryptography-cms-mime-smime)

## Chapter 10: SSL and TLS

- Module source code
  is [/JavaTMP-SpringBoot-Modules/spring-boot-cryptography/spring-boot-cryptography-ssl-tls](/JavaTMP-SpringBoot-Modules/spring-boot-cryptography/spring-boot-cryptography-ssl-tls)
