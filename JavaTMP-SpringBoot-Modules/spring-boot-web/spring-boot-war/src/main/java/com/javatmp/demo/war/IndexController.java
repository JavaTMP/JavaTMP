package com.javatmp.demo.war;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class IndexController {

    @GetMapping("page.html")
    public String index() {
        log.info("page requested Controller");
        return "/page.html";
    }

}
