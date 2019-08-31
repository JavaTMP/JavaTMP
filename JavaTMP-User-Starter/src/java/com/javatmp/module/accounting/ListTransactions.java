package com.javatmp.module.accounting;

import com.javatmp.module.accounting.*;
import com.javatmp.mvc.domain.table.DataTableRequest;
import com.javatmp.mvc.domain.table.DataTableResults;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.util.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/accounting/listTransactions")
public class ListTransactions extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String requestPage = "/WEB-INF/pages/accounting/listTransactions.jsp";

        ServletContext context = request.getServletContext();
        ServicesFactory sf = (ServicesFactory) context.getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        AccountService accountService = sf.getAccountService();

        request.getRequestDispatcher(requestPage).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            ResponseMessage responseMessage = new ResponseMessage();
            ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
            AccountService accountService = sf.getAccountService();
            DataTableRequest tableRequest = (DataTableRequest) MvcHelper.readObjectFromRequest(request, DataTableRequest.class);
            DataTableResults<Transaction> dataTableResult = accountService.listAllTransactions(tableRequest);
            responseMessage.setOverAllStatus(true);
            responseMessage.setData(dataTableResult);
            MvcHelper.sendMessageAsJson(response, responseMessage);
        } catch (ParseException ex) {
            logger.log(Level.SEVERE, null, ex);
            throw new ServletException("@ListUsersController", ex);
        }

    }
}
