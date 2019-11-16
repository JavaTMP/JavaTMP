/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.jpa.repository;

import com.javatmp.module.user.entity.User;

/**
 *
 * @author Mohamed
 */
public class TestAbstractRepository {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        AbstractRepository<User, Long> abstractRepository = new AbstractRepository<>(User.class, "AppPU");
        User user1 = abstractRepository.find(1L);
        System.out.println(user1.getUserName());
    }

}
