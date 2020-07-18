package com.javatmp.demo;

import com.javatmp.demo.WelcomeService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.test.context.SpringBootTest;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@Slf4j
class DemoApplicationTests {

    @Autowired
    private WelcomeService welcomeService;

    @Test
    void contextLoads1() {
        log.debug("*** SpringBoot Test Context Load 1 ***");
    }

    @Test
    void contextLoads2() {
        log.debug("*** SpringBoot Test Context Load 2 ***");
        log.debug("Message from welcome service is : {}", welcomeService.getWelcomeMessage());
        assertThat(welcomeService.getWelcomeMessage()).isNotNull();
    }

    @SpringBootApplication
    static class TestConfiguration {
    }

}
