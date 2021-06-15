package com.javatmp.demo.rabbitmq;

import com.javatmp.demo.db.ApplicationConfiguration;
import com.javatmp.demo.db.config.AppPUConfig;
import com.javatmp.demo.db.entity.User;
import com.javatmp.demo.db.repository.UserRepository;
import com.javatmp.demo.db.repository1.UserRepository1;
import com.javatmp.demo.db.service.DateTimeService;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.env.Environment;
import org.springframework.core.env.PropertiesPropertySource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceUnit;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;
import java.util.stream.IntStream;

@Slf4j
@Component
@ComponentScan
public class RabbitMQApplication {

    @Value("${db.username}")
    private String dbUser;

    @Autowired
    private Environment env;

    @Autowired
    RabbitTemplate rabbitTemplate;

    public static void main(String[] args) throws IOException {

        AnnotationConfigApplicationContext ctx =
                new AnnotationConfigApplicationContext();

        Properties props = PropertiesLoaderUtils.loadAllProperties("my.properties");
        ctx.getEnvironment().getPropertySources().addLast(new PropertiesPropertySource("myProps", props));
        ctx.register(RabbitMQApplication.class);
        ctx.refresh();
        RabbitMQApplication bean = ctx.getBean(RabbitMQApplication.class);
        bean.run();

        final Thread mainThread = Thread.currentThread();
        Runtime.getRuntime().addShutdownHook(new Thread() {
            @SneakyThrows
            public void run() {
                log.info("*** Application Shutdown Starting ***");
                ctx.close();
                mainThread.join(5 * 1000);
                log.info("*** Application Shutdown End ***");
            }
        });
    }

    public void run() {
        log.info("env is : {}", env);
        log.info("data user is : {}", this.dbUser);

        log.info("Sending bank account information....");
        IntStream.range(0, 1000).forEach(i -> {
            log.info("Sending bank account id = " + i);
            rabbitTemplate.convertAndSend(new Account(i, "Savings Account " + i));
        });
    }

}
