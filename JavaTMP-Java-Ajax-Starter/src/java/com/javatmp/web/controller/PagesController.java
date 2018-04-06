package com.javatmp.web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/pages/*")
public class PagesController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String requestPath = request.getPathInfo();
        String requestPage = "/WEB-INF/jsp/pages" + requestPath + ".jsp";
        System.out.println("Request Page [" + requestPage + "]");

        request.getRequestDispatcher(requestPage).forward(request, response);

    }
}
