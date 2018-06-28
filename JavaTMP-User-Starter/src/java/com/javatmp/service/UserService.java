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

            index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(1, "userName"));

            if (index != -1) {
                column = tableRequest.getColumns().get(index);
                searchParameters.put("userName", column.getSearch());
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
            index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(5, "birthDate"));
            if (index != -1) {
                column = tableRequest.getColumns().get(index);
                searchParameters.put("birthDate", column.getSearch());
            }
            index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(5, "age"));
            if (index != -1) {
                column = tableRequest.getColumns().get(index);
                searchParameters.put("age", column.getSearch());
            }
            index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(9, "email"));
            if (index != -1) {
                column = tableRequest.getColumns().get(index);
                searchParameters.put("email", column.getSearch());
            }
            index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(9, "status"));
            if (index != -1) {
                column = tableRequest.getColumns().get(index);
                searchParameters.put("status", column.getSearch());
            }
        }
        logger.info("search [" + searchParameters + "]");
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
//                System.out.println("username search parameter [" + searchParameters.get("userName") + "]");
                if (searchParameters.get("userName") != null && !searchParameters.get("userName").getValue().equals("")) {
                    Search searchValueObject = searchParameters.get("userName");
                    String searchValue = searchValueObject.getValue().trim().toLowerCase();
                    String dbValue = user.getUserName();
                    if (!dbValue.toLowerCase().contains(searchValue)) {
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
                    String searchValue = searchValueObject.getValue().trim().toLowerCase();
                    String dbValue = user.getLastName();
                    if (!dbValue.toLowerCase().contains(searchValue)) {
                        continue;
                    }
                }
                if (searchParameters.get("birthDate") != null && !searchParameters.get("birthDate").getValue().equals("")) {
                    Search searchValueObject = searchParameters.get("birthDate");
                    String searchValueStr = searchValueObject.getValue().trim().toLowerCase();
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    Date searchValue = sdf.parse(searchValueStr);
                    Date dbValue = user.getBirthDate();
                    System.out.println("Doest dbValue [" + dbValue + "] equal search [" + searchValue + "]");
                    if (!dbValue.equals(searchValue)) {
                        continue;
                    }
                }
                if (searchParameters.get("age") != null && !searchParameters.get("age").getValue().equals("")) {
                    Search searchValueObject = searchParameters.get("age");
                    String searchValueStr = searchValueObject.getValue().trim().toLowerCase();
                    Integer searchValue = Integer.valueOf(searchValueStr);
                    Date dbValue = user.getBirthDate();
                    Date now = new Date();
                    long timeBetween = now.getTime() - dbValue.getTime();
                    double yearsBetween = timeBetween / 3.15576e+10;
                    Integer age = (int) Math.ceil(yearsBetween);
                    System.out.println("Doest dbValue [" + age + "] equal search [" + searchValue + "]");
                    if (!age.equals(searchValue)) {
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
                if (searchParameters.get("status") != null && !searchParameters.get("status").getValue().equals("")) {
                    Search searchValueObject = searchParameters.get("status");
                    String searchValueStr = searchValueObject.getValue().trim();
                    Short searchValue = Short.valueOf(searchValueStr);
                    Short dbValue = user.getStatus();
                    if (!dbValue.equals(searchValue)) {
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
//                System.out.println("order column number is [" + order.getColumn() + "]");
                int factor = order.getDir().value().equals("desc") ? -1 : +1;
                if (order.getColumn() == 0) { // id
                    retCompare = o1.getId().compareTo(o2.getId()) * factor;
                } else if (order.getColumn() == 1) { //
                    retCompare = o1.getUserName().compareTo(o2.getUserName()) * factor;
                } else if (order.getColumn() == 2) { //
                    retCompare = o1.getFirstName().compareTo(o2.getFirstName()) * factor;
                } else if (order.getColumn() == 3) { //
                    retCompare = o1.getLastName().compareTo(o2.getLastName()) * factor;
                } else if (order.getColumn() == 4) { //
                    retCompare = o1.getBirthDate().compareTo(o2.getBirthDate()) * factor * -1;
                } else if (order.getColumn() == 5) { //
                    retCompare = o1.getBirthDate().compareTo(o2.getBirthDate()) * factor * -1;
                } else if (order.getColumn() == 6) { //
                    retCompare = o1.getEmail().compareTo(o2.getEmail()) * factor;
                } else if (order.getColumn() == 7) { //
                    retCompare = o1.getStatus().compareTo(o2.getStatus()) * factor;
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
