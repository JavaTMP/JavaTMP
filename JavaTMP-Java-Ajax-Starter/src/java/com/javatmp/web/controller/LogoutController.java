package com.javatmp.web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("*** we should logout current user and redirect him to login page");
        HttpSession session = request.getSession();
        session.setAttribute("user", null);
        session.removeAttribute("user");
        session.invalidate();

        response.sendRedirect(request.getContextPath() + "/login");
    }
}
