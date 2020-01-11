package com.javatmp.module.accounting.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.module.accounting.entity.Account;
import com.javatmp.module.accounting.service.AccountService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
public class DeleteAccountController {

    @Autowired
    AccountService accountService;

    @PostMapping("/accounting/DeleteAccountController")
    public @ResponseBody
    ResponseMessage doPost(@RequestBody Account accountToBeDeleted, ResponseMessage responseMessage) {

        log.info("Account to be deleted is [" + (accountToBeDeleted) + "]");

        int updateStatus = this.accountService.deleteAccount(accountToBeDeleted);

        responseMessage.setOverAllStatus(true);
        responseMessage.setTitle("Accounting Deleted");
        responseMessage.setMessage("Account deleted successfully with status " + updateStatus);
        responseMessage.setData(accountToBeDeleted);

        return responseMessage;

    }
}
