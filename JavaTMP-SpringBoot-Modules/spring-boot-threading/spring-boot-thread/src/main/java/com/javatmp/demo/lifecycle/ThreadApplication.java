package com.javatmp.demo;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;

import java.util.stream.IntStream;

/**
 * Spring Boot Main Runner Class
 */
@SpringBootApplication
@Slf4j
public class ThreadApplication {

    public static void main(String[] args) {
        SpringApplication.run(ThreadApplication.class, args);
    }

    @Bean
    public CommandLineRunner springBootMain(ApplicationContext applicationContext) throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");
            IntStream.range(3, 13).forEach(s -> {
                PrintThread thread = applicationContext.getBean(PrintThread.class);
                thread.setName("thread " + s);
                thread.start();
            });
        };
    }

}
