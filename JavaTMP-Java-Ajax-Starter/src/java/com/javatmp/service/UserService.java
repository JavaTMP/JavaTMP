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
import com.javatmp.domain.table.Order;
import com.javatmp.domain.table.Search;
import com.javatmp.mvc.MvcHelper;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

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

    public User readUserByUserId(User user) {
        for (User u : dBFaker.getUsersList()) {
            if (user.getId().equals(u.getId())) {
                return u;
            }
        }
        return null;
    }

    public User createNewUser(User user) {
        this.dBFaker.addUser(user);
        return user;
    }

    public List<String> listUsersPositions() {
        Set<String> retList = new LinkedHashSet<>();
        List<User> database = this.dBFaker.getUsers();
        for (int i = 0; i < database.size(); i++) {
            retList.add(database.get(i).getPosition().trim());
        }
        List<String> ret = new LinkedList(retList);
        Collections.sort(ret);

        return ret;
    }

    public DataTableResults<User> listUsers(DataTableRequest<User> tableRequest) {
        List<User> retList = new LinkedList<>();
        List<User> database = this.dBFaker.getUsers();
        List<User> db = null;
        List<Order> orders = tableRequest.getOrder();

        if (tableRequest.getSearch() != null && tableRequest.getSearch().getValue() != null && !tableRequest.getSearch().getValue().trim().equals("")) {
            System.out.println("*** isGlobalSearch starting ***");
            String query = tableRequest.getSearch().getValue().trim().toLowerCase();
            db = new LinkedList<>();
            for (User user : database) {
                String userStr = MvcHelper.toString(user);
                System.out.println("query[" + query + "] found in [" + userStr + "]");
                if (userStr.toLowerCase().contains(query)) {
                    db.add(user);
                }
            }
        } else {
            db = new LinkedList<>(this.dBFaker.getUsers());
        }

        Map<String, Search> searchParameters = new HashMap<>();
        DataTableColumnSpecs column;
        int index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(0, "id"));
        if (index != -1) {
            column = tableRequest.getColumns().get(index);
            searchParameters.put("id", column.getSearch());
        }

        index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(1, "firstName"));
        if (index != -1) {
            column = tableRequest.getColumns().get(index);
            searchParameters.put("firstName", column.getSearch());
        }

        index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(2, "lastName"));
        if (index != -1) {
            column = tableRequest.getColumns().get(index);
            searchParameters.put("lastName", column.getSearch());
        }
        index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(3, "position"));
        if (index != -1) {
            column = tableRequest.getColumns().get(index);
            searchParameters.put("position", column.getSearch());
        }
        index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(4, "office"));
        if (index != -1) {
            column = tableRequest.getColumns().get(index);
            searchParameters.put("office", column.getSearch());
        }
        index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(5, "birthOfDate"));
        if (index != -1) {
            column = tableRequest.getColumns().get(index);
            searchParameters.put("birthOfDate", column.getSearch());
        }
        index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(6, "joiningDate"));
        if (index != -1) {
            column = tableRequest.getColumns().get(index);
            searchParameters.put("joiningDate", column.getSearch());
        }
        index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(7, "salary"));
        if (index != -1) {
            column = tableRequest.getColumns().get(index);
            searchParameters.put("salary", column.getSearch());
        }
        index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(8, "mobile"));
        if (index != -1) {
            column = tableRequest.getColumns().get(index);
            searchParameters.put("mobile", column.getSearch());
        }
        index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(9, "email"));
        if (index != -1) {
            column = tableRequest.getColumns().get(index);
            searchParameters.put("email", column.getSearch());
        }
        System.out.println("search [" + MvcHelper.deepToString(searchParameters) + "]");
