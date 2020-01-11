package com.javatmp.module.accounting.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.module.accounting.entity.Account;
import com.javatmp.module.accounting.entity.Transaction;
import com.javatmp.module.accounting.service.AccountService;
import java.util.Date;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
public class CreateTransaction {

    @Autowired
    AccountService accountService;

    @GetMapping("/accounting/CreateTransaction")
    public String doGet(Model model) {
        List<Account> accounts = accountService.getLeafAccounts();
        model.addAttribute("accounts", accounts);
        return "/pages/accounting/createTransaction.jsp";
    }

    @PostMapping("/accounting/CreateTransaction")
    public @ResponseBody
    ResponseMessage doPost(@RequestBody Transaction toBe, ResponseMessage responseMessage) {

        log.info("Transaction to be Created [" + (toBe) + "]");
        toBe.setCreationDate(new Date());
        toBe.setStatus((short) 1);
        accountService.createNewTransaction(toBe);
        responseMessage.setOverAllStatus(true);
        responseMessage.setTitle("Success Creation");
        responseMessage.setMessage("Transaction created successfully");
        responseMessage.setData(toBe);
        return responseMessage;
    }

}
