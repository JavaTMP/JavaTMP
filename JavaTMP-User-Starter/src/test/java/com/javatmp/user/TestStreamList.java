/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.user;

import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import java.util.Optional;
import java.util.stream.Stream;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;
import org.hibernate.jpa.QueryHints;

/**
 *
 * @author JavaTMP
 */
public class TestStreamList {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        UserService userService;
        userService = new UserService(Persistence.createEntityManagerFactory("AppPU"));
        EntityManager em = null;
        try {
            em = userService.getEntityManagerFactory().createEntityManager();
            em.getTransaction().begin();
            Stream<User> retList = em.createNativeQuery(
                    "select * from user p "
                    + "for update skip locked", User.class)
                    .setHint(QueryHints.HINT_FETCH_SIZE, 1)
                    .getResultStream();
            Optional<User> u = retList.findFirst();
            User user = u.get();

            System.out.println("user [" + user.getId() + "]");
            user.setAddress("here");
            em.getTransaction().rollback();
        } catch (PersistenceException e) {
            em.getTransaction().rollback();
            Throwable t = e;
            while (t != null) {
                System.out.println("type [" + e.getClass().getName() + "]");
                System.out.println("e [" + e.getMessage() + "]");
                t = t.getCause();
            }
        }

    }

}
