package com.javatmp.module.accounting.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.module.accounting.entity.Account;
import com.javatmp.module.accounting.service.AccountService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
public class ChartOfAccountsController {

    @Autowired
    private AccountService accountService;

    @GetMapping(value = "/accounting/chartOfAccounts")
    public String doGet(HttpServletRequest request, HttpServletResponse response) {
        return "/pages/accounting/chart-of-accounts.jsp";
    }

    @PostMapping(value = "/accounting/chartOfAccounts")
    public @ResponseBody
    ResponseMessage doPost(HttpServletRequest request, HttpServletResponse response) {
        List<Account> chartOfAccounts = accountService.getChartOfAccounts();
        ResponseMessage responseMessage = new ResponseMessage();
        responseMessage.setOverAllStatus(true);
        responseMessage.setData(chartOfAccounts);
        return responseMessage;
    }

}
