package com.javatmp.demo;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;

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
    public ThreadPoolTaskScheduler threadPoolTaskScheduler() {
        ThreadPoolTaskScheduler pool = new ThreadPoolTaskScheduler();
        pool.setPoolSize(100);
        pool.afterPropertiesSet();
        pool.setWaitForTasksToCompleteOnShutdown(true);
        return pool;
    }

    @Bean
    public CommandLineRunner springBootMain3() throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");
            IntStream.range(1, 10).forEach(s -> {
                PrintTask2 thread = applicationContext.getBean(PrintTask2.class);
                thread.setName("thread " + s);
                threadPoolTaskScheduler.execute(thread);
            });

            IntStream.range(11, 12).forEach(s -> {
                PrintTask2 thread = applicationContext.getBean(PrintTask2.class);
                thread.setName("thread " + s);
                int randomDelay = ThreadLocalRandom.current().nextInt(1000, 2000);
                threadPoolTaskScheduler.scheduleWithFixedDelay(thread, randomDelay);
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
