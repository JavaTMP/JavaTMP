package com.javatmp.demo;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.stream.IntStream;

/**
 * Spring Boot Main Runner Class
 */
@SpringBootApplication
@Slf4j
public class ExecutorApplication {

    public static void main(String[] args) {
        SpringApplication.run(ExecutorApplication.class, args);
    }

    @Bean(destroyMethod = "shutdown")
    public ExecutorService createExecutorService() {
        ExecutorService executorService = Executors.newCachedThreadPool();
        return executorService;
    }

    @Bean
    public CommandLineRunner springBootMain(
            ApplicationContext applicationContext,
            ExecutorService executorService) throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");
            IntStream.range(3, 13).forEach(s -> {
                Task task = applicationContext.getBean(Task.class);
                executorService.execute(task);
            });
        };
    }

}
