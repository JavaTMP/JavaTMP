/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.jpa;

import com.javatmp.jpa.repository.AbstractRepository;
import com.javatmp.module.user.User;

/**
 *
 * @author JavaTMP
 */
public class TestUserRepository {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        UserRepository userRepository = new UserRepository();
        System.out.println(userRepository.find(1L));
    }
}

class UserRepository extends AbstractRepository<User, Long> {

    public UserRepository() {
        super(User.class, "AppPU");
    }
}
