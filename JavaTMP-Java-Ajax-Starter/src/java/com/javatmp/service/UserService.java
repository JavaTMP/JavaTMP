/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.service;

import com.javatmp.domain.User;
import com.javatmp.mvc.Page;
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

    public Page<User> listUsers(Page<User> page) {
        List<User> retList = new LinkedList<>();
        List<User> db = this.dBFaker.getUsers();
        for (int i = (page.getRequestedPageNum() - 1) * page.getNumOfRowsPerPage();
                i < db.size() && i < (page.getRequestedPageNum()) * page.getNumOfRowsPerPage(); i++) {
            retList.add(db.get(i));
        }
        page.setRecords(retList);
        page.setAllCount(Long.valueOf(db.size()));
        return page;
    }

}
