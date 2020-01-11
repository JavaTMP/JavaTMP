package com.javatmp.module.accounting.controller;

import com.javatmp.module.accounting.entity.Account;
import com.javatmp.module.accounting.service.AccountService;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import javax.servlet.ServletException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class ViewTrialBalance {

    @Autowired
    private AccountService accountService;

    @GetMapping("/accounting/ViewTrialBalance")
    protected String doGet(Model model) throws ServletException, IOException {

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

}
