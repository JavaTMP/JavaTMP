package com.javatmp.web.controller;

import java.io.IOException;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
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
public class PagesController {

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping("/pages/**")
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String requestUrl = request.getRequestURI();
        log.debug("request url [" + requestUrl + "]");

        String requestPage = null;
        if (!requestUrl.endsWith(".html")) {
            requestPage = "/WEB-INF" + requestUrl + ".jsp";
        } else {
            requestPage = "/WEB-INF" + requestUrl;
        }
        log.info("Request Page [" + requestPage + "]");

        request.getRequestDispatcher(requestPage).forward(request, response);

    }
}
