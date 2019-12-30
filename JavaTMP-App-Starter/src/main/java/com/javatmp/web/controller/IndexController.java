package com.javatmp.web.controller;

import javax.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
public class IndexController {

    @RequestMapping("")
//    @ResponseBody
    public String index() {
        log.debug("index page is being calling");
        return "/WEB-INF/index.jsp";
    }

    @RequestMapping("/pages/**")
    public String pages(HttpServletRequest request) {
        String requestURI = request.getRequestURI();
        System.out.println("request path is [" + requestURI + "]");
        log.debug("request path is [" + requestURI + "]");
        String requestPage = null;
        if (!requestURI.endsWith(".html")) {
            requestPage = "/WEB-INF" + requestURI + ".jsp";
        } else {
            requestPage = "/WEB-INF" + requestURI;
        }
        log.info("Request Page [" + requestPage + "]");
        return requestPage;
    }

}
