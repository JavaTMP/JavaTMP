/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.module.accounting;

import com.javatmp.module.dms.Document;
import com.javatmp.module.user.User;
import com.javatmp.util.JpaDaoHelper;
import java.math.BigDecimal;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceException;

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

    public Account createNewAccount(Account account) {

        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            em.getTransaction().begin();
            em.persist(account);
            em.getTransaction().commit();
        } catch (PersistenceException e) {
            e.printStackTrace();
            if (em != null) {
                em.getTransaction().rollback();
            }
            throw e;
        }
        return account;
    }

    public static List<Account> getStaticAccounts() {
        List<Account> retAccounts = new LinkedList<>();
        Account rootCompanyAccount = new Account(1L, "1000000", "Company", "Main Company Root Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 0, null, 1);
        Account asset = new Account(2L, "0100000", "Assets", "Main Company Assets Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 1, 1L, 1);
        Account liability = new Account(3L, "0200000", "Liabilities", "Main Company Liabilities Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 2, 1L, 1);
        Account equity = new Account(4L, "0300000", "Equity", "Main Company equities Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 5, 1L, 1);
        Account income = new Account(5L, "0400000", "Incomes", "Main Company Incomes Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 3, 1L, 1);
        Account expense = new Account(6L, "0500000", "Expense", "Main Company Expenses Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 4, 1L, 1);
        Account general1 = new Account(7L, "2000000", "general1", "Main Company Root Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 0, null, 1);
        Account general2 = new Account(8L, "3000000", "general2", "Main Company Root Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 0, null, 1);
        Account general3 = new Account(9L, "4000000", "general3", "Main Company Root Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 0, null, 1);
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
