package com.javatmp.module.accounting.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.module.accounting.entity.Account;
import com.javatmp.module.accounting.service.AccountService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
public class GeneralLedger {

    @Autowired
    AccountService accountService;

    @PostMapping("/accounting/GeneralLedger")
    public @ResponseBody
    ResponseMessage doPost(@RequestBody DataTableRequest tableRequest, HttpServletRequest request, HttpServletResponse response) {
        ResponseMessage responseMessage = new ResponseMessage();

        List<Account> generalLedgerAccounts = accountService.getGeneralLedgerAccounts();
        DataTableResults<Account> dataTableResult = new DataTableResults<>();

        dataTableResult.setData(generalLedgerAccounts);
        dataTableResult.setRecordsTotal(Long.valueOf(generalLedgerAccounts.size()));
        dataTableResult.setRecordsFiltered(Long.valueOf(generalLedgerAccounts.size()));
        dataTableResult.setDraw(tableRequest.getDraw());
        responseMessage.setOverAllStatus(true);
        responseMessage.setData(dataTableResult);
        return responseMessage;

    }

}
