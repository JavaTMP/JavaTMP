package com.javatmp.demo.crypto.crl;


import com.javatmp.demo.crypto.crl.example.*;
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
public class CrlDemoApplication {

    public static void main(String[] args) {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        Security.addProvider(new BouncyCastleProvider());
        SpringApplication.run(CrlDemoApplication.class, args);
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


        };
    }

}
