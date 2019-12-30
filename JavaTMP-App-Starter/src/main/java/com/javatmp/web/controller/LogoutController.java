package com.javatmp.web.controller;

import java.io.IOException;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        logger.info("*** we should logout current user and redirect him to login page");
        HttpSession session = request.getSession();
//        session.setAttribute(Constants.LANGUAGE_ATTR_KEY, null);
//        session.removeAttribute(Constants.LANGUAGE_ATTR_KEY);
        session.setAttribute("user", null);
        session.removeAttribute("user");

        response.sendRedirect(request.getContextPath() + "/login");
    }
}
