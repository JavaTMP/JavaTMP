/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.accounting;

import com.javatmp.module.accounting.Account;
import com.javatmp.module.accounting.AccountService;
import com.javatmp.module.accounting.Accounttransaction;
import com.javatmp.module.accounting.Transaction;
import com.javatmp.util.JpaDaoHelper;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;
import javax.persistence.EntityManager;

/**
 *
 * @author JavaTMP
 */
public class TestPopulateAccountTransaction {

    public static void main(String[] args) throws SQLException, ParseException {
        Random rand = new Random();
        BigDecimal max = new BigDecimal("3000.00");
        BigDecimal min = new BigDecimal("-3000.00");
        BigDecimal range = max.subtract(min);

        JpaDaoHelper jpaDaoHelper;
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        AccountService accountService = new AccountService(jpaDaoHelper);

        List<Account> leafAccts = accountService.getLeafAccounts();
        Calendar calendar = Calendar.getInstance();
        for (int n = 0; n < 10; n++) {
            Transaction trans = new Transaction();
            trans.setCreationDate(new Date());

            calendar.add(Calendar.DAY_OF_MONTH, 1 * (ThreadLocalRandom.current().nextInt(0, 5) == 0 ? +1 : -1));
//            calendar.add(Calendar.DAY_OF_MONTH, 1);
            calendar.set(Calendar.HOUR_OF_DAY, 0);
            calendar.set(Calendar.MINUTE, 0);
            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.MILLISECOND, 0);
            trans.setTransactionDate(calendar.getTime());
            trans.setVoucherTypeId(1);
            trans.setStatus((short) 1);
            EntityManager em = null;
            em = jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            em.getTransaction().begin();
            em.persist(trans);
            for (int i = 0; i < ThreadLocalRandom.current().nextInt(22, 50); i++) {
                int accountIdIndex = rand.nextInt(leafAccts.size());
                Long accountId = leafAccts.get(accountIdIndex).getId();
                Accounttransaction acctran = new Accounttransaction();
                acctran.setTransactionId(trans.getId());
                acctran.setStatus((short) 1);
                BigDecimal result = min.add(range.multiply(new BigDecimal(Math.random())));
//                System.out.println(result);
                acctran.setAmount(result);
                acctran.setAccountId(accountId);
                em.persist(acctran);
            }
            em.getTransaction().commit();
        }

    }

}
