package com.javatmp.demo;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.stream.IntStream;

/**
 * Spring Boot Main Runner Class
 */
@SpringBootApplication
@Slf4j
public class TaskExecutorApplication {

    public static void main(String[] args) {
        SpringApplication.run(TaskExecutorApplication.class, args);
    }

    @Autowired
    ApplicationContext applicationContext;

    @Autowired
    ThreadPoolTaskExecutor taskExecutor;

    @Bean
    public CommandLineRunner springBootMain2() throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");
            IntStream.range(3, 13).forEach(s -> {
                PrintTask thread = applicationContext.getBean(PrintTask.class);
                thread.setName("thread " + s);
                taskExecutor.execute(thread);
            });

            for (;;) {
                int count = taskExecutor.getActiveCount();
                System.out.println("Active Threads : " + count);
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                if (count == 0) {
                    taskExecutor.shutdown();
                    break;
                }
            }

        };
    }

}
