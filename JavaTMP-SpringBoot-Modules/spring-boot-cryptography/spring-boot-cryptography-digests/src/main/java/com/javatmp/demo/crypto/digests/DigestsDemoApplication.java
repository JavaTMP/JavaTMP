package com.javatmp.demo.crypto.digests;


import com.javatmp.demo.crypto.digests.example.*;
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
public class DigestsDemoApplication {

    public static void main(String[] args) {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        Security.addProvider(new BouncyCastleProvider());
        SpringApplication.run(DigestsDemoApplication.class, args);
    }

    @Bean
    public CommandLineRunner digestsDemoApplicationMain() throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");

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
        };
    }

}
