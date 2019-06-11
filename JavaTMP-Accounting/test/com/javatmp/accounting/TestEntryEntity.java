/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.accounting;

import com.javatmp.module.accounting.Account;
import com.javatmp.module.accounting.AccountService;
import com.javatmp.module.accounting.Costcenter;
import com.javatmp.module.accounting.Module;
import com.javatmp.module.accounting.Moduletype;
import com.javatmp.module.accounting.TransactionEntry;
import com.javatmp.module.customer.Customer;
import com.javatmp.module.supplier.Supplier;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.util.JpaDaoHelper;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

/**
 *
 * @author JavaTMP
 */
public class TestEntryEntity {

    public static void main(String[] args) throws SQLException, ParseException {
        JpaDaoHelper jpaDaoHelper;
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        AccountService accountService = new AccountService(jpaDaoHelper);

        EntityManager em = null;
        List<Account> retList = null;
        try {
            em = jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            TypedQuery<Account> query = em.createQuery(
                    "select new com.javatmp.module.accounting.Account("
                    + "acct.id, acct.accountCode, acct.name, acct.parentAccountId, "
                    + "sum(case when att.amount > 0 then att.amount else 0 end),"
                    + "sum(case when att.amount < 0 then (att.amount * -1) else 0 end), "
                    + "sum(case when coalesce(att.amount, 0) > 0 then (abs(coalesce(att.amount, 0)) * coalesce(at.debitSign, 0)) "
                    + "else (abs(coalesce(att.amount, 0)) * coalesce(at.creditSign, 0)) end), "
                    + "acct.accountGroup, acct.cashFlowId, ag.name, at.name, at.debitSign, at.creditSign, at.reportTypeId)"
                    + " from Account acct"
                    + " left outer join Entry entity on acct.id = entity.accountId"
                    + " left outer join Transaction trans on att.transactionId = trans.id"
                    + " left outer join Accountgroup ag on acct.accountGroup = ag.id"
                    + " left outer join Accounttype at on at.id = ag.accountType"
                    + " group by acct.id, acct.accountCode, acct.name, acct.parentAccountId, acct.accountGroup,"
                    + "acct.cashFlowId, ag.name, at.name, at.debitSign, at.creditSign, at.reportTypeId"
                    + "", Account.class
            );
            retList = query.getResultList();

        } finally {
            if (em != null) {
                em.close();
            }
        }

        if (true) {
            return;
        }

        List<Account> coa = accountService.getChartOfAccounts();

        for (Account acct : coa) {
            System.out.println(MvcHelper.toString(acct));
        }

        List<Account> gl = accountService.getGeneralLedgerAccounts();

        for (Account acct : gl) {
            System.out.println(MvcHelper.toString(acct));
        }

    }

}
