package com.javatmp.demo.war;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
public class IndexRestController {
    @RequestMapping("/index")
    public String index() {
        return "Hello Spring Boot 2.0!";
    }
}
