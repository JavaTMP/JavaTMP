package com.javatmp.demo.scheduler;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.core.task.TaskExecutor;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;

import java.util.concurrent.TimeUnit;

/**
 * Spring Boot Main Runner Class
 */
@SpringBootApplication
@Slf4j
@EnableScheduling
public class DemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

    @Autowired
//            @Qualifier("poolScheduler")
            TaskExecutor taskExecutor;

    @Bean
    public CommandLineRunner springBootMain() throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");
            taskExecutor.execute(() -> {
                int i = 0;
                do {
                    log.debug("inside command line runner wait for 3 seconds");
                    try {
                        TimeUnit.SECONDS.sleep(3);
                    } catch (InterruptedException e) {
                        log.error("during sleeping", e);
                    }
                } while(++i < 30);
            });
        };
    }

}
