package com.javatmp.web.controller.card;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/card/AjaxTextContentCardController")
public class AjaxTextContentCardController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String className = this.getClass().getName();
            String data = "Remote Controller Name [" + className + "].<br/>";
            data += "Simple data returns from server.";

            long sleepSecond = Long.valueOf(2);
            Thread.sleep(sleepSecond * 1000);

            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(data);
        } catch (InterruptedException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "error during sleeping", ex);
        }

    }
}
