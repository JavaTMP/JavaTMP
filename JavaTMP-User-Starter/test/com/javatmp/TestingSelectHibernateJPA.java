/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp;

import com.javatmp.domain.User;
import com.javatmp.util.MD5Util;
import java.sql.SQLException;
import java.util.Date;
import java.util.TimeZone;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;
import org.hibernate.exception.ConstraintViolationException;

/**
 *
 * @author JavaTMP
 */
public class TestingSelectHibernateJPA {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        EntityManagerFactory factory = null;
        EntityManager em = null;
        try {
            factory = Persistence.createEntityManagerFactory("AppPU");
            em = factory.createEntityManager();

        } catch (PersistenceException e) {
            em.getTransaction().rollback();
            System.out.println(e.getCause() instanceof ConstraintViolationException);
            if (e.getCause() instanceof ConstraintViolationException) {
                ConstraintViolationException ex = (ConstraintViolationException) e.getCause();
                System.out.println("constraint name [" + ex.getConstraintName() + "]");
                System.out.println("message [" + ex.getMessage() + "]");
                ex.printStackTrace();
            } else {
                System.out.println("class [" + e.getClass().getName() + "]");
                System.out.println("message [" + e.getMessage() + "]");
                System.out.println("Cause [" + e.getCause().getClass().getName() + "]");
                e.printStackTrace();
            }
        }
    }

}
