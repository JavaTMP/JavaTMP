/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.accounting;

import com.javatmp.module.accounting.Account;
import com.javatmp.module.accounting.AccountService;
import com.javatmp.module.accounting.Accountgroup;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.util.JpaDaoHelper;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

/**
 *
 * @author JavaTMP
 */
public class TestingAccounting {

    public static void main(String[] args) throws SQLException, ParseException {
        JpaDaoHelper jpaDaoHelper;
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        AccountService accountService = new AccountService(jpaDaoHelper);
        jpaDaoHelper.findAll(Account.class);
        jpaDaoHelper.findAll(Accountgroup.class);
        Account rootCompanyAccount = new Account(1L, "1000000", "Company", "Main Company Root Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, null, null, 1);
        Account asset = new Account(2L, "0100000", "Assets", "Main Company Assets Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 1, 1L, 1);
        Account liability = new Account(3L, "0200000", "Liabilities", "Main Company Liabilities Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 2, 1L, 1);
        Account equity = new Account(4L, "0300000", "Equity", "Main Company equities Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 3, 1L, 1);
        Account income = new Account(5L, "0400000", "Incomes", "Main Company Incomes Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 4, 1L, 1);
        Account expense = new Account(6L, "0500000", "Expense", "Main Company Expenses Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 5, 1L, 1);
        Account general1 = new Account(7L, "2000000", "general1", "Main Company Root Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, null, null, 1);
        Account general2 = new Account(8L, "3000000", "general2", "Main Company Root Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, null, null, 1);
        Account general3 = new Account(9L, "4000000", "general3", "Main Company Root Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, null, null, 1);
        accountService.mergeAccount(rootCompanyAccount);
        accountService.mergeAccount(asset);
        accountService.mergeAccount(liability);
        accountService.mergeAccount(equity);
        accountService.mergeAccount(income);
        accountService.mergeAccount(expense);
        accountService.mergeAccount(general1);
        accountService.mergeAccount(general2);
        accountService.mergeAccount(general3);

        List<Account> accounts = accountService.getChartOfAccounts();

        for (Account acct : accounts) {
            System.out.println(MvcHelper.toString(acct));
        }

    }

}
