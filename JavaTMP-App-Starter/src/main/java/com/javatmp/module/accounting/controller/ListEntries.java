package com.javatmp.module.accounting.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.module.accounting.entity.TransactionEntry;
import com.javatmp.module.accounting.service.TransactionEntryService;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.text.ParseException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
public class ListEntries {

    @PostMapping("/accounting/ListEntries")
    public @ResponseBody
    ResponseMessage doPost(@RequestBody DataTableRequest tableRequest, HttpServletRequest request, HttpServletResponse response) throws ParseException {

        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        TransactionEntryService transactionEntryService = sf.getTransactionEntryService();

        DataTableResults<TransactionEntry> dataTableResult = transactionEntryService.listAllTransactionEntry(tableRequest);
        responseMessage.setOverAllStatus(true);
        responseMessage.setData(dataTableResult);
        return responseMessage;

    }
}
