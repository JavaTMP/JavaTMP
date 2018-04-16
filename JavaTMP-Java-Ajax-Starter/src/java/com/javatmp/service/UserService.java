/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.service;

import com.javatmp.domain.User;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author m_dar
 */
public class UserService {

    private DBFaker dBFaker;

    public UserService(DBFaker dBFaker) {
        this.dBFaker = dBFaker;
    }

    public User readUserByUsername(User user) {
        for (User u : dBFaker.getUsersList()) {
            if (user.getUserName().equals(u.getUserName())) {
                return u;
            }
        }
        return null;
    }

    public User createNewUser(User user) {
        this.dBFaker.addUser(user);
        return user;

    }

}
