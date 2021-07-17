package com.javatmp.demo.crypto.keystore;


import com.javatmp.demo.crypto.keystore.example.*;
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
public class KeystoreDemoApplication {

    public static void main(String[] args) {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        Security.addProvider(new BouncyCastleProvider());
        SpringApplication.run(KeystoreDemoApplication.class, args);
    }

    @Bean
    public CommandLineRunner keystoreDemoApplicationMain() throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");

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
        };
    }

}
