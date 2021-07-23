package chapter9;


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
public class CmsDemoApplication {

    public static void main(String[] args) {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        Security.addProvider(new BouncyCastleProvider());
        SpringApplication.run(CmsDemoApplication.class, args);
    }

    @Bean
    public CommandLineRunner springBootMain() throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");

            log.info("Creating and Validating a Detached Signature ");
            SignedDataExample.main(null);
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

        };
    }

}
