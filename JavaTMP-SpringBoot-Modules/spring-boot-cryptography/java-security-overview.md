# Java Security Overview
- Java security includes a large set of APIs, tools, and implementations of commonly-used security algorithms, mechanisms, and protocols.
- The Java security APIs span a wide range of areas, including cryptography, public key infrastructure, secure communication, authentication, and access control.
- Defines the foundational APIs of Java SE. Contained packages include java.security, javax.crypto, javax.net.ssl, and javax.security.auth.
- Security services are implemented in providers (see the section Security Providers), which are plugged into the JDK via a standard interface.

## Java Cryptography
The Java cryptography architecture is a framework for accessing and developing cryptographic functionality for the 
Java platform. It includes APIs for a large variety of cryptographic services, including the following:
- Message digest algorithms
  A cryptographic hash function (CHF) is a mathematical algorithm that maps 
  data of arbitrary size (often called the "message") to a bit array of a fixed size
  (the "hash value", "hash", or "message digest"). 
  It is a one-way function, that is, a function which is practically infeasible 
  to invert or reverse the computation.
- Digital signature algorithms
  - A digital signature is a mathematical scheme for verifying the authenticity 
  of digital messages or documents. A valid digital signature, where the
  prerequisites are satisfied, gives a recipient very strong reason to believe
  that the message was created by a known sender (authentication), and that the
  message was not altered in transit (integrity).
  - a digital signature gives the receiver reason to believe the message was
    sent by the claimed sender.
  - A digital signature scheme typically consists
    of three algorithms; 
    A key generation, A signing, A signature verifying algorithms
- Symmetric bulk and stream encryption
  A bulk cipher is a symmetric encryption algorithm that is used to encrypt and
  decrypt large amounts of data. There are two types of bulk ciphers: 
  Stream ciphers, Block ciphers.
- Asymmetric encryption
  Asymmetric Encryption or Public-Key Cryptography, encrypts and decrypts 
  the data using two separate yet mathematically connected cryptographic keys.
  These keys are known as a 'Public Key' and a 'Private Key.
- Password-based encryption (PBE)
  - Password-based encryption allows to create strong secret keys based on passwords provided by the users. The 
    produced key bytes are supposed to be as random and unpredictable as possible.
  - The secret key encrypts the application passwords by using an AES-128 bit
    encryption algorithm. The algorithm generates a key according to the
    following process:
    - Append the salt to the password and generate a hash by using the SHA-256 algorithm.
    - Append the salt to the digest and generate the hash by using the SHA-256 algorithm. Repeat this process 1000 
      times.
    - The key is the first 16 bytes of the final digest.
- Elliptic Curve Cryptography (ECC)
  is a key-based technique for encrypting data. ECC focuses on pairs of public 
  and private keys for decryption and encryption of web traffic.
- Key agreement algorithms
  is any method in cryptography by which secret cryptographic keys are exchanged
  between two parties, usually over a public communications channel.
- Key generators
  A key generator is a protocol or algorithm that is used in many cryptographic protocols to generate a sequence 
  with many pseudo-random characteristics.
- Message Authentication Codes (MACs)
  The sender uses some publicly known MAC algorithm, inputs the message and the secret 
  key K and produces a MAC value.
- Secure Random Number Generators
  
- the cryptography APIs are organized into two distinct packages:
  - The java.security and java.security.* packages contains classes that are not subject to export controls (like 
  Signature and MessageDigest)
  - The javax.crypto package contains classes that are subject to export 
    controls (like Cipher and KeyAgreement)
- 
