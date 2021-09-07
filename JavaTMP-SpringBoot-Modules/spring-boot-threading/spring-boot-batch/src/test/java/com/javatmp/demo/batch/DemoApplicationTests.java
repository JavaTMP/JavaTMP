package com.javatmp.demo.batch;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.batch.test.context.SpringBatchTest;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;
import org.springframework.test.context.support.DirtiesContextTestExecutionListener;

//@SpringBootTest
@Slf4j
@SpringBatchTest
@EnableAutoConfiguration
@ContextConfiguration
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class,
        DirtiesContextTestExecutionListener.class})
@DirtiesContext(classMode = DirtiesContext.ClassMode.AFTER_CLASS)
class DemoApplicationTests {

    /**
     * For more spring boot batch test see :
     * https://github.com/eugenp/tutorials/tree/master/spring-batch
     */

    @Test
    void contextLoads1() {
        log.debug("*** SpringBoot Test Context Load 1 ***");
    }

}
