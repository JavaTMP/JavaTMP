package com.javatmp.demo.jpa.paging;

import com.javatmp.demo.jpa.paging.DemoApplication;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest(classes = DemoApplication.class)
@Slf4j
class DemoApplicationTests {

    @Test
    void contextLoads1() {
        log.debug("*** SpringBoot Test Context Load 1 ***");
    }

    @Test
    void contextLoads2() {
        log.debug("*** SpringBoot Test Context Load 2 ***");
    }

}
