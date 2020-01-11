package com.javatmp.module.accounting.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.module.accounting.entity.Account;
import com.javatmp.module.accounting.entity.AccountGroup;
import com.javatmp.module.accounting.service.AccountGroupService;
import com.javatmp.module.accounting.service.AccountService;
import com.javatmp.module.user.entity.User;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

@Slf4j
@Controller
public class UpdateAccountPopup {

    @Autowired
    private AccountService accountService;

    @Autowired
    private AccountGroupService accountGroupService;

    @GetMapping(value = "/accounting/UpdateAccountPopup")
    public String doGet(@SessionAttribute User user, Account account, Model model) {
        String requestPage = "/pages/accounting/updateAccountPopup.jsp";

        log.info("request account is [" + (account) + "]");
        Account dbAccount = accountService.readAccountById(account);
        log.info("DB account to be Updated is [" + (dbAccount) + "]");

        log.debug("loged in user is {}", user);
        List<Account> accounts = accountService.findAll(0, Integer.MAX_VALUE);
        List<AccountGroup> accountGroups = accountGroupService.findAll(0, Integer.MAX_VALUE);
        model.addAttribute("accounts", accounts);
        model.addAttribute("accountGroups", accountGroups);
        model.addAttribute("account", dbAccount);
        return requestPage;

    }

    @PostMapping(value = "/accounting/UpdateAccountPopup")
    public @ResponseBody
    ResponseMessage doPost(Account accountToBeUpdated, HttpServletRequest request,
            HttpServletResponse response) {

        ResponseMessage responseMessage = new ResponseMessage();

        log.info("account to be Updated is [" + (accountToBeUpdated) + "]");
        int updateStatus = accountService.updateAccount(accountToBeUpdated);
        responseMessage.setOverAllStatus(Boolean.TRUE);
        responseMessage.setMessage("Account Updated successfully");
        responseMessage.setData(accountToBeUpdated);
        return responseMessage;

    }

}
