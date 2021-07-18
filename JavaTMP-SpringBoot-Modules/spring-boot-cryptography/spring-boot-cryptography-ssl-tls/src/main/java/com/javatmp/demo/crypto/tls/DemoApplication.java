package com.javatmp.demo.crypto.tls;

import com.javatmp.demo.crypto.tls.example.HTTPSClientExample;
import com.javatmp.demo.crypto.tls.example.HTTPSServerExample;
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
