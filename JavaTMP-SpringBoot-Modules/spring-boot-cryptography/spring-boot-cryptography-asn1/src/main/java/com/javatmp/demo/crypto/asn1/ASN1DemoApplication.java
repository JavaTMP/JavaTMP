package com.javatmp.demo.crypto.asn1;

import com.javatmp.demo.crypto.asn1.example.*;
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
public class ASN1DemoApplication {

    public static void main(String[] args) {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        Security.addProvider(new BouncyCastleProvider());
        SpringApplication.run(ASN1DemoApplication.class, args);
    }

    @Bean
    public CommandLineRunner aSN1DemoApplicationMain() throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");

            log.info("Asn1StructureTest");
            Asn1StructureTest.main(null);
            
            log.info("Implementing an ASN.1-Based Java Object");
            MyStructureTest.main(null);

            log.info("Using ASN1Dump");
            ASN1DumpExample.main(null);

            log.info("Encoding an IV with ASN.1");
            IVExample.main(null);

            log.info("Looking Inside a PKCS #1 V1.5 Signature");
            PKCS1SigEncodingExample.main(null);

            log.info("Encoding PSS Parameters ");
            PSSParamExample.main(null);

            log.info("Using the X509EncodedKeySpec");
            X509EncodedKeySpecExample.main(null);

            log.info("Using EncryptedPrivateKeyInfo and PBE");
            EncryptedPrivateKeyInfoExample.main(null);
        };
    }

}
