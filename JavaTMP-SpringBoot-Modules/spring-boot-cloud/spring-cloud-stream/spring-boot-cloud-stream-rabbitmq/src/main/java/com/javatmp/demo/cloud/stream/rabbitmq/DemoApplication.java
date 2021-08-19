package com.javatmp.demo.cloud.stream.rabbitmq;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.messaging.Source;
import org.springframework.context.annotation.Bean;
import org.springframework.messaging.support.MessageBuilder;

/**
 * Spring Boot Main Runner Class
 */
@SpringBootApplication
@Slf4j
@RefreshScope
@EnableBinding(Source.class)
public class DemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

    @Value("${application.message}")
    String message;

    @Bean
    public CommandLineRunner springBootMain(Source source) throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");
            log.info("application message is : {}", message);
            log.info("Try to publish message");
            source.output().send(MessageBuilder.withPayload(message).build());
        };
    }

}
