package com.javatmp.demo.rest;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.util.List;

/**
 * Spring Boot Main Runner Class
 */
@SpringBootApplication
@Slf4j
public class RestDemoApplication {

    @Bean
    public List<RestDto> getRestDtoRepository() {
        return Collections.synchronizedList(new LinkedList<RestDto>());
    }

    public static void main(String[] args) {
        SpringApplication.run(RestDemoApplication.class, args);
    }

    @Bean
    public CommandLineRunner springBootMain() throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");
        };
    }

}
