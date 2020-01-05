package com.javatmp.module.accounting.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.mvc.MvcHelper;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@Controller
public class UpdateAccountPopup {

    @Autowired
    private AccountService accountService;

    @Autowired
    private AccountGroupService accountGroupService;

    @GetMapping(value = "/accounting/UpdateAccountPopup")
    public ModelAndView doGet(@SessionAttribute User user, Account account, ModelAndView modelAndView, HttpServletRequest request, HttpServletResponse response) {
        String requestPage = "/pages/accounting/updateAccountPopup.jsp";

        log.info("request account is [" + MvcHelper.deepToString(account) + "]");
        Account dbAccount = accountService.readAccountById(account);
        log.info("DB account to be Updated is [" + MvcHelper.deepToString(dbAccount) + "]");

        log.debug("loged in user is {}", user);
        List<Account> accounts = accountService.findAll(0, Integer.MAX_VALUE);
        List<AccountGroup> accountGroups = accountGroupService.findAll(0, Integer.MAX_VALUE);
        modelAndView.addObject("accounts", accounts);
        modelAndView.addObject("accountGroups", accountGroups);
        modelAndView.addObject("account", dbAccount);
        modelAndView.setViewName(requestPage);
        return modelAndView;

    }

    @PostMapping(value = "/accounting/UpdateAccountPopup")
    public @ResponseBody
    ResponseMessage doPost(Account accountToBeUpdated, HttpServletRequest request,
            HttpServletResponse response) {

        ResponseMessage responseMessage = new ResponseMessage();

        log.info("account to be Updated is [" + MvcHelper.toString(accountToBeUpdated) + "]");
        int updateStatus = accountService.updateAccount(accountToBeUpdated);
        responseMessage.setOverAllStatus(Boolean.TRUE);
        responseMessage.setMessage("Account Updated successfully");
        responseMessage.setData(accountToBeUpdated);
        return responseMessage;

    }

}
