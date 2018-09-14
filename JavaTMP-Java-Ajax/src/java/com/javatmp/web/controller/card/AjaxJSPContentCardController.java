package com.javatmp.web.controller.card;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/card/ajaxJSPContentCardController")
public class AjaxJSPContentCardController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String requestPage = "/WEB-INF/pages/custom-components/ajax/ajaxJSPContentCard.jsp";

            String className = this.getClass().getName();
            request.setAttribute("className", className);

            long sleepSecond = Long.valueOf(2);
            Thread.sleep(sleepSecond * 1000);

            request.getRequestDispatcher(requestPage).forward(request, response);
        } catch (InterruptedException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "error during sleeping", ex);
        }
    }
}
