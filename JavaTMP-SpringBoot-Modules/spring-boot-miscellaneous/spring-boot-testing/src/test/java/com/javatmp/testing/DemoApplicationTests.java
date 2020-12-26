package com.javatmp.testing;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class DemoApplicationTests {

    @Test
    void welcomeLogTest1() {
        log.debug("*** SpringBoot Test Context Load 1 ***");
    }

}
