package com.javatmp.demo.war;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping({"", "/"})
public class IndexRestController {
    @GetMapping
    public String index() {
        return "Hello Spring Boot 2.0!";
    }
}
