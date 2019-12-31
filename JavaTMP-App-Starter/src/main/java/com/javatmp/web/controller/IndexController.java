package com.javatmp.web.controller;

import java.io.IOException;
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
public class IndexController {

    @RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
    }
}
