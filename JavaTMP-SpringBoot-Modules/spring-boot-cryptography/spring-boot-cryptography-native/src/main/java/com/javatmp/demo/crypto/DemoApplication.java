package com.javatmp.demo.crypto;


import chapter1.*;
import chapter2.*;
import chapter3.*;
import chapter4.*;
import chapter5.*;
import chapter6.*;
import chapter7.*;
import chapter8.*;
import lombok.extern.slf4j.Slf4j;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.security.Security;

/**
 * Spring Boot Main Runner Class
 */
@SpringBootApplication
@Slf4j
public class DemoApplication {

    public static void main(String[] args) {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        Security.addProvider(new BouncyCastleProvider());
        SpringApplication.run(DemoApplication.class, args);
    }

    @Bean
    public CommandLineRunner springBootMain() throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");

            log.info("Test to make sure the unrestricted policy files are installed");
            SimplePolicyTest.main(null);

            log.info("List the currently installed providers in the Java Runtime");
            ListProviders.main(null);

            log.info("Verifying Bouncy Castle Provider Installation\n");
            SimpleProviderTest.main(null);

            log.info("Basic demonstration of precedence in action");
            PrecedenceTest.main(null);

            log.info("Examining the Capabilities of a Provider by listing Provider Capabilities");
            ListBCCapabilities.main(null);

            log.info("Basic symmetric encryption example");
            SimpleSymmetricExample.main(null);

            log.info("Adding Padding");
            SimpleSymmetricPaddingExample.main(null);

            log.info("Basic symmetric encryption example with padding and ECB using DES");
            SimpleECBExample.main(null);

            log.info("Basic symmetric encryption example with padding and CBC using DES");
            SimpleCBCExample.main(null);

            log.info("Symmetric encryption example with padding and CBC using DES * with the initialization vector inline. ");
            InlineIvCBCExample.main(null);

            log.info(" CBC using DES with an IV based on a nonce. In this case a hypothetical message number");
            NonceIvCBCExample.main(null);

            log.info("Basic symmetric encryption example with CTR using DES");
            SimpleCTRExample.main(null);

            log.info("Basic stream cipher example");
            SimpleStreamExample.main(null);

            log.info("Basic example using the KeyGenerator class and showing how to create a SecretKeySpec from an encoded key.");
            KeyGeneratorExample.main(null);

            log.info("Example of using PBE with a PBEParameterSpec");
            PBEWithParamsExample.main(null);

            log.info("Example of using PBE without using a PBEParameterSpec");
            PBEWithoutParamsExample.main(null);

            log.info("Symmetric Key Wrapping ");
            SimpleWrapExample.main(null);

            log.info("Basic IO example with CTR using AES");
            SimpleIOExample.main(null);

            log.info("Tampered message, plain encryption, AES in CTR mode ");
            TamperedExample.main(null);

            log.info(" Tampered message, encryption with digest, AES in CTR mode ");
            TamperedWithDigestExample.main(null);

            log.info("Tampered message, encryption with digest, AES in CTR mode ");
            TamperedDigestExample.main(null);

            log.info("Tampered message with HMac, encryption with AES in CTR mode ");
            TamperedWithHMacExample.main(null);

            log.info("Message without tampering with MAC (DES), encryption AES in CTR mode ");
            CipherMacExample.main(null);

            log.info(" A basic implementation of PKCS #5 Scheme 1.");
            PKCS5Scheme1Test.main(null);

            log.info("mask generator function, as described in PKCS1v2.");
            MGF1.main(null);

            log.info("Basic IO example using SHA1");
            DigestIOExample.main(null);

            log.info("Basic RSA example.");
            BaseRSAExample.main(null);

            log.info("RSA example with random key generation. ");
            RandomKeyRSAExample.main(null);

            log.info("RSA example with PKCS #1 Padding. ");
            PKCS1PaddedRSAExample.main(null);

            log.info("RSA example with OAEP Padding and random key generation");
            OAEPPaddedRSAExample.main(null);

            log.info("Wrapping RSA Keys");
            AESWrapRSAExample.main(null);

            log.info("RSA example with OAEP Padding and random key generation. ");
            RSAKeyExchangeExample.main(null);

            log.info("Diffie-Hellman Key Agreement ");
            BasicDHExample.main(null);

            log.info("Diffie-Hellman with Elliptic Curve ");
            BasicECDHExample.main(null);

            log.info("Three-Party Diffie-Hellman");
            ThreeWayDHExample.main(null);

            log.info("El Gamal example with random key generation.");
            RandomKeyElGamalExample.main(null);

            log.info("El Gamal Using AlgorithmParameterGenerator");
            AlgorithmParameterExample.main(null);

            log.info("The Digital Signature Algorithm");
            BasicDSAExample.main(null);

            log.info("Simple example showing signature creation and verification using ECDSA");
            BasicECDSAExample.main(null);

            log.info("PKCS #1 1.5 RSA Signature Generation");
            PKCS1SignatureExample.main(null);

            log.info("Implementing an ASN.1-Based Java Object");
            MyStructureTest.main(null);

            log.info("Using ASN1Dump");
            ASN1DumpExample.main(null);

            log.info("Encoding an IV with ASN.1");
            IVExample.main(null);

            log.info("Looking Inside a PKCS #1 V1.5 Signature");
            PKCS1SigEncodingExample.main(null);

            log.info("Encoding PSS Parameters ");
            PSSParamExample.main(null);

            log.info("Using the X509EncodedKeySpec");
            X509EncodedKeySpecExample.main(null);

            log.info("Using EncryptedPrivateKeyInfo and PBE");
            EncryptedPrivateKeyInfoExample.main(null);

            log.info("Creating a Self-Signed Version 1 Certificate");
            X509V1CreateExample.main(null);

            log.info("Creating a Self-Signed Version 3 Certificate ");
            X509V3CreateExample.main(null);

            log.info("Basic example of using a CertificateFactory");
            CertificateFactoryExample.main(null);

            log.info("Reading Multiple Certificates");
            MultipleCertificateExample.main(null);

            log.info("Creating a Certification Request");
            PKCS10CertRequestExample.main(null);

            log.info(" Adding Extensions to a Certification Request");
            PKCS10ExtensionExample.main(null);

            log.info("Creating a Certificate from a Certification Request");
//            PKCS10CertCreateExample.main(null);

            log.info("Writing a CertPath");
//            CertPathExample.main(null);
            log.info("Using a CertStore and a X509CertSelector");
//            CertStoreExample.main(null);

            log.info("Creating a CRL");
            X509CRLExample.main(null);
            log.info("Building a CRL Using the CertificateFactory");
            CRLCertFactoryExample.main(null);

            log.info("Retrieving a CRL from a CertStore");
            CRLCertStoreExample.main(null);

            log.info("OCSP Request Generation");
//            OCSPClientExample.main(null);

            log.info("Generating an OCSP Response");
//            OCSPResponderExample.main(null);
            log.info("Validating a Certificate Path");
            CertPathValidatorExample.main(null);

            log.info("Building a Certificate Path Using CertPathBuilder");
            CertPathBuilderExample.main(null);

            log.info("Using a JKS Keystore");
            JKSStoreExample.main(null);

            log.info("Using KeyStore.setEntry()");
            JCEKSStoreEntryExample.main(null);

            log.info("Using KeyStore.Builder");
            JCEKSStoreBuilderExample.main(null);

            log.info("Using a PKCS #12 Keystore");
            PKCS12StoreExample.main(null);

            log.info("Generating Some Sample Keystore Files");
            KeyStoreFileUtility.main(null);
            log.info("");

            log.info("");



        };
    }

}
