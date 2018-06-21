package com.javatmp.service;

import com.javatmp.domain.User;
import com.javatmp.mvc.domain.table.DataTableColumnSpecs;
import com.javatmp.mvc.domain.table.DataTableRequest;
import com.javatmp.mvc.domain.table.DataTableResults;
import com.javatmp.mvc.domain.table.Order;
import com.javatmp.mvc.domain.table.Search;
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
import java.util.logging.Logger;

public class UserService {

    private final Logger logger = Logger.getLogger(getClass().getName());
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

    public int updateCompleteUser(User userToBeUpdated) {
        int updateStatus = 0;
        for (User dbUser : dBFaker.getUsersList()) {
            if (dbUser.getId().equals(userToBeUpdated.getId())) {
                dbUser.setUserName(userToBeUpdated.getUserName());
                dbUser.setPassword(userToBeUpdated.getPassword());
                dbUser.setFirstName(userToBeUpdated.getFirstName());
                dbUser.setLastName(userToBeUpdated.getLastName());
                dbUser.setStatus(userToBeUpdated.getStatus());
                dbUser.setBirthDate(userToBeUpdated.getBirthDate());
                dbUser.setCountryId(userToBeUpdated.getCountryId());
                dbUser.setAddress(userToBeUpdated.getAddress());
                dbUser.setEmail(userToBeUpdated.getEmail());
                dbUser.setLang(userToBeUpdated.getLang());
                dbUser.setTheme(userToBeUpdated.getTheme());
                dbUser.setTimezone(userToBeUpdated.getTimezone());
                dbUser.setProfilePicDocument(userToBeUpdated.getProfilePicDocument());
                dbUser.setProfilePicDocumentId(userToBeUpdated.getProfilePicDocumentId());
                updateStatus = 1;
                break;
            }
        }
        return updateStatus;
    }

    public DataTableResults<User> listUsers(DataTableRequest tableRequest) {
        List<User> retList = new LinkedList<>();
        List<User> database = this.dBFaker.getUsers();
        List<User> db = null;
        List<Order> orders = tableRequest.getOrder();

        if (tableRequest.getSearch() != null && tableRequest.getSearch().getValue() != null && !tableRequest.getSearch().getValue().trim().equals("")) {
            logger.info("*** isGlobalSearch starting ***");
            String query = tableRequest.getSearch().getValue().trim().toLowerCase();
            db = new LinkedList<>();
            for (User user : database) {
                String userStr = MvcHelper.toString(user);
                logger.info("query[" + query + "] found in [" + userStr + "]");
                if (userStr.toLowerCase().contains(query)) {
                    db.add(user);
                }
            }
        } else {
            db = new LinkedList<>(this.dBFaker.getUsers());
        }

        Map<String, Search> searchParameters = new HashMap<>();
        if (tableRequest.getColumns() != null && tableRequest.getColumns().size() > 0) {
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
        }
        logger.info("search [" + MvcHelper.deepToString(searchParameters) + "]");
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
                if (searchParameters.get("birthDate") != null && !searchParameters.get("birthDate").getValue().equals("")) {
                    Search searchValueObject = searchParameters.get("birthOfDate");
                    String searchValue = searchValueObject.getValue().toString().trim().toLowerCase();
                    Date dbValue = user.getBirthDate();
                    Calendar cal = Calendar.getInstance();
                    cal.add(Calendar.YEAR, Integer.parseInt(searchValue) * -1);
                    Long search = cal.getTimeInMillis();
                    if (dbValue.getTime() > search) {
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
                } else if (order.getColumn() == 9) { //
                    retCompare = o1.getEmail().compareTo(o2.getEmail()) * factor;
                }
                return retCompare;
            }
        });
        for (int i = tableRequest.getStart();
                i < db.size() && i < (tableRequest.getStart() + tableRequest.getLength()); i++) {
            retList.add(db.get(i));
        }

        DataTableResults<User> dataTableResult = new DataTableResults<>();
        dataTableResult.setData(retList);
        dataTableResult.setRecordsTotal(Long.valueOf(db.size()));
        dataTableResult.setRecordsFiltered(Long.valueOf(db.size()));
        dataTableResult.setDraw(tableRequest.getDraw());

        return dataTableResult;
    }

    public DataTableResults<User> listAllUsers(DataTableRequest tableRequest) {
        List<User> retList = new LinkedList<>();
        List<User> db = this.dBFaker.getUsers();

        for (int i = tableRequest.getStart();
                i < db.size() && i < (tableRequest.getStart() + tableRequest.getLength()); i++) {
            retList.add(db.get(i));
        }

        DataTableResults<User> dataTableResult = new DataTableResults<>();
        dataTableResult.setData(retList);
        dataTableResult.setRecordsTotal(Long.valueOf(db.size()));
        dataTableResult.setRecordsFiltered(Long.valueOf(db.size()));
        dataTableResult.setDraw(tableRequest.getDraw());

        return dataTableResult;
    }

}
