package com.javatmp.demo.rest.reactive;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import reactor.core.scheduler.Scheduler;
import reactor.core.scheduler.Schedulers;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.stream.IntStream;

/**
 * Spring Boot Main Runner Class
 */
@SpringBootApplication
@Slf4j
public class RestDemoApplication {

    private final Integer threadPoolSize;
    private final Integer taskQueueSize;

    public RestDemoApplication(
            @Value("${app.threadPoolSize:10}") Integer threadPoolSize,
            @Value("${app.taskQueueSize:100}") Integer taskQueueSize) {
        this.threadPoolSize = threadPoolSize;
        this.taskQueueSize = taskQueueSize;
    }

    @Bean
    public Scheduler reactiveScheduler() {
        log.info("Creates a jdbcScheduler with thread pool size = {}", threadPoolSize);
        return Schedulers.newBoundedElastic(
                threadPoolSize, taskQueueSize, "reactiveScheduler-pool");
    }

    public static void main(String[] args) {
        SpringApplication.run(RestDemoApplication.class, args);
    }

    private RestDto getRandomDto(long index) {
        RestDto restDto = RestDto.builder()
                .id(index)
                .intField((int) index)
                .integerField((int) index)
                .stringField("String Field for index " + index)
                .date(new Date())
                .localDate(LocalDate.now())
                .localDateTime(LocalDateTime.now())
                .booleanField(true)
                .build();

        return restDto;
    }

    @Bean
    public Set<RestDto> getRestDtoRepository() {
        final Set<RestDto> data = Collections
                .synchronizedSet(new LinkedHashSet<>());
        IntStream.range(1, 100).forEach(i -> {
            RestDto restDto = this.getRandomDto(i);
            data.add(restDto);
        });
        return data;
    }

    @Bean
    public CommandLineRunner springBootMain() throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");
        };
    }

}
