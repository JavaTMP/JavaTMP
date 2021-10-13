package com.javatmp.demo.cloud.stream.func;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.annotation.Bean;

import java.math.BigInteger;
import java.util.function.Function;

/**
 * Spring Boot Main Runner Class
 */
@SpringBootApplication
@Slf4j
@RefreshScope
@EnableDiscoveryClient
public class DemoApplication {

    @Value("${application.message}")
    String message;

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

    @Bean
    Function<Integer, BigInteger> calculateNthPrime(PrimeNumberService primeNumberService) {
        return primeNumberService::nthPrime;
    }

    @Bean
    public CommandLineRunner springBootMain() throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");
        };
    }
}
