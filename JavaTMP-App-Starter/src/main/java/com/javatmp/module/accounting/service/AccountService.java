package com.javatmp.module.accounting.service;

import com.javatmp.module.accounting.entity.Account;
import com.javatmp.module.accounting.entity.AccountTransaction;
import com.javatmp.module.accounting.entity.Account_;
import com.javatmp.module.accounting.entity.Transaction;
import com.javatmp.module.accounting.repository.AccountRepository;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.LockModeType;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaDelete;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
public class AccountService {

    private EntityManager em;

    private AccountRepository accountRepository;

    public AccountService(EntityManager em, AccountRepository accountRepository) {
        this.em = em;
        this.accountRepository = accountRepository;
    }

    public List<Account> getChartOfAccounts() {
        List<Account> retList = null;
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
    }

    public List<Account> getChartOfAccountsReport(Integer reportTypeId) {
        List<Account> retList = null;
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

    }

    public List<Account> getGeneralLedgerAccounts() {
        List<Account> retList = null;
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

    }

    @Transactional
    public Transaction createNewTransaction(Transaction transaction) {
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
                System.out.println("Trans is [" + (trans) + "]");
                em.persist(trans);
            }
        }
        return transaction;
    }

    public int deleteAccount(Account account) {
        int deletedStatus = 0;
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

    }

    public Account readAccountById(Account account) {

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
        List<Account> retList = null;
        TypedQuery<Account> query = em.createQuery(
                "select new com.javatmp.module.accounting.entity.Account("
                + "acct.id, acct.accountCode, acct.name, acct.accountGroupId)"
                + " from Account acct where acct.id not in (select parentAcct.parentAccountId"
                + " from Account parentAcct where parentAcct.parentAccountId is not null)"
                + "", Account.class
        );
        retList = query.getResultList();
        return retList;

    }

    public List<Account> getLeafAccountsForTrialBalance() {
        List<Account> retList = null;
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

    }

    public int updateAccount(Account accountToBeUpdated) {
        int updateStatus = 0;
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

        return updateStatus;
    }

    public Account save(Account accountToBeCreated) {
        accountToBeCreated.setCreationDate(new Date());
        accountToBeCreated.setStatus((short) 1);
        accountToBeCreated.setDebit(BigDecimal.ZERO);
        accountToBeCreated.setCredit(BigDecimal.ZERO);
        return this.accountRepository.save(accountToBeCreated);
    }

    public List<Account> findAll() {
        return this.accountRepository.findAll();
    }
}
