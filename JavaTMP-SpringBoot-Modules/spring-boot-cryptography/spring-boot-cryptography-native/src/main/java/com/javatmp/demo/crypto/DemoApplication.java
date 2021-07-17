package com.javatmp.demo.crypto;


import chapter10.CreateKeyStores;
import chapter10.HTTPSClientExample;
import chapter10.HTTPSServerExample;
import chapter9.CompressedMailExample;
import com.javatmp.demo.crypto.crl.example.*;
import com.javatmp.demo.crypto.keystore.example.PKCS12StoreExample;
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
            com.javatmp.demo.crypto.keystore.example.JKSStoreExample.main(null);

            log.info("Using KeyStore.setEntry()");
            com.javatmp.demo.crypto.keystore.example.JCEKSStoreEntryExample.main(null);

            log.info("Using KeyStore.Builder");
            com.javatmp.demo.crypto.keystore.example.JCEKSStoreBuilderExample.main(null);

            log.info("Using a PKCS #12 Keystore");
            PKCS12StoreExample.main(null);

            log.info("Generating Some Sample Keystore Files");
            com.javatmp.demo.crypto.keystore.example.KeyStoreFileUtility.main(null);

            log.info("Example of generating a detached signature");
//            SignedDataExample.main(null);
            log.info("Creating and Decoding CMS Enveloped-Data");
//            KeyTransEnvelopedDataExample.main(null);
            log.info("Using Key-Encrypted Keys with Enveloped-Data");
            log.info("Data Compression in CMS");
            log.info("Using Compression with CMS ");
            log.info("Creating and Validating a S/MIME Signed Message\n");
            log.info("Using S/MIME Enveloped Messages");
            log.info("Enveloping a Signed Message");
            log.info("Using S/MIME Compression");
            CompressedMailExample.main(null);

            log.info("Create the various credentials for an SSL session");
            // https://stackoverflow.com/questions/15076820/java-sslhandshakeexception-no-cipher-suites-in-common
            CreateKeyStores.main(null);

            log.info("Basic SSL Server - using the ‘!’ protocol.");
//            SSLServerExample.main(null);
            log.info("A Basic SSL Client and Server");
//            SSLClientExample.main(null);

            log.info("Basic SSL Server with client authentication.");
//            SSLServerWithClientAuthExample.main(null);

            log.info("Introducing Client-Side Authentication");
//            SSLClientWithClientAuthExample.main(null);

            log.info("Using the TrustManagerFactory");
//            SSLClientWithClientAuthTrustExample.main(null);

            log.info("Using SSLSession");
//            SSLServerWithClientAuthIdExample.main(null);

            log.info("Using SSLSession Client");
//            SSLClientWithClientAuthTrustExample.main(null);

            log.info("Basic SSL Server with optional client authentication.");
            HTTPSServerExample.main(null);

            log.info("Using HttpsURLConnection and HostnameVerifier\n");
            HTTPSClientExample.main(null);



            log.info("");
            log.info("");
            log.info("");
            log.info("");
            log.info("");

        };
    }

}
