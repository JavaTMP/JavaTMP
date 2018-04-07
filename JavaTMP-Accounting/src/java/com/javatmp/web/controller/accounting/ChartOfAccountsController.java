package com.javatmp.web.controller.accounting;

import com.javatmp.web.controller.*;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.mvc.ClassTypeAdapter;
import com.javatmp.mvc.ResponseMessage;
import java.io.IOException;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/accounting/chartOfAccounts")
public class ChartOfAccountsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/system/login-page.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println(request.getParameterMap());
        Enumeration<String> enumeration = request.getParameterNames();
        while (enumeration.hasMoreElements()) {
            System.out.println(request.getParameter(enumeration.nextElement()));
        }
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println("username [" + userName + "], password [" + password + "]");

        ResponseMessage responseMessage = new ResponseMessage();

        if ("admin".equals(userName) && "admin".equals(password)) {
            // Authenticated user
            HttpSession session = request.getSession();
            session.setAttribute("authenticated", new Boolean(true));

            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage(request.getContextPath());
        } else {
            // un authenticated user
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage("kindly Check your username and password");
        }

        Gson gson = new GsonBuilder().serializeNulls()
                .registerTypeAdapter(Class.class, new ClassTypeAdapter())
                .create();
        String json = gson.toJson(responseMessage);
        System.out.println("loginController response [" + json + "]");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);

    }

}
