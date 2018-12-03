/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.module.accounting;

import com.javatmp.mvc.MvcHelper;
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

    public List<Transactiontype> getTransactionTypes() {
        List<Transactiontype> transactiontypes = new LinkedList<>();
        transactiontypes = this.jpaDaoHelper.findAll(Transactiontype.class);
        return transactiontypes;
    }

    public List<Module> getModules() {
        List<Module> modules = new LinkedList<>();
        modules = this.jpaDaoHelper.findAll(Module.class);
        return modules;
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

    public Transaction createNewTransaction(Transaction transaction) {

        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            em.getTransaction().begin();
            em.persist(transaction);
            if (transaction.getAccounttransactionList() != null) {
                for (Accounttransaction trans : transaction.getAccounttransactionList()) {
                    if (trans.getAccountId() == null) {
                        continue;
                    }
                    trans.setTransactionId(transaction.getId());
                    trans.setStatus((short) 1);
                    System.out.println("debit is [" + trans.getDebit() + "] , credit is [" + trans.getCredit() + "]");
                    if (trans.getDebit() != null && trans.getDebit().compareTo(BigDecimal.ZERO) > 0) {
                        trans.setAmount(trans.getDebit());
                    } else if (trans.getCredit() != null && trans.getCredit().compareTo(BigDecimal.ZERO) > 0) {
                        trans.setAmount(trans.getCredit().negate());
                    } else {
                        // throw exception or set amount to zero:
                        trans.setAmount(BigDecimal.ZERO);
                    }
                    System.out.println("Trans is [" + MvcHelper.deepToString(trans) + "]");
                    em.persist(trans);
                }
            }

            em.getTransaction().commit();
        } catch (PersistenceException e) {
            if (em != null) {
                em.getTransaction().rollback();
            }
            throw e;
        }
        return transaction;
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
                    from.get(Account_.debit), from.get(Account_.credit), from.get(Account_.balance), from.get(Account_.status),
                    from.get(Account_.creationDate), from.get(Account_.accountGroup), from.get(Account_.parentAccountId));
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

    public List<Account> getLeafAccounts() {

        EntityManager em = null;
        List<Account> retList = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            TypedQuery<Account> query = em.createQuery(
                    "select new com.javatmp.module.accounting.Account("
                    + "acct.id, acct.accountCode, acct.name, acct.accountGroup)"
                    + " from Account acct where acct.id not in (select parentAcct.parentAccountId"
                    + " from Account parentAcct where parentAcct.parentAccountId is not null)"
                    + "", Account.class
            );
            retList = query.getResultList();
            return retList;
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
            dbAccount.setStatus(accountToBeUpdated.getStatus());
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
