package com.javatmp.demo;

import com.javatmp.demo.service.DateTimeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;

@Slf4j
@Component
@ComponentScan
public class Application {

    @Autowired
    private DateTimeService dateTimeService;

    public static void main(String[] args) {

        AnnotationConfigApplicationContext ctx =
                new AnnotationConfigApplicationContext(Application.class);

        Application bean = ctx.getBean(Application.class);
        bean.run();

        ctx.close();
    }

    public void run() {
        log.info("Current time: {}", dateTimeService.getTime());
        log.info("Current date: {}", dateTimeService.getDate());
        log.info("Current datetime: {}", dateTimeService.getDateTime());
    }
}
