package com.javatmp;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.boot.web.server.LocalServerPort;

@Slf4j
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
class JavaTmpAppStarterApplicationTest {

    @LocalServerPort
    int randomServerPort;

    @Test
    void contextLoads() {
        log.info("Spring Boot app runnin on port : {}", randomServerPort);
    }

    @Test
    void test_db() {
        log.info("test_db = Spring Boot app runnin on port : {}", randomServerPort);
    }

}
