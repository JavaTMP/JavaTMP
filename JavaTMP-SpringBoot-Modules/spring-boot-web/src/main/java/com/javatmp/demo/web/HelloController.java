package com.javatmp.demo.web;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/demo")
public class HelloController {

    @RequestMapping("/")
    public String index() {
        return "Hello Spring Boot!";
    }

    @RequestMapping(path = "/{name}/{age}")
    public String getMessage(@PathVariable("name") String name,
                             @PathVariable("age") String age) {
        String msg = String.format("%s is %s years old", name, age);
        return msg;
    }
}
