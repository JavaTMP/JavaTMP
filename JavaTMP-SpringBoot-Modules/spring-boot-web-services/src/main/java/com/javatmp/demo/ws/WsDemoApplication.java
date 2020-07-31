package com.javatmp.demo.ws;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import javax.xml.ws.Endpoint;

/**
 * Spring Boot Main Runner Class
 */
@SpringBootApplication
@Slf4j
public class WsDemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(WsDemoApplication.class, args);
    }

    @Bean
    public CommandLineRunner springBootMain() throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");
            Endpoint.publish("http://localhost:8888/ws/person", new PersonServiceImpl());
        };
    }

}
