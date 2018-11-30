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
        chartOfAccounts = this.jpaDaoHelper.findAll(Account.class);
        return chartOfAccounts;
    }

    public List<Accountgroup> getAccountGroups() {
        List<Accountgroup> accountgroups = new LinkedList<>();
        accountgroups = this.jpaDaoHelper.findAll(Accountgroup.class);
        return accountgroups;
    }

    public Account mergeAccount(Account account) {

        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            em.getTransaction().begin();
            em.merge(account);
            em.getTransaction().commit();
        } catch (PersistenceException e) {
            if (em != null) {
                em.getTransaction().rollback();
            }
            throw e;
        }
        return account;
    }

    public Account createNewAccount(Account account) {

        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            em.getTransaction().begin();
            em.persist(account);
            em.getTransaction().commit();
        } catch (PersistenceException e) {
            if (em != null) {
                em.getTransaction().rollback();
            }
            throw e;
        }
        return account;
    }
}
