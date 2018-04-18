package com.javatmp.web.controller.tree;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.domain.Account;
import com.javatmp.mvc.ClassTypeAdapter;
import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/tree/chartOfAccounts")
public class ChartOfAccountsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("ChartOfAccountsController");
        ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        List<Account> chartOfAccounts = sf.getAccountService().getChartOfAccounts();

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
