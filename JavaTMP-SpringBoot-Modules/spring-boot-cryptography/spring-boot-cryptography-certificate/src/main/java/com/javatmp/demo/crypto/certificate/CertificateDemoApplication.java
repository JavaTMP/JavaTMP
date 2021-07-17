package com.javatmp.demo.crypto.certificate;


import com.javatmp.demo.crypto.certificate.example.*;
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
public class CertificateDemoApplication {

    public static void main(String[] args) {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        Security.addProvider(new BouncyCastleProvider());
        SpringApplication.run(CertificateDemoApplication.class, args);
    }

    @Bean
    public CommandLineRunner certificateDemoApplicationMain() throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");

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

        };
    }

}
