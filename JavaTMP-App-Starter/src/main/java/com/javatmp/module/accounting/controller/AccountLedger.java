package com.javatmp.module.accounting.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.module.accounting.entity.Account;
import com.javatmp.module.accounting.service.AccountService;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/accounting/AccountLedger")
public class AccountLedger extends HttpServlet {

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
        return responseMessage;

    }

}
