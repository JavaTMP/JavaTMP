package com.javatmp.module.accounting.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.module.accounting.entity.Transaction;
import com.javatmp.module.accounting.service.TransactionService;
import java.text.ParseException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
public class ListTransactions {

    @Autowired
    TransactionService accountService;

    @PostMapping("/accounting/listTransactions")
    public @ResponseBody
    ResponseMessage doPost(@RequestBody DataTableRequest tableRequest, ResponseMessage responseMessage) throws ParseException {

        DataTableResults<Transaction> dataTableResult = accountService.listAllTransactions(tableRequest);
        responseMessage.setOverAllStatus(true);
        responseMessage.setData(dataTableResult);
        return responseMessage;

    }
}
