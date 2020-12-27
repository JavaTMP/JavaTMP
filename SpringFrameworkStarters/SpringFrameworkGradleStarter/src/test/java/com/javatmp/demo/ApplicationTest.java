package com.javatmp.demo;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import static org.junit.jupiter.api.Assertions.assertEquals;

@Slf4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = { Application.class })
public class ApplicationTest {
    @Test
    void addition() {
        log.info("Spring JUnit Test Starting");
        assertEquals(2, 2);
    }

}