// apply individual column search:
        List<User> newDB = new LinkedList<>();
        for (User user : db) {
            try {
                if (searchParameters.get("id") != null && !searchParameters.get("id").getValue().equals("")) {
                    Search searchValueObject = searchParameters.get("id");
                    Long searchValue = new Long(searchValueObject.getValue().toString());
                    Long dbValue = user.getId();
                    if (!dbValue.equals(searchValue)) {
                        continue;
                    }
                }
                if (searchParameters.get("firstName") != null && !searchParameters.get("firstName").getValue().equals("")) {
                    Search searchValueObject = searchParameters.get("firstName");
                    String searchValue = searchValueObject.getValue().toString().trim().toLowerCase();
                    String dbValue = user.getFirstName();
                    if (!dbValue.toLowerCase().contains(searchValue)) {
                        continue;
                    }
                }
                if (searchParameters.get("lastName") != null && !searchParameters.get("lastName").getValue().equals("")) {
                    Search searchValueObject = searchParameters.get("lastName");
                    String searchValue = searchValueObject.getValue().toString().trim().toLowerCase();
                    String dbValue = user.getLastName();
                    if (!dbValue.toLowerCase().contains(searchValue)) {
                        continue;
                    }
                }
                if (searchParameters.get("position") != null && !searchParameters.get("position").getValue().equals("")) {
                    Search searchValueObject = searchParameters.get("position");
                    String searchValue = searchValueObject.getValue().toString().trim().toLowerCase();
                    String dbValue = user.getPosition();
                    if (!dbValue.toLowerCase().contains(searchValue)) {
                        continue;
                    }
                }
                if (searchParameters.get("office") != null && !searchParameters.get("office").getValue().equals("")) {
                    Search searchValueObject = searchParameters.get("office");
                    String searchValue = searchValueObject.getValue().toString().trim().toLowerCase();
                    String dbValue = user.getOffice();
                    if (!dbValue.toLowerCase().contains(searchValue)) {
                        continue;
                    }
                }
                if (searchParameters.get("birthOfDate") != null && !searchParameters.get("birthOfDate").getValue().equals("")) {
                    Search searchValueObject = searchParameters.get("birthOfDate");
                    String searchValue = searchValueObject.getValue().toString().trim().toLowerCase();
                    Date dbValue = user.getBirthOfDate();
                    Calendar cal = Calendar.getInstance();
                    cal.add(Calendar.YEAR, Integer.parseInt(searchValue) * -1);
                    Long search = cal.getTimeInMillis();
                    if (dbValue.getTime() > search) {
                        continue;
                    }
                }

                if (searchParameters.get("joiningDate") != null && !searchParameters.get("joiningDate").getValue().equals("")) {
                    Search searchValueObject = searchParameters.get("joiningDate");
                    String searchValue = searchValueObject.getValue().toString().trim().toLowerCase();
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    Date dbValue = user.getJoiningDate();
                    Date searchDate = sdf.parse(searchValue);
                    Long search = searchDate.getTime();
                    if (dbValue.getTime() < search) {
                        continue;
                    }
                }
                if (searchParameters.get("salary") != null && !searchParameters.get("salary").getValue().equals("")) {
                    Search searchValueObject = searchParameters.get("salary");
                    BigDecimal searchValue = new BigDecimal(searchValueObject.getValue().toString());
                    BigDecimal dbValue = user.getSalary();
                    if (dbValue.compareTo(searchValue) < 0) {
                        continue;
                    }
                }
                if (searchParameters.get("mobile") != null && !searchParameters.get("mobile").getValue().equals("")) {
                    Search searchValueObject = searchParameters.get("mobile");
                    String searchValue = searchValueObject.getValue().toString().trim().toLowerCase();
                    String dbValue = user.getMobile();
                    if (!dbValue.toLowerCase().contains(searchValue)) {
                        continue;
                    }
                }
                if (searchParameters.get("email") != null && !searchParameters.get("email").getValue().equals("")) {
                    Search searchValueObject = searchParameters.get("email");
                    String searchValue = searchValueObject.getValue().toString().trim().toLowerCase();
                    String dbValue = user.getEmail();
                    if (!dbValue.toLowerCase().contains(searchValue)) {
                        continue;
                    }
                }
                newDB.add(user);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        db = newDB;
        System.out.println("orderOrder [" + MvcHelper.deepToString(orders) + "]");
        Collections.sort(db, new Comparator<User>() {
            @Override
            public int compare(User o1, User o2) {
                int retCompare = 0;
                if (orders == null || orders.size() == 0) {
                    return retCompare;
                }
                // we support only one sort:
                Order order = orders.get(0);

                int factor = order.getDir().value().equals("desc") ? -1 : +1;

                if (order.getColumn() == 0) { // id
                    retCompare = o1.getId().compareTo(o2.getId()) * factor;
                } else if (order.getColumn() == 1) { //
                    retCompare = o1.getFirstName().compareTo(o2.getFirstName()) * factor;
                } else if (order.getColumn() == 2) { //
                    retCompare = o1.getLastName().compareTo(o2.getLastName()) * factor;
                } else if (order.getColumn() == 3) { //
                    retCompare = o1.getPosition().compareTo(o2.getPosition()) * factor;
                } else if (order.getColumn() == 4) { //
                    retCompare = o1.getOffice().compareTo(o2.getOffice()) * factor;
                } else if (order.getColumn() == 5) { //
                    retCompare = o1.getBirthOfDate().compareTo(o2.getBirthOfDate()) * factor * -1;
                } else if (order.getColumn() == 6) { //
                    retCompare = o1.getJoiningDate().compareTo(o2.getJoiningDate()) * factor * -1;
                } else if (order.getColumn() == 7) { //
                    retCompare = o1.getSalary().compareTo(o2.getSalary()) * factor;
                } else if (order.getColumn() == 8) { //
                    retCompare = o1.getMobile().compareTo(o2.getMobile()) * factor;
                } else if (order.getColumn() == 9) { //
                    retCompare = o1.getEmail().compareTo(o2.getEmail()) * factor;
                } else if (order.getColumn() == 10) { //
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

    public DataTableResults<User> listAllUsers(DataTableRequest<User> tableRequest) {
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
