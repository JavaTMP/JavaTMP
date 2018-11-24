/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.module.accounting;

import com.javatmp.util.JpaDaoHelper;
import java.math.BigDecimal;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Logger;

/**
 *
 * @author m_dar
 */
public class AccountService {

    private final Logger logger = Logger.getLogger(getClass().getName());
    private final JpaDaoHelper jpaDaoHelper;

    public AccountService(JpaDaoHelper jpaDaoHelper) {
        this.jpaDaoHelper = jpaDaoHelper;
    }

    public List<Account> getChartOfAccounts() {
        List<Account> chartOfAccounts = new LinkedList<>();
        chartOfAccounts = getStaticAccounts();
        return chartOfAccounts;
    }

    public static List<Account> getStaticAccounts() {
        List<Account> retAccounts = new LinkedList<>();
        Account rootCompanyAccount = new Account(1L, "1000000", "Company", "Main Company Root Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 0, null, null, 1, null);
        Account asset = new Account(2L, "0100000", "Assets", "Main Company Assets Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 1, 1L, null, 1, null);
        Account liability = new Account(3L, "0200000", "Liabilities", "Main Company Liabilities Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 2, 1L, null, 1, null);
        Account equity = new Account(4L, "0300000", "Equity", "Main Company equities Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 5, 1L, null, 1, null);
        Account income = new Account(5L, "0400000", "Incomes", "Main Company Incomes Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 3, 1L, null, 1, null);
        Account expense = new Account(6L, "0500000", "Expense", "Main Company Expenses Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 4, 1L, null, 1, null);
        Account general1 = new Account(7L, "2000000", "general1", "Main Company Root Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 0, null, null, 1, null);
        Account general2 = new Account(8L, "3000000", "general2", "Main Company Root Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 0, null, null, 1, null);
        Account general3 = new Account(9L, "4000000", "general3", "Main Company Root Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 0, null, null, 1, null);
        retAccounts.add(rootCompanyAccount);
        retAccounts.add(asset);
        retAccounts.add(liability);
        retAccounts.add(equity);
        retAccounts.add(income);
        retAccounts.add(expense);
        retAccounts.add(general1);
        retAccounts.add(general2);
        retAccounts.add(general3);

        return retAccounts;
    }
}
