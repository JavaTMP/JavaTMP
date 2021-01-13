package com.javatmp.demo.war;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping({"", "/"})
public class IndexController {

    @GetMapping
    public String get() {
        log.info("page requested Controller");
        return "/index.jsp";
    }
}
