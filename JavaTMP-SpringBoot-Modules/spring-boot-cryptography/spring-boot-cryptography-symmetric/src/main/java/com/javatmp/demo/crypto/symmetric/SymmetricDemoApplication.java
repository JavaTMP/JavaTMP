package com.javatmp.demo.crypto.symmetric;


import com.javatmp.demo.crypto.symmetric.example.*;
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
public class SymmetricDemoApplication {

    public static void main(String[] args) {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        Security.addProvider(new BouncyCastleProvider());
        SpringApplication.run(SymmetricDemoApplication.class, args);
    }

    @Bean
    public CommandLineRunner symmetricDemoApplicationMain() throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");

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
        };
    }

}
