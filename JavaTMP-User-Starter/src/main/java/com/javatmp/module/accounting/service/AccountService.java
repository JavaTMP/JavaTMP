/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.module.accounting.service;

import com.javatmp.module.accounting.entity.Account;
import com.javatmp.module.accounting.entity.AccountGroup;
import com.javatmp.module.accounting.entity.AccountTransaction;
import com.javatmp.module.accounting.entity.AccountTransaction_;
import com.javatmp.module.accounting.entity.Account_;
import com.javatmp.module.accounting.entity.Transaction;
import com.javatmp.module.accounting.entity.TransactionEntry;
import com.javatmp.module.accounting.entity.TransactionEntry_;
import com.javatmp.module.accounting.entity.Transaction_;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.table.DataTableColumn;
import com.javatmp.mvc.domain.table.DataTableRequest;
import com.javatmp.mvc.domain.table.DataTableResults;
import com.javatmp.mvc.domain.table.Order;
import com.javatmp.util.JpaDaoHelper;
import java.math.BigDecimal;
import java.text.ParseException;
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
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
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

    public List<Transaction> getAllTransactionList() {
        List<Transaction> customers = new LinkedList<>();
        customers = this.jpaDaoHelper.findAll(Transaction.class);
        return customers;
    }

    public List<Account> getAllAccountsList() {
        List<Account> chartOfAccounts = new LinkedList<>();
        chartOfAccounts = this.jpaDaoHelper.findAll(Account.class);
        return chartOfAccounts;
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
                    "select new com.javatmp.module.accounting.entity.Account("
                    + "acct.id, acct.accountCode, acct.name, acct.parentAccountId, "
                    + "sum(case when att.amount > 0 then att.amount else 0 end),"
                    + "sum(case when att.amount < 0 then (att.amount * -1) else 0 end), "
                    + "sum(case when coalesce(att.amount, 0) > 0 then (abs(coalesce(att.amount, 0)) * coalesce(at.debitSign, 0)) "
                    + "else (abs(coalesce(att.amount, 0)) * coalesce(at.creditSign, 0)) end), "
                    + "acct.accountGroupId, acct.cashFlowId, ag.name, at.name, at.debitSign, at.creditSign, at.reportTypeId)"
                    + " from Account acct"
                    + " left outer join AccountTransaction att on acct.id = att.accountId"
                    + " left outer join Transaction trans on att.transactionId = trans.id"
                    + " left outer join AccountGroup ag on acct.accountGroupId = ag.id"
                    + " left outer join AccountType at on at.id = ag.accountType"
                    + " group by acct.id, acct.accountCode, acct.name, acct.parentAccountId, acct.accountGroupId,"
                    + "acct.cashFlowId, ag.name, at.name, at.debitSign, at.creditSign, at.reportTypeId"
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

    public List<Account> getChartOfAccountsReport(Integer reportTypeId) {
        EntityManager em = null;
        List<Account> retList = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            TypedQuery<Account> query = em.createQuery(
                    "select new com.javatmp.module.accounting.entity.Account("
                    + "acct.id, acct.accountCode, acct.name, acct.parentAccountId, "
                    + "sum(case when att.amount > 0 then att.amount else 0 end),"
                    + "sum(case when att.amount < 0 then (att.amount * -1) else 0 end), "
                    + "sum(case when coalesce(att.amount, 0) > 0 then (abs(coalesce(att.amount, 0)) * coalesce(at.debitSign, 0)) "
                    + "else (abs(coalesce(att.amount, 0)) * coalesce(at.creditSign, 0)) end), "
                    + "acct.accountGroupId, acct.cashFlowId, ag.name, at.name, at.debitSign, at.creditSign, at.reportTypeId)"
                    + " from Account acct"
                    + " left outer join AccountTransaction att on acct.id = att.accountId"
                    + " left outer join Transaction trans on att.transactionId = trans.id"
                    + " left outer join AccountGroup ag on acct.accountGroupId = ag.id"
                    + " left outer join AccountType at on at.id = ag.accountType"
                    + " where at.reportTypeId = :reportTypeId "
                    + " group by acct.id, acct.accountCode, acct.name, acct.parentAccountId, acct.accountGroupId,"
                    + " acct.cashFlowId, ag.name, at.name, at.debitSign, at.creditSign, at.reportTypeId"
                    + " order by at.id, ag.id"
                    + "", Account.class
            );

            query.setParameter("reportTypeId", reportTypeId);

            retList = query.getResultList();
            return retList;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Account> getGeneralLedgerAccounts() {
        EntityManager em = null;
        List<Account> retList = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            TypedQuery<Account> query = em.createQuery(
                    "select new com.javatmp.module.accounting.entity.Account("
                    + " acct.id, acct.accountCode, acct.name, acct.parentAccountId, "
                    + " sum(case when att.amount > 0 then att.amount else 0 end),"
                    + " sum(case when att.amount < 0 then (att.amount * -1) else 0 end), "
                    + " sum(case when coalesce(att.amount, 0) > 0 then (abs(coalesce(att.amount, 0)) * coalesce(at.debitSign, 0)) "
                    + "else (abs(coalesce(att.amount, 0)) * coalesce(at.creditSign, 0)) end), "
                    + " acct.accountGroupId, acct.cashFlowId, ag.name, at.name, at.debitSign, at.creditSign, at.reportTypeId)"
                    + " from Account acct"
                    + " left outer join AccountTransaction att on acct.id = att.accountId"
                    + " left outer join Transaction trans on att.transactionId = trans.id"
                    + " left outer join AccountGroup ag on acct.accountGroupId = ag.id"
                    + " left outer join AccountType at on at.id = ag.accountType"
                    + " where acct.id not in (select parentAcct.parentAccountId"
                    + " from Account parentAcct where parentAcct.parentAccountId is not null)"
                    + " group by acct.id, acct.accountCode, acct.name, acct.parentAccountId, acct.accountGroupId,"
                    + " acct.cashFlowId, ag.name, at.name, at.debitSign, at.creditSign, at.reportTypeId"
                    + " order by at.id, ag.id, acct.id"
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

    public List<AccountGroup> getAccountGroups() {
        List<AccountGroup> accountgroups = new LinkedList<>();
        accountgroups = this.jpaDaoHelper.findAll(AccountGroup.class);
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
                for (AccountTransaction trans : transaction.getAccounttransactionList()) {
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
                    from.get(Account_.creationDate), from.get(Account_.accountGroupId), from.get(Account_.parentAccountId), from.get(Account_.cashFlowId));
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
                    "select new com.javatmp.module.accounting.entity.Account("
                    + "acct.id, acct.accountCode, acct.name, acct.accountGroupId)"
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

    public List<Account> getLeafAccountsForTrialBalance() {
        EntityManager em = null;
        List<Account> retList = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            TypedQuery<Account> query = em.createQuery(
                    "select new com.javatmp.module.accounting.entity.Account("
                    + "acct.id, acct.accountCode, acct.name, acct.parentAccountId, "
                    + "sum(case when att.amount > 0 then att.amount else 0 end),"
                    + "sum(case when att.amount < 0 then (att.amount * -1) else 0 end), "
                    + "sum(case when coalesce(att.amount, 0) > 0 then (abs(coalesce(att.amount, 0)) * coalesce(at.debitSign, 0)) else (abs(coalesce(att.amount, 0)) * coalesce(at.creditSign, 0)) end), "
                    + "acct.accountGroupId, acct.cashFlowId, ag.name, at.name, at.debitSign, at.creditSign, at.reportTypeId)"
                    + " from Account acct "
                    + " left outer join AccountTransaction att on acct.id = att.accountId"
                    + " left outer join Transaction trans on att.transactionId = trans.id"
                    + " left outer join AccountGroup ag on acct.accountGroupId = ag.id"
                    + " left outer join AccountType at on at.id = ag.accountType"
                    + " where acct.id not in (select parentAcct.parentAccountId"
                    + " from Account parentAcct where parentAcct.parentAccountId is not null)"
                    + " group by acct.id, acct.accountCode, acct.name, acct.parentAccountId, acct.accountGroupId,"
                    + " acct.cashFlowId, ag.name, at.name, at.debitSign, at.creditSign, at.reportTypeId"
                    + " order by at.id, ag.id, acct.id"
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
            dbAccount.setAccountGroupId(accountToBeUpdated.getAccountGroupId());
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

    public DataTableResults<Transaction> listAllTransactions(DataTableRequest<Transaction> tableRequest) throws ParseException {
        DataTableResults<Transaction> dataTableResult = new DataTableResults<>();
        List<Transaction> retList = null;
        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<Transaction> cq = cb.createQuery(Transaction.class);
            Root<Transaction> from = cq.from(Transaction.class);
            cq.multiselect(
                    from.get(Transaction_.id),
                    from.get(Transaction_.code),
                    from.get(Transaction_.transactionDate),
                    from.get(Transaction_.note),
                    from.get(Transaction_.specialNumber),
                    from.get(Transaction_.entity),
                    from.get(Transaction_.status),
                    from.get(Transaction_.creationDate),
                    from.get(Transaction_.voucherTypeId)
            );

            List<Order> orders = tableRequest.getOrder();
            if (orders != null && orders.size() > 0) {
                for (Order order : orders) {
                    Integer columnIndex = order.getColumn();
                    DataTableColumn orderColumn = tableRequest.getColumns().get(columnIndex);

                    Path<?> sortPath = this.jpaDaoHelper.convertStringToPath(from, orderColumn.getData());
                    if (order.getDir().value().equals("desc")) {
                        cq.orderBy(cb.desc(sortPath));
                    } else {
                        cq.orderBy(cb.asc(sortPath));
                    }
                }
            }

            // where clouse:
            Predicate predicate = cb.conjunction();
            for (DataTableColumn column : tableRequest.getColumns()) {
                String columnName = column.getName();
                String columnSearchValue = column.getSearch().getValue().trim();
                logger.info("column name [" + columnName + "] search value [" + columnSearchValue + "]");
                if (columnSearchValue != null && !columnSearchValue.equals("")) {
                    //predicate = cb.and(predicate, cb.equal(from.get(columnName), columnSearchValue));
                    if (columnName.equals("id")) {
                        Long searchValue = new Long(columnSearchValue);
                        predicate = cb.and(predicate, cb.equal(from.get(Transaction_.id), searchValue));
                    }
                    if (columnName.equals("code")) {
                        String searchValue = new String(columnSearchValue);
                        predicate = cb.and(predicate, cb.equal(from.get(Transaction_.code), searchValue));
                    }
                }
            }
            cq.where(predicate);
            TypedQuery<Transaction> query = em.createQuery(cq);

            query.setFirstResult(tableRequest.getStart());
            query.setMaxResults(tableRequest.getLength());

            retList = query.getResultList();
            dataTableResult.setData(retList);

            CriteriaQuery<Long> cqLong = cb.createQuery(Long.class);
            from = cqLong.from(cq.getResultType());

            cqLong.select(cb.count(from));
            cqLong.where(predicate);
            Long allCount = em.createQuery(cqLong).getSingleResult();

            dataTableResult.setRecordsTotal(allCount);
            dataTableResult.setRecordsFiltered(allCount);
            dataTableResult.setDraw(tableRequest.getDraw());

            return dataTableResult;
        } finally {
            if (em != null) {
                em.close();
            }
        }

    }

    public DataTableResults<AccountTransaction> listAllEntries(DataTableRequest<AccountTransaction> tableRequest) throws ParseException {
        List<AccountTransaction> retList = null;
        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<AccountTransaction> cq = cb.createQuery(AccountTransaction.class);
            Root<AccountTransaction> from = cq.from(AccountTransaction.class);
            cq.multiselect(
                    from.get(AccountTransaction_.id),
                    from.get(AccountTransaction_.amount),
                    from.get(AccountTransaction_.accountId),
                    from.get(AccountTransaction_.transactionId),
                    from.get(AccountTransaction_.description),
                    from.get(AccountTransaction_.status)
            );

            List<Order> orders = tableRequest.getOrder();
            if (orders != null && orders.size() > 0) {
                for (Order order : orders) {
                    Integer columnIndex = order.getColumn();
                    DataTableColumn orderColumn = tableRequest.getColumns().get(columnIndex);

                    Path<?> sortPath = this.jpaDaoHelper.convertStringToPath(from, orderColumn.getData());
                    if (order.getDir().value().equals("desc")) {
                        cq.orderBy(cb.desc(sortPath));
                    } else {
                        cq.orderBy(cb.asc(sortPath));
                    }
                }
            }

            // where clouse:
            Predicate predicate = cb.conjunction();
            for (DataTableColumn column : tableRequest.getColumns()) {
                String columnName = column.getName();
                String columnSearchValue = column.getSearch().getValue().trim();
                logger.info("column name [" + columnName + "] search value [" + columnSearchValue + "]");
                if (columnSearchValue != null && !columnSearchValue.equals("")) {
                    //predicate = cb.and(predicate, cb.equal(from.get(columnName), columnSearchValue));
                    if (columnName.equals("id")) {
                        Long searchValue = new Long(columnSearchValue);
                        predicate = cb.and(predicate, cb.equal(from.get(AccountTransaction_.id), searchValue));
                    }
                    if (columnName.equals("transactionId")) {
                        String searchValue = new String(columnSearchValue);
                        predicate = cb.and(predicate, cb.equal(from.get(AccountTransaction_.transactionId), searchValue));
                    }
                    if (columnName.equals("accountId")) {
                        String searchValue = new String(columnSearchValue);
                        predicate = cb.and(predicate, cb.equal(from.get(AccountTransaction_.accountId), searchValue));
                    }
                }
            }
            cq.where(predicate);
            TypedQuery<AccountTransaction> query = em.createQuery(cq);

            query.setFirstResult(tableRequest.getStart());
            query.setMaxResults(tableRequest.getLength());

            retList = query.getResultList();

            DataTableResults<AccountTransaction> dataTableResult = new DataTableResults<>();
            dataTableResult.setData(retList);

            CriteriaQuery<Long> cqLong = cb.createQuery(Long.class);
            from = cqLong.from(cq.getResultType());

            cqLong.select(cb.count(from));
            cqLong.where(predicate);
            Long allCount = em.createQuery(cqLong).getSingleResult();

            dataTableResult.setRecordsTotal(allCount);
            dataTableResult.setRecordsFiltered(allCount);
            dataTableResult.setDraw(tableRequest.getDraw());

            return dataTableResult;
        } finally {
            if (em != null) {
                em.close();
            }
        }

    }

    public DataTableResults<TransactionEntry> listAllTransactionEntry(DataTableRequest<TransactionEntry> tableRequest) throws ParseException {
        List<TransactionEntry> retList = null;
        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<TransactionEntry> cq = cb.createQuery(TransactionEntry.class);
            Root<TransactionEntry> from = cq.from(TransactionEntry.class);
            cq.select(from);

            List<Order> orders = tableRequest.getOrder();
            if (orders != null && orders.size() > 0) {
                List<javax.persistence.criteria.Order> tableOrders = new LinkedList<>();
                for (Order order : orders) {
                    Integer columnIndex = order.getColumn();
                    DataTableColumn orderColumn = tableRequest.getColumns().get(columnIndex);

                    Path<?> sortPath = this.jpaDaoHelper.convertStringToPath(from, orderColumn.getData());
                    if (order.getDir().value().equals("desc")) {
                        tableOrders.add(cb.desc(sortPath));
                    } else {
                        tableOrders.add(cb.asc(sortPath));
                    }
                }
                cq.orderBy(tableOrders);
            }
            // where clouse:
            Predicate predicate = cb.conjunction();
            for (DataTableColumn column : tableRequest.getColumns()) {
                String columnName = column.getName();
                String columnSearchValue = column.getSearch().getValue().trim();
                logger.info("column name [" + columnName + "] search value [" + columnSearchValue + "]");
                if (columnSearchValue != null && !columnSearchValue.equals("")) {
                    //predicate = cb.and(predicate, cb.equal(from.get(columnName), columnSearchValue));
                    if (columnName.equals("id")) {
                        Long searchValue = new Long(columnSearchValue);
                        predicate = cb.and(predicate, cb.equal(from.get(TransactionEntry_.id), searchValue));
                    }
                    if (columnName.equals("transactionId")) {
                        String searchValue = new String(columnSearchValue);
                        predicate = cb.and(predicate, cb.equal(from.get(TransactionEntry_.transactionId), searchValue));
                    }
                    if (columnName.equals("accountId")) {
                        String searchValue = new String(columnSearchValue);
                        predicate = cb.and(predicate, cb.equal(from.get(TransactionEntry_.accountId), searchValue));
                    }
                }
            }
            cq.where(predicate);
            TypedQuery<TransactionEntry> query = em.createQuery(cq);

            query.setFirstResult(tableRequest.getStart());
            query.setMaxResults(tableRequest.getLength());

            retList = query.getResultList();

            DataTableResults<TransactionEntry> dataTableResult = new DataTableResults<>();
            dataTableResult.setData(retList);

            CriteriaQuery<Long> cqLong = cb.createQuery(Long.class);
            from = cqLong.from(cq.getResultType());

            cqLong.select(cb.count(from));
            cqLong.where(predicate);
            Long allCount = em.createQuery(cqLong).getSingleResult();

            dataTableResult.setRecordsTotal(allCount);
            dataTableResult.setRecordsFiltered(allCount);
            dataTableResult.setDraw(tableRequest.getDraw());

            return dataTableResult;
        } finally {
            if (em != null) {
                em.close();
            }
        }

    }

}
