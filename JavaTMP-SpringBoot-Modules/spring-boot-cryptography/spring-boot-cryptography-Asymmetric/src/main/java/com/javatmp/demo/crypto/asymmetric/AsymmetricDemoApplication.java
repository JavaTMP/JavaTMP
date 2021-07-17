package com.javatmp.demo.crypto.asymmetric;

import com.javatmp.demo.crypto.asymmetric.example.*;
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
public class AsymmetricDemoApplication {

    public static void main(String[] args) {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        Security.addProvider(new BouncyCastleProvider());
        SpringApplication.run(AsymmetricDemoApplication.class, args);
    }

    @Bean
    public CommandLineRunner asymmetricDemoApplicationMain() throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");

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
        };
    }

}
