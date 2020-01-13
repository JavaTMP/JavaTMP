package com.javatmp.module.accounting.controller;

import com.javatmp.module.accounting.entity.Account;
import com.javatmp.module.accounting.entity.AccountGroup;
import com.javatmp.module.accounting.service.AccountGroupService;
import com.javatmp.module.accounting.service.AccountService;
import com.javatmp.module.user.entity.User;
import java.math.BigDecimal;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Slf4j
@Controller
public class AccountPageController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private AccountGroupService accountGroupService;

    @GetMapping(value = "/accounting/AddNewAccountPopup")
    public String AddNewAccountPopup(Model model) {
        List<Account> accounts = accountService.findAll(0, Integer.MAX_VALUE);
        List<AccountGroup> accountGroups = accountGroupService.findAll(0, Integer.MAX_VALUE);
        model.addAttribute("accounts", accounts);
        model.addAttribute("accountGroups", accountGroups);
        return "/pages/accounting/addNewAccountPopup.jsp";
    }

    @GetMapping(value = "/accounting/UpdateAccountPopup")
    public String UpdateAccountPopup(@SessionAttribute User user, Account account, Model model) {
        log.info("request account is [" + (account) + "]");
        Account dbAccount = accountService.readAccountById(account);
        log.info("DB account to be Updated is [" + (dbAccount) + "]");

        log.debug("loged in user is {}", user);
        List<Account> accounts = accountService.findAll(0, Integer.MAX_VALUE);
        List<AccountGroup> accountGroups = accountGroupService.findAll(0, Integer.MAX_VALUE);
        model.addAttribute("accounts", accounts);
        model.addAttribute("accountGroups", accountGroups);
        model.addAttribute("account", dbAccount);
        return "/pages/accounting/updateAccountPopup.jsp";
    }

    @GetMapping("/accounting/ViewTrialBalance")
    protected String ViewTrialBalance(Model model) {
        List<Account> accounts = accountService.getLeafAccountsForTrialBalance();
        Account totalBalance = new Account();
        totalBalance.setDebit(BigDecimal.ZERO);
        totalBalance.setCredit(BigDecimal.ZERO);
        for (Account account : accounts) {
            if (account.getAccountGroup().getType().getDebitSign() == 1) {
                totalBalance.setDebit(totalBalance.getDebit().add(account.getBalance()));
            } else if (account.getAccountGroup().getType().getCreditSign() == 1) {
                totalBalance.setCredit(totalBalance.getCredit().add(account.getBalance()));
            }
        }
        model.addAttribute("totalBalance", totalBalance);
        model.addAttribute("accounts", accounts);

        return "/pages/accounting/reports/trial-balance.jsp";
    }

    @GetMapping("/accounting/CreateTransaction")
    public String CreateTransaction(Model model) {
        List<Account> accounts = accountService.getLeafAccounts();
        model.addAttribute("accounts", accounts);
        return "/pages/accounting/createTransaction.jsp";
    }
}
