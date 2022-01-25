package com.javatmp.demo;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;

import java.time.Duration;
import java.util.concurrent.ThreadLocalRandom;
import java.util.stream.IntStream;

/**
 * Spring Boot Main Runner Class
 */
@SpringBootApplication
@Slf4j
public class TaskSchedulerApplication {

    public static void main(String[] args) {
        SpringApplication.run(TaskSchedulerApplication.class, args);
    }

    @Autowired
    ApplicationContext applicationContext;

    @Autowired
    ThreadPoolTaskScheduler threadPoolTaskScheduler;

    @Bean
    public CommandLineRunner springBootMain3() throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");
            IntStream.range(1, 10).forEach(s -> {
                PrintTask thread = applicationContext.getBean(PrintTask.class);
                thread.setName("thread-execute-" + s);
                threadPoolTaskScheduler.execute(thread);
            });

            int threadCount = 12;
            IntStream.range(1, threadCount).forEach(s -> {
                PrintTask thread = applicationContext.getBean(PrintTask.class);
                thread.setName("thread-schedule-" + s);
                long initialDelay = 15000;
                long actualDelay = initialDelay + ((initialDelay/threadCount) * s);
                log.info("actual delay of thread :{} is :{}", s, actualDelay);
                int randomDelay = ThreadLocalRandom.current().nextInt(1000, 2000);
                threadPoolTaskScheduler.scheduleWithFixedDelay(
                        thread, Duration.ofMillis(actualDelay));
            });

//            for (;;) {
//                int count = taskExecutor.getActiveCount();
//                System.out.println("Active Threads : " + count);
//                try {
//                    Thread.sleep(1000);
//                } catch (InterruptedException e) {
//                    e.printStackTrace();
//                }
//                if (count == 0) {
//                    taskExecutor.shutdown();
//                    break;
//                }
//            }

        };
    }

}
