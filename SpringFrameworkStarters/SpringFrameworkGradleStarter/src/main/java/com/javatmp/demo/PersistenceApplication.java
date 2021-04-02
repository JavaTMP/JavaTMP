package com.javatmp.demo;

import com.javatmp.demo.db.entity.User;
import lombok.extern.slf4j.Slf4j;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

//https://www.baeldung.com/the-persistence-layer-with-spring-and-jpa#javaconfig
//https://allaroundjava.com/hibernate-jpa-spring-tutorial/
//
@Slf4j
public class PersistenceApplication {
    public static void main(String[] args) {
        EntityManagerFactory emf =
                Persistence.createEntityManagerFactory("AppPU");
        EntityManager em = emf.createEntityManager();
        log.info("em is : {}", em);

        User user = em.find(User.class, new Long(1));

        log.debug("user is : {}", user);

        em.close();
        emf.close();
    }
}
