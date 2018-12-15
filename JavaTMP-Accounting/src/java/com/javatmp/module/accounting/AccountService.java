/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.module.accounting;

import com.javatmp.module.customer.Customer;
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

    public <T> List<T> getAllList(Class<T> classType) {
        List<T> returnList = new LinkedList<T>();
        returnList = this.jpaDaoHelper.findAll(classType);
        return returnList;
    }

    public List<Customer> getAllCustomerList() {
        List<Customer> customers = new LinkedList<>();
        customers = this.jpaDaoHelper.findAll(Customer.class);
        return customers;
    }

    public List<Account> getAllAccountsList() {
        List<Account> chartOfAccounts = new LinkedList<>();
        chartOfAccounts = this.jpaDaoHelper.findAll(Account.class);
        return chartOfAccounts;
    }

    public List<Costcenter> getAllCostCenterList() {
        List<Costcenter> costcenters = new LinkedList<>();
        costcenters = this.jpaDaoHelper.findAll(Costcenter.class);
        return costcenters;
    }

    public void persistObject(Object object) {
        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            em.getTransaction().begin();
            em.persist(object);
            em.getTransaction().commit();
        } catch (PersistenceException e) {
            if (em != null) {
                em.getTransaction().rollback();
            }
            throw e;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Account> getChartOfAccounts() {
        EntityManager em = null;
        List<Account> retList = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            TypedQuery<Account> query = em.createQuery(
                    "select new com.javatmp.module.accounting.Account("
                    + "acct.id, acct.accountCode, acct.name, acct.parentAccountId, "
                    + "sum(case when att.amount > 0 then att.amount else 0 end),"
                    + "sum(case when att.amount < 0 then (att.amount * -1) else 0 end), "
                    + "sum(case when coalesce(att.amount, 0) > 0 then (abs(coalesce(att.amount, 0)) * coalesce(at.debitSign, 0)) else (abs(coalesce(att.amount, 0)) * coalesce(at.creditSign, 0)) end), "
                    + "acct.accountGroup, acct.cashFlowId, ag.name, at.name, at.debitSign, at.creditSign)"
                    + " from Account acct"
                    + " left outer join Accounttransaction att on acct.id = att.accountId"
                    + " left outer join Transaction trans on att.transactionId = trans.id"
                    + " left outer join Accountgroup ag on acct.accountGroup = ag.id"
                    + " left outer join Accounttype at on at.id = ag.accountType"
                    + " group by acct.id, acct.accountCode, acct.name, acct.parentAccountId, acct.accountGroup,"
                    + "acct.cashFlowId, ag.name, at.name, at.debitSign, at.creditSign"
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

    public List<Module> getModules() {
        List<Module> modules = new LinkedList<>();
        modules = this.jpaDaoHelper.findAll(Module.class);
        return modules;
    }

    public List<Module> getModulesWithType() {
        EntityManager em = null;
        List<Module> retList = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            TypedQuery<Module> query = em.createQuery(
                    "select m"
                    + " from Module m"
                    + " join m.moduletypeList mt"
                    + "", Module.class
            );
            retList = query.getResultList();
            return retList;
        } finally {
            if (em != null) {
                em.close();
            }
        }
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
                    if (trans.getCostcenterList() != null && !trans.getCostcenterList().isEmpty()) {
                        for (Costcenter costcenter : trans.getCostcenterList()) {
                            AcctTransCostcenter acctTransCostcenter = new AcctTransCostcenter(trans.getId(), costcenter.getId());
                            em.persist(acctTransCostcenter);
                        }
                    }
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
                    from.get(Account_.creationDate), from.get(Account_.accountGroup), from.get(Account_.parentAccountId), from.get(Account_.cashFlowId));
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

        // another solution https://stackoverflow.com/questions/24725228/list-of-employees-who-are-not-managers
        /*
        select x.empno, x.ename, x.job, x.sal
  from emp x
  left join emp y
    on x.empno = y.mgr
 where y.mgr is null
         */
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

    public List<Account> getAccountForModuleTypeId(Moduletype moduletype) {

        EntityManager em = null;
        List<Account> retAccts = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            TypedQuery<Account> query = em.createQuery(
                    "select new com.javatmp.module.accounting.Account("
                    + "acct.id, acct.accountCode, acct.name, acct.accountGroup)"
                    + " from Account acct "
                    + "join Moduletype mt on acct.id = mt.rootAccountId "
                    + "where mt.id = :moduleTypeId"
                    + "", Account.class
            );
            query.setParameter("moduleTypeId", moduletype.getId());
            retAccts = query.getResultList();
            return retAccts;
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
            dbAccount.setParentAccountId(accountToBeUpdated.getParentAccountId());
            dbAccount.setCashFlowId(accountToBeUpdated.getCashFlowId());
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
