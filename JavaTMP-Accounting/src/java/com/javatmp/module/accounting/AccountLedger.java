package com.javatmp.module.accounting;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.mvc.domain.table.DataTableRequest;
import com.javatmp.mvc.domain.table.DataTableResults;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/accounting/AccountLedger")
public class AccountLedger extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String requestPage = "/WEB-INF/pages/accounting/account-ledger.jsp";
        ServletContext context = request.getServletContext();
        ServicesFactory sf = (ServicesFactory) context.getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        request.getRequestDispatcher(requestPage).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        AccountService accountService = sf.getAccountService();
        List<Account> generalLedgerAccounts = accountService.getGeneralLedgerAccounts();
        DataTableResults<Account> dataTableResult = new DataTableResults<>();
        DataTableRequest tableRequest = (DataTableRequest) MvcHelper.readObjectFromRequest(request, DataTableRequest.class);
        dataTableResult.setData(generalLedgerAccounts);
        dataTableResult.setRecordsTotal(Long.valueOf(generalLedgerAccounts.size()));
        dataTableResult.setRecordsFiltered(Long.valueOf(generalLedgerAccounts.size()));
        dataTableResult.setDraw(tableRequest.getDraw());
        responseMessage.setOverAllStatus(true);
        responseMessage.setData(dataTableResult);
        MvcHelper.sendMessageAsJson(response, responseMessage);

    }

}
