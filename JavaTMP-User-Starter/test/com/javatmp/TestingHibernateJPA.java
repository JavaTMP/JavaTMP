/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp;

import com.javatmp.domain.User;
import com.javatmp.service.DBFaker;
import com.javatmp.util.MD5Util;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.Date;
import java.util.List;
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
public class TestingHibernateJPA {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        EntityManagerFactory factory = null;
        EntityManager em = null;
        DBFaker faker = new DBFaker();
        try {
            factory = Persistence.createEntityManagerFactory("AppPU");
            em = factory.createEntityManager();

            em.getTransaction().begin();

            List<User> users = faker.getUsers();
            for (User user : users) {
                user.setId(null);
                em.persist(user);
            }
//
//            User newUser = new User();
//            newUser.setUserName("user2");
//            newUser.setPassword(MD5Util.convertToMD5(newUser.getUserName()));
//            newUser.setFirstName("firstName");
//            newUser.setLastName("lastName");
//            newUser.setStatus((short) 1);
//            newUser.setCreationDate(new Date());
//            newUser.setEmail("support@javatmp.com");
//            newUser.setLang("en");
//            newUser.setTheme("default");
//            newUser.setTimezone(TimeZone.getTimeZone("UTC").getID());
//            newUser.setBirthDate(new Date(-399571200000L));
//            newUser.setCountryId("US");
//            newUser.setAddress("<p>Not provided yet</p>");
//            newUser.setProfilePicDocumentId(0L);
//            em.persist(newUser);

            em.getTransaction().commit();
        } catch (PersistenceException e) {
            em.getTransaction().rollback();
            System.out.println("is sql [" + (e.getCause() instanceof ConstraintViolationException));
            System.out.println(e.getCause() instanceof ConstraintViolationException);
            if (e.getCause() instanceof ConstraintViolationException) {
                ConstraintViolationException c = (ConstraintViolationException) e.getCause();
                System.out.println("dfdfdfd " + c.getConstraintName() + "]");
            }
            e.getCause().printStackTrace();
            System.out.println("class [" + e.getClass().getName() + "]");
            System.out.println("message [" + e.getMessage() + "]");
            System.out.println("Cause [" + e.getCause().getClass().getName() + "]");
            System.out.println("Cause [" + e.getCause().getMessage() + "]");
            System.out.println("class [" + e.getClass().getName() + "]");
            System.out.println("message [" + e.getMessage() + "]");
            System.out.println("Cause [" + e.getCause().getClass().getName() + "]");
            e.printStackTrace();
        }
    }

}
