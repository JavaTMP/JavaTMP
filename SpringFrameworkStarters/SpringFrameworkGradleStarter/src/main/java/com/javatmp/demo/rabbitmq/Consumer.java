package com.javatmp.demo.rabbitmq;


import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class Consumer {
    @RabbitListener(containerFactory = RabbitMQConfig.LISTENER_CONTAINER,
            queues = RabbitMQConfig.RABBIT_MESSAGE_QUEUE)
    public void onMessage(Message message) {
        log.info("Received Message: {}", new String(message.getBody()));
    }
}
