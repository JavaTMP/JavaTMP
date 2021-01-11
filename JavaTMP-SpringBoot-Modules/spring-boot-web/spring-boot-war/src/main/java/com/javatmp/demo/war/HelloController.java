package com.javatmp.demo.war;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
public class HelloController {
    @RequestMapping("/hello")
    public String hello() {
        log.info("page requested Controller");
        return "/hello.jsp";
    }

    @RequestMapping("/page")
    public String page() {
        log.info("page requested Controller");
        return "/page.jsp";
    }
}
