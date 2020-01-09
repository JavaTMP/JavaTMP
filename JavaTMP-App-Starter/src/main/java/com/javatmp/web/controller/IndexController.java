package com.javatmp.web.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

@Slf4j
@Controller
public class IndexController {

    @Autowired
    ServletContext context;

    @Autowired
    ApplicationContext applicationContext;

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    public String doGet(HttpServletRequest request, HttpServletResponse response) {

        WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(context);
        log.debug("context is [" + ctx + "]");
        log.debug("application context is [" + applicationContext + "]");
        return "/index.jsp";
    }
}
