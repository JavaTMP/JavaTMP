/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.accounting;

import com.javatmp.module.accounting.Transaction;
import com.javatmp.util.JpaDaoHelper;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.PersistenceException;

/**
 *
 * @author JavaTMP
 */
public class TestUpdateTransaction {

    public static void main(String[] args) throws SQLException, ParseException {
        try {
            JpaDaoHelper jpaDaoHelper;
            jpaDaoHelper = new JpaDaoHelper("AppPU");
            EntityManager em = null;
            EntityTransaction tx = null;
            em = jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            tx = em.getTransaction();
            try {
                tx.begin();
                Transaction transaction = em.find(Transaction.class, new Long(1383));
                Calendar cal = Calendar.getInstance();
                cal.set(2019, 5, 1, 0, 0, 0);
                transaction.setTransactionDate(cal.getTime());

//            em.merge(object);
                tx.commit();
            } finally {
                if (em != null) {
                    em.close();
                }
            }
        } catch (PersistenceException e) {
            Throwable t = e;
            while (t.getCause() != null) {
                t = t.getCause();
            }
            t.printStackTrace();
            System.out.println(t.getMessage());
        }
    }

}
