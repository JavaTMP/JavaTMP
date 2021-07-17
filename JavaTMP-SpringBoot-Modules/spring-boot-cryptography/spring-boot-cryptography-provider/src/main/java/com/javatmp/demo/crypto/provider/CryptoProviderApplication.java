package com.javatmp.demo.crypto.provider;


import com.javatmp.demo.crypto.provider.example.*;
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
public class CryptoProviderApplication {

    public static void main(String[] args) {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        Security.addProvider(new BouncyCastleProvider());
        SpringApplication.run(CryptoProviderApplication.class, args);
    }

    @Bean
    public CommandLineRunner cryptoProviderApplicationMain() throws Exception {
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

            log.info("List the available algorithm names for ciphers, key agreement, macs, message digests and signatures");
            ListAlgorithms.main(null);

        };
    }

}
