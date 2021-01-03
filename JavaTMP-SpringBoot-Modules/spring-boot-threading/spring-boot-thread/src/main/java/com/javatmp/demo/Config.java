package com.javatmp.demo;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;

@Configuration
public class Config {
    @Bean
    public ThreadPoolTaskScheduler threadPoolTaskScheduler() {
        ThreadPoolTaskScheduler pool = new ThreadPoolTaskScheduler();
        pool.setPoolSize(100);
        pool.afterPropertiesSet();
        pool.setWaitForTasksToCompleteOnShutdown(true);
        // read more:
        // https://www.javatips.net/api/org.springframework.scheduling.concurrent.threadpooltaskscheduler
        return pool;
    }
}
