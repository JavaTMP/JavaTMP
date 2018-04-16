/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.service;

import com.javatmp.domain.User;
import java.math.BigDecimal;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author m_dar
 */
public class DBFaker {

    private List<User> users = new LinkedList<>();

    public List<User> getUsersList() {
        return users;
    }

    public synchronized void addUser(User user) {
        users.add(user);
        user.setId(Long.valueOf(users.size()));
    }
}
