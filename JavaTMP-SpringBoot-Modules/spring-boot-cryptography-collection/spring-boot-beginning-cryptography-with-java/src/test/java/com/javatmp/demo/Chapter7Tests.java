package com.javatmp.demo;

import chapter7.*;
import lombok.extern.slf4j.Slf4j;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.security.Security;

@SpringBootTest
@Slf4j
public class Chapter7Tests {
    static {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        if (Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) == null) {
            Security.addProvider(new BouncyCastleProvider());
        }
    }
    @Test
    void contextLoads1() throws Exception {

        log.info("*** Start Spring Boot Project ***");

        log.info("Creating a CRL");
        X509CRLExample.main(null);
        log.info("Building a CRL Using the CertificateFactory");
        CRLCertFactoryExample.main(null);

        log.info("Retrieving a CRL from a CertStore");
        CRLCertStoreExample.main(null);

        log.info("OCSP Request Generation");
        OCSPClientExample.main(null);

        log.info("Generating an OCSP Response");
        OCSPResponderExample.main(null);

        log.info("Validating a Certificate Path");
        CertPathValidatorExample.main(null);

        log.info("Using a PKIXCertPathChecker. Basic example of certificate path validation using a PKIXCertPathChecker");
        CertPathValidatorWithCheckerExample.main(null);

        log.info("Building a Certificate Path Using CertPathBuilder");
        CertPathBuilderExample.main(null);


    }

}
