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
import javax.persistence.LockModeType;
import javax.persistence.PersistenceException;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaDelete;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

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

    public int deleteAccount(Account account) {
        int deletedStatus = 0;
        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            em.getTransaction().begin();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<Account> cq = cb.createQuery(Account.class);
            Root<Account> from = cq.from(Account.class);
            cq.multiselect(from.get(Account_.id));
            cq.where(cb.equal(from.get(Account_.id), account.getId()));
            TypedQuery<Account> query = em.createQuery(cq);
            query.setLockMode(LockModeType.PESSIMISTIC_WRITE);
            Account dbAccount = query.getSingleResult();
            // here you can check for any pre delete code:

            // delete user first:
            CriteriaDelete<Account> deleteAccount = cb.createCriteriaDelete(Account.class);
            Root<Account> userRoot = deleteAccount.from(Account.class);
            deleteAccount.where(cb.equal(userRoot.get(Account_.id), account.getId()));
            deletedStatus = em.createQuery(deleteAccount).executeUpdate();

            // delete document second if user deleted:
            em.getTransaction().commit();
            return deletedStatus;
        } catch (PersistenceException e) {
            if (em != null) {
                em.getTransaction().rollback();
            }
            throw e;
        }
    }

    public Account readAccountById(Account account) {

        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<Account> cq = cb.createQuery(Account.class);

            Root<Account> from = cq.from(Account.class);

            cq.multiselect(from.get(Account_.id), from.get(Account_.accountCode), from.get(Account_.name), from.get(Account_.description),
                    from.get(Account_.debit), from.get(Account_.credit), from.get(Account_.balance), from.get(Account_.accountStatus),
                    from.get(Account_.creationDate), from.get(Account_.accountGroup), from.get(Account_.parentAccount));
            cq.where(cb.equal(from.get(Account_.id), account.getId()));
            TypedQuery<Account> query = em.createQuery(cq);
            account = query.getSingleResult();
            return account;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public int updateAccount(Account accountToBeUpdated) {
        int updateStatus = 0;
        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            em.getTransaction().begin();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<Account> cq = cb.createQuery(Account.class);
            Root<Account> from = cq.from(Account.class);
            cq.select(from);
            cq.where(cb.equal(from.get(Account_.id), accountToBeUpdated.getId()));
            TypedQuery<Account> query = em.createQuery(cq);
            query.setLockMode(LockModeType.PESSIMISTIC_WRITE);
            Account dbAccount = query.getSingleResult();
            dbAccount.setAccountCode(accountToBeUpdated.getAccountCode());
            dbAccount.setName(accountToBeUpdated.getName());
            dbAccount.setDescription(accountToBeUpdated.getDescription());
            dbAccount.setAccountGroup(accountToBeUpdated.getAccountGroup());
            dbAccount.setAccountStatus(accountToBeUpdated.getAccountStatus());
            dbAccount.setParentAccount(accountToBeUpdated.getParentAccount());
            em.getTransaction().commit();
            updateStatus = 1;
        } catch (PersistenceException e) {
            if (em != null) {
                em.getTransaction().rollback();
            }
            throw e;
        }

        return updateStatus;
    }

}
