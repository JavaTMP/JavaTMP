package com.javatmp.demo;

import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;
import java.util.stream.IntStream;

@Component
@Slf4j
public class ProducerRunner implements CommandLineRunner {

    private final RabbitTemplate rabbitTemplate;
    private final MsgReceiver receiver;

    public ProducerRunner(MsgReceiver receiver, RabbitTemplate rabbitTemplate) {
        this.receiver = receiver;
        this.rabbitTemplate = rabbitTemplate;
    }

    @Override
    public void run(String... args) throws Exception {
        IntStream.range(0, 1000).forEach(i -> {
            try {
                log.info("Sending message... {}", i);
                rabbitTemplate.convertAndSend(MessagingRabbitmqApplication.topicExchangeName, "foo.bar.baz", "Hello from RabbitMQ!");
                receiver.getLatch().await(10000, TimeUnit.MILLISECONDS);
            } catch (InterruptedException e) {
                log.error("error", e);
            }
        });

    }

}
