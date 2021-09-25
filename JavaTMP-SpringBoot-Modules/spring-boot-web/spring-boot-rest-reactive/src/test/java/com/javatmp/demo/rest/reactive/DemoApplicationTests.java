package com.javatmp.demo.rest.reactive;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.web.server.LocalServerPort;

import java.util.Set;

import static org.assertj.core.api.Assertions.assertThat;


@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
@Slf4j
class DemoApplicationTests {

    @LocalServerPort
    private int port;

    @Autowired
    private MonoRestAPIController monoRestAPIController;

    @Autowired
    private TestRestTemplate restTemplate;

    @Test
    void contextLoads() {
        assertThat(monoRestAPIController).isNotNull();
        log.debug("check runner : {} injected successfully", this.monoRestAPIController
                .toString());

    }
    @Test
    void getAllTest()  throws Exception {
        assertThat(this.restTemplate.getForObject("http://localhost:" + port + "/rest/get",
                Set.class)).isNotEmpty();
    }

}
