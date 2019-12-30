package com.javatmp.module.accounting.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.module.accounting.entity.TransactionEntry;
import com.javatmp.module.accounting.service.TransactionEntryService;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.io.IOException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/accounting/ListEntries")
public class ListEntries extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            ResponseMessage responseMessage = new ResponseMessage();
            ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
            TransactionEntryService transactionEntryService = sf.getTransactionEntryService();
            DataTableRequest tableRequest = (DataTableRequest) MvcHelper.readObjectFromRequest(request, DataTableRequest.class);
            DataTableResults<TransactionEntry> dataTableResult = transactionEntryService.listAllTransactionEntry(tableRequest);
            responseMessage.setOverAllStatus(true);
            responseMessage.setData(dataTableResult);
            MvcHelper.sendMessageAsJson(response, responseMessage);
        } catch (ParseException ex) {
            logger.log(Level.SEVERE, null, ex);
            throw new ServletException("@ListUsersController", ex);
        }

    }
}
