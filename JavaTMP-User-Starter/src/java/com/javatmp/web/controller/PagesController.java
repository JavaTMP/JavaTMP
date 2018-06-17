package com.javatmp.web.controller;

import java.io.IOException;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/pages/*")
public class PagesController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String requestPath = request.getPathInfo();
        String requestPage = "/WEB-INF/pages" + requestPath + ".jsp";
        logger.info("Request Page [" + requestPage + "]");

        request.getRequestDispatcher(requestPage).forward(request, response);

    }
}
