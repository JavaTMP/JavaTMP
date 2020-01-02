package com.javatmp.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

@Slf4j
@Controller
public class IndexController {

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    public String doGet(HttpServletRequest request, HttpServletResponse response) {
        return "/WEB-INF/index.jsp";
    }
}
