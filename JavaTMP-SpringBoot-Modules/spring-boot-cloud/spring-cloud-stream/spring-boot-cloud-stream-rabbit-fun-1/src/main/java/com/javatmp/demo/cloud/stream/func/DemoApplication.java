package com.javatmp.demo.cloud.stream.func;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.cloud.function.context.PollableBean;
import org.springframework.cloud.stream.function.StreamBridge;
import org.springframework.context.annotation.Bean;
import org.springframework.messaging.Message;
import org.springframework.messaging.support.MessageBuilder;

import java.util.function.Consumer;
import java.util.function.Supplier;

/**
 * Spring Boot Main Runner Class
 */
@SpringBootApplication
@Slf4j
@RefreshScope
@EnableDiscoveryClient
public class DemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

    @PollableBean
    public Supplier<String> messageSupplier() {
        return () -> {
            log.debug("calling message Supplier");
            return "welcome to first message";
        };
    }

    @Bean
    public Consumer<Message<String>> messageProcessor() {
        return message -> {
            String msg = message.getPayload();
            log.info("Process message created: {}", msg);
        };
    }

    @Bean
    public CommandLineRunner springBootMain(StreamBridge streamBridge) throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");

            String msg = "From within command line runner";
            Message message = MessageBuilder.withPayload(msg)
//                    .setHeader("partitionKey", "partionKey")
                    .build();
            streamBridge.send("messageProcessor-in-0", message);

        };
    }

}
