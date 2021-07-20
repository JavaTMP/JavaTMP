package com.javatmp.demo.mq.producer;

import com.javatmp.demo.mq.domain.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class ProducerRunner implements CommandLineRunner {


    private RabbitMqSender rabbitMqSender;

    @Autowired
    public ProducerRunner(RabbitMqSender rabbitMqSender) {
        this.rabbitMqSender = rabbitMqSender;
    }

    @Value("${app.message}")
    private String message;

    public String publishUserDetails(User user) {
        rabbitMqSender.send(user);
        return message;
    }

    @Override
    public void run(String... args) throws Exception {
        log.info("create user and send it ");
        User user = new User(10L, "user 1");

        rabbitMqSender.send(user);
    }
}
