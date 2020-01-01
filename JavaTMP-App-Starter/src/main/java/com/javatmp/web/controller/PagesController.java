package com.javatmp.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
public class PagesController {

    @RequestMapping("/pages/**")
    protected String doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String requestUrl = request.getRequestURI();
        log.debug("request url [" + requestUrl + "]");
        String requestPage = "/WEB-INF" + requestUrl + ".jsp";
        log.info("Request Page [" + requestPage + "]");
        return requestPage;
    }
}
