package com.javatmp.web.controller.util;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/util/AjaxSleeperController")
public class AjaxSleeperController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String sleepPeriodStr = request.getParameter("sleep");
            long sleepSecond = Long.valueOf(sleepPeriodStr);
            Thread.sleep(sleepSecond * 1000);
            String className = this.getClass().getName();
            String data = "Remote Controller Name [" + className + "].<br/>";
            data += "Remote Server Controller Sleep for [" + sleepPeriodStr + "] Seconds";

            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(data);
        } catch (InterruptedException ex) {
            Logger.getLogger(AjaxSleeperController.class.getName()).log(Level.SEVERE, "error during sleeping", ex);
        }

    }
}
