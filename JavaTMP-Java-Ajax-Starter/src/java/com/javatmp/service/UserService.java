/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.service;

import com.javatmp.domain.User;
import com.javatmp.domain.table.DataTableRequest;
import com.javatmp.domain.table.DataTableResults;
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

    public DataTableResults<User> listUsers(DataTableRequest<User> tableRequest) {
        List<User> retList = new LinkedList<>();
        List<User> db = this.dBFaker.getUsers();
        for (int i = tableRequest.getStart();
                i < db.size() && i < (tableRequest.getStart() + tableRequest.getLength()); i++) {
            retList.add(db.get(i));
        }

        DataTableResults<User> dataTableResult = new DataTableResults<>();
        dataTableResult.setListOfDataObjects(retList);
        dataTableResult.setRecordsTotal(Long.valueOf(db.size()));
        dataTableResult.setRecordsFiltered(Long.valueOf(db.size()));
        dataTableResult.setDraw(tableRequest.getDraw());

        return dataTableResult;
    }

}
