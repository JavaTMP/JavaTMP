package com.javatmp.web.controller.accounting;

import com.javatmp.web.controller.*;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.domain.Account;
import com.javatmp.mvc.ClassTypeAdapter;
import com.javatmp.mvc.ResponseMessage;
import com.javatmp.service.ServicesFactory;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;
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
        System.out.println("ChartOfAccountsController");
        List<Account> chartOfAccounts = ServicesFactory.getInstance().getAccountService().getChartOfAccounts();

        Gson gson = new GsonBuilder().serializeNulls()
                .registerTypeAdapter(Class.class, new ClassTypeAdapter())
                .create();
        String json = gson.toJson(chartOfAccounts);
        System.out.println("loginController response [" + json + "]");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);

    }

}
