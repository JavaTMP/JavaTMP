/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.accounting;

import com.javatmp.module.accounting.Account;
import com.javatmp.module.accounting.AccountService;
import com.javatmp.util.JpaDaoHelper;
import com.javatmp.module.theme.ThemeService;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.ParseException;

/**
 *
 * @author JavaTMP
 */
public class TestingAccounting {

    public static void main(String[] args) throws SQLException, ParseException {
        JpaDaoHelper jpaDaoHelper;
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        AccountService accountService = new AccountService(jpaDaoHelper);

        Account rootCompanyAccount = new Account(1L, "1000000", "Company", "Main Company Root Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 0, null, 1);
        Account asset = new Account(2L, "0100000", "Assets", "Main Company Assets Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 1, 1L, 1);
        Account liability = new Account(3L, "0200000", "Liabilities", "Main Company Liabilities Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 2, 1L, 1);
        Account equity = new Account(4L, "0300000", "Equity", "Main Company equities Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 5, 1L, 1);
        Account income = new Account(5L, "0400000", "Incomes", "Main Company Incomes Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 3, 1L, 1);
        Account expense = new Account(6L, "0500000", "Expense", "Main Company Expenses Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 4, 1L, 1);
        Account general1 = new Account(7L, "2000000", "general1", "Main Company Root Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 0, null, 1);
        Account general2 = new Account(8L, "3000000", "general2", "Main Company Root Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 0, null, 1);
        Account general3 = new Account(9L, "4000000", "general3", "Main Company Root Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 0, null, 1);
        accountService.createNewAccount(rootCompanyAccount);
        accountService.createNewAccount(asset);
        accountService.createNewAccount(liability);
        accountService.createNewAccount(equity);
        accountService.createNewAccount(income);
        accountService.createNewAccount(expense);
        accountService.createNewAccount(general1);
        accountService.createNewAccount(general2);
        accountService.createNewAccount(general3);

    }

}
