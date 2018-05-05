/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.service;

import com.javatmp.domain.User;
import com.javatmp.domain.table.DataTableColumnSpecs;
import com.javatmp.domain.table.DataTableRequest;
import com.javatmp.domain.table.DataTableResults;
import com.javatmp.mvc.Page;
import java.util.Collections;
import java.util.Comparator;
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
        List<User> db = new LinkedList<>(this.dBFaker.getUsers());
        DataTableColumnSpecs orderOrder = tableRequest.getOrder();
//        (o1, o2) -> {
//            String orderColumn = orderOrder.getIndex();
//
//            if (orderColumn == 3) { // position
//
//            }
//        }
//        );

        Collections.sort(db, new Comparator<User>() {
            @Override
            public int compare(User o1, User o2) {
                int factor = orderOrder.getSortDir().equals("DESC") ? -1 : +1;
                int retCompare = 0;
                if (orderOrder.getIndex() == 0) { // id
                    retCompare = o1.getId().compareTo(o2.getId()) * factor;
                } else if (orderOrder.getIndex() == 1) { //
                    retCompare = o1.getFirstName().compareTo(o2.getFirstName()) * factor;
                } else if (orderOrder.getIndex() == 2) { //
                    retCompare = o1.getLastName().compareTo(o2.getLastName()) * factor;
                } else if (orderOrder.getIndex() == 3) { //
                    retCompare = o1.getPosition().compareTo(o2.getPosition()) * factor;
                } else if (orderOrder.getIndex() == 4) { //
                    retCompare = o1.getOffice().compareTo(o2.getOffice()) * factor;
                } else if (orderOrder.getIndex() == 5) { //
                    retCompare = o1.getBirthOfDate().compareTo(o2.getBirthOfDate()) * factor * -1;
                } else if (orderOrder.getIndex() == 6) { //
                    retCompare = o1.getJoiningDate().compareTo(o2.getJoiningDate()) * factor * -1;
                } else if (orderOrder.getIndex() == 7) { //
                    retCompare = o1.getSalary().compareTo(o2.getSalary()) * factor;
                } else if (orderOrder.getIndex() == 8) { //
                    retCompare = o1.getMobile().compareTo(o2.getMobile()) * factor;
                } else if (orderOrder.getIndex() == 9) { //
                    retCompare = o1.getEmail().compareTo(o2.getEmail()) * factor;
                } else if (orderOrder.getIndex() == 10) { //
                    retCompare = o1.getPosition().compareTo(o2.getPosition()) * factor;
                }
                return retCompare;
            }
        });
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
