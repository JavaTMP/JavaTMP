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
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.Page;
import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.beanutils.BeanUtils;

/**
 *
 * @author m_dar
 */
public class UserService {

    private final DBFaker dBFaker;

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
        List<User> database = this.dBFaker.getUsers();
        List<User> db = null;
        DataTableColumnSpecs orderOrder = tableRequest.getOrder();

        if (tableRequest.isGlobalSearch()) {
            System.out.println("*** isGlobalSearch starting ***");
            String query = tableRequest.getSearch().trim().toLowerCase();
            db = new LinkedList<>();
            for (User user : database) {
                String userStr = MvcHelper.deepToString(user);
                if (userStr.toLowerCase().contains(query)) {
                    db.add(user);
                }
            }
        } else {
            db = new LinkedList<>(this.dBFaker.getUsers());
        }

        Map<String, Object> searchParameters = new HashMap<>();
        int index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(0, "id"));
        DataTableColumnSpecs column = tableRequest.getColumns().get(index);
        searchParameters.put("id", column.getSearch());

        index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(1, "firstName"));
        column = tableRequest.getColumns().get(index);
        searchParameters.put("firstName", column.getSearch());

        index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(2, "lastName"));
        column = tableRequest.getColumns().get(index);
        searchParameters.put("lastName", column.getSearch());

        index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(3, "position"));
        column = tableRequest.getColumns().get(index);
        searchParameters.put("position", column.getSearch());

        index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(4, "office"));
        column = tableRequest.getColumns().get(index);
        searchParameters.put("office", column.getSearch());

        index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(5, "birthOfDate"));
        column = tableRequest.getColumns().get(index);
        searchParameters.put("birthOfDate", column.getSearch());

        index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(6, "joiningDate"));
        column = tableRequest.getColumns().get(index);
        searchParameters.put("joiningDate", column.getSearch());

        index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(7, "salary"));
        column = tableRequest.getColumns().get(index);
        searchParameters.put("salary", column.getSearch());

        index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(8, "mobile"));
        column = tableRequest.getColumns().get(index);
        searchParameters.put("mobile", column.getSearch());

        index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(9, "email"));
        column = tableRequest.getColumns().get(index);
        searchParameters.put("email", column.getSearch());

// apply individual column search:
        List<User> newDB = new LinkedList<>();
        for (User user : db) {
            try {
                System.out.println("search [" + searchParameters + "]");
                if (searchParameters.get("id") != null && !searchParameters.get("id").equals("")) {
                    Object searchValueObject = searchParameters.get("id");
                    Long searchValue = new Long(searchValueObject.toString());
                    Long dbValue = user.getId();
                    if (!dbValue.equals(searchValue)) {
                        continue;
                    }
                }
                if (searchParameters.get("firstName") != null && !searchParameters.get("firstName").equals("")) {
                    Object searchValueObject = searchParameters.get("firstName");
                    String searchValue = searchValueObject.toString().trim().toLowerCase();
                    String dbValue = user.getFirstName();
                    if (!dbValue.toLowerCase().contains(searchValue)) {
                        continue;
                    }
                }
                if (searchParameters.get("lastName") != null && !searchParameters.get("lastName").equals("")) {
                    Object searchValueObject = searchParameters.get("lastName");
                    String searchValue = searchValueObject.toString().trim().toLowerCase();
                    String dbValue = user.getLastName();
                    if (!dbValue.toLowerCase().contains(searchValue)) {
                        continue;
                    }
                }
                if (searchParameters.get("position") != null && !searchParameters.get("position").equals("")) {
                    Object searchValueObject = searchParameters.get("position");
                    String searchValue = searchValueObject.toString().trim().toLowerCase();
                    String dbValue = user.getPosition();
                    if (!dbValue.toLowerCase().contains(searchValue)) {
                        continue;
                    }
                }
                if (searchParameters.get("office") != null && !searchParameters.get("office").equals("")) {
                    Object searchValueObject = searchParameters.get("office");
                    String searchValue = searchValueObject.toString().trim().toLowerCase();
                    String dbValue = user.getOffice();
                    if (!dbValue.toLowerCase().contains(searchValue)) {
                        continue;
                    }
                }
                if (searchParameters.get("birthOfDate") != null && !searchParameters.get("birthOfDate").equals("")) {
                    Object searchValueObject = searchParameters.get("birthOfDate");
                    String searchValue = searchValueObject.toString().trim().toLowerCase();
                    Date dbValue = user.getBirthOfDate();
                    Calendar cal = Calendar.getInstance();
                    cal.add(Calendar.YEAR, Integer.parseInt(searchValue) * -1);
                    Long search = cal.getTimeInMillis();
                    if (dbValue.getTime() > search) {
                        continue;
                    }
                }
                if (searchParameters.get("joiningDate") != null && !searchParameters.get("joiningDate").equals("")) {
                    Object searchValueObject = searchParameters.get("joiningDate");
                    String searchValue = searchValueObject.toString().trim().toLowerCase();
                    Date dbValue = user.getJoiningDate();
                    Calendar cal = Calendar.getInstance();
                    cal.add(Calendar.YEAR, Integer.parseInt(searchValue) * -1);
                    Long search = cal.getTimeInMillis();
                    if (dbValue.getTime() > search) {
                        continue;
                    }
                }
                newDB.add(user);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        db = newDB;
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
