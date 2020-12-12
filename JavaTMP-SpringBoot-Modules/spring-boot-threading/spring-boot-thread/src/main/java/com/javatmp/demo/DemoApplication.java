package com.javatmp.demo;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
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
public class DemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

    @Autowired
    PrintThread printThread1;

    @Autowired
    PrintThread printThread2;

    @Autowired
    ApplicationContext applicationContext;

    @Bean
    public CommandLineRunner springBootMain() throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");
            printThread1.setName("thraed 1");
            printThread2.setName("thread 2");

            printThread1.start();
            printThread2.start();

            IntStream.range(3, 13).forEach(s -> {
                PrintThread thread = applicationContext.getBean(PrintThread.class);
                thread.setName("thread " + s);
                thread.start();
            });


        };
    }

}
