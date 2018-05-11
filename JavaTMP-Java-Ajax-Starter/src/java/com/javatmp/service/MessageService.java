package com.javatmp.service;

import com.javatmp.domain.Content;
import com.javatmp.domain.Message;
import com.javatmp.domain.User;
import com.javatmp.domain.table.DataTableColumnSpecs;
import com.javatmp.domain.table.DataTableRequest;
import com.javatmp.domain.table.DataTableResults;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.Page;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class MessageService {

    private final DBFaker dBFaker;
    private UserService userService;

    public MessageService(DBFaker dBFaker, UserService userService) {
        this.dBFaker = dBFaker;
        this.userService = userService;
    }

    public Long getAllCount() {
        return Long.valueOf(this.dBFaker.getMessages().size());
    }

    public List<Message> getContents() {
        return this.dBFaker.getMessages();
    }

    public Message readMessageById(Message message) {
        List<Message> db = this.dBFaker.getMessages();
        for (Message row : db) {
            if (row.getMessageId().equals(message.getMessageId())) {
                return row;
            }
        }
        throw new IllegalArgumentException("Record id [" + message.getMessageId() + "] Not found");
    }

    public Message createMessage(Message message) {
        message.setMessageId(DBFaker.getNextCounter());
        this.dBFaker.getMessages().add(message);
        return message;
    }

    public Page<Message> listMessage(Page<Message> page) {
        List<Message> retList = new LinkedList<>();
        List<Message> db = this.dBFaker.getMessages();
        for (int i = (page.getRequestedPageNum() - 1) * page.getNumOfRowsPerPage();
                i < db.size() && i < (page.getRequestedPageNum()) * page.getNumOfRowsPerPage(); i++) {
            retList.add(db.get(i));
        }
        page.setRecords(retList);

        page.setAllCount(this.getAllCount());

        return page;
    }

    public DataTableResults<Message> listMessages(DataTableRequest<Message> tableRequest) {
        List<Message> retList = new LinkedList<>();
        List<Message> database = this.dBFaker.getMessages();
        List<Message> db = null;
        DataTableColumnSpecs orderOrder = tableRequest.getOrder();
        System.out.println("is global search provide");
        if (tableRequest.isGlobalSearch()) {
            System.out.println("*** isGlobalSearch starting ***");
            String query = tableRequest.getSearch().trim().toLowerCase();
            db = new LinkedList<>();
            for (Message msg : database) {
                String userStr = MvcHelper.deepToString(msg);
                if (userStr.toLowerCase().contains(query)) {
                    db.add(msg);
                }
            }
        } else {
            db = new LinkedList<>(this.dBFaker.getMessages());
        }
        System.out.println("Start mapping search parameteres");
        Map<String, Object> searchParameters = new HashMap<>();
        int index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(0, "messageId"));
        DataTableColumnSpecs column;
        if (index != -1) {
            column = tableRequest.getColumns().get(index);
            searchParameters.put("messageId", column.getSearch());
        }

        index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(1, "messageTitle"));
        if (index != -1) {
            column = tableRequest.getColumns().get(index);
            searchParameters.put("messageTitle", column.getSearch());
        }

        index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(2, "creationDate"));
        if (index != -1) {
            column = tableRequest.getColumns().get(index);
            searchParameters.put("creationDate", column.getSearch());
        }

        index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(3, "fromUserId"));
        if (index != -1) {
            column = tableRequest.getColumns().get(index);
            searchParameters.put("fromUserId", column.getSearch());
        }

        index = tableRequest.getColumns().indexOf(new DataTableColumnSpecs(4, "toUserId"));
        if (index != -1) {
            column = tableRequest.getColumns().get(index);
            searchParameters.put("toUserId", column.getSearch());
        }

        System.out.println("search [" + searchParameters + "]");
// apply individual column search:
        List<Message> newDB = new LinkedList<>();
        for (Message msg : db) {
            try {
                if (searchParameters.get("messageId") != null && !searchParameters.get("messageId").equals("")) {
                    Object searchValueObject = searchParameters.get("messageId");
                    Long searchValue = new Long(searchValueObject.toString());
                    Long dbValue = msg.getMessageId();
                    if (!dbValue.equals(searchValue)) {
                        continue;
                    }
                }
                if (searchParameters.get("messageTitle") != null && !searchParameters.get("messageTitle").equals("")) {
                    Object searchValueObject = searchParameters.get("messageTitle");
                    String searchValue = searchValueObject.toString().trim().toLowerCase();
                    String dbValue = msg.getMessageTitle();
                    if (!dbValue.toLowerCase().contains(searchValue)) {
                        continue;
                    }
                }
                if (searchParameters.get("creationDate") != null && !searchParameters.get("creationDate").equals("")) {
                    Object searchValueObject = searchParameters.get("joiningDate");
                    String searchValue = searchValueObject.toString().trim().toLowerCase();
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    Date dbValue = msg.getCreationDate();
                    Date searchDate = sdf.parse(searchValue);
                    Long search = searchDate.getTime();
                    if (dbValue.getTime() > search) {
                        continue;
                    }
                }
                if (searchParameters.get("fromUserId") != null && !searchParameters.get("fromUserId").equals("")) {
                    Object searchValueObject = searchParameters.get("fromUserId");
                    String searchValueStr = searchValueObject.toString().trim().toLowerCase();
                    Long searchValue = new Long(searchValueStr);
                    Long dbValue = msg.getFromUserId();
                    if (!dbValue.equals(searchValue)) {
                        continue;
                    }
                }
                if (searchParameters.get("toUserId") != null && !searchParameters.get("toUserId").equals("")) {
                    Object searchValueObject = searchParameters.get("toUserId");
                    String searchValueStr = searchValueObject.toString().trim().toLowerCase();
                    Long searchValue = new Long(searchValueStr);
                    Long dbValue = msg.getToUserId();
                    if (!dbValue.equals(searchValue)) {
                        continue;
                    }
                }
                newDB.add(msg);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        db = newDB;
        Collections.sort(db, new Comparator<Message>() {
            @Override
            public int compare(Message o1, Message o2) {
                int factor = orderOrder.getSortDir().equals("DESC") ? -1 : +1;
                int retCompare = 0;
                if (orderOrder.getData().equals("messageId")) { // messageId
                    retCompare = o1.getMessageId().compareTo(o2.getMessageId()) * factor;
                } else if (orderOrder.getData().equals("messageTitle")) { // messageTitle
                    retCompare = o1.getMessageTitle().compareTo(o2.getMessageTitle()) * factor;
                } else if (orderOrder.getData().equals("creationDate")) { // creationDate
                    retCompare = o1.getCreationDate().compareTo(o2.getCreationDate()) * factor * -1;
                } else if (orderOrder.getData().equals("fromUserId")) { // fromUser
                    retCompare = o1.getFromUserId().compareTo(o2.getFromUserId()) * factor;
                } else if (orderOrder.getData().equals("toUserId")) { // toUser
                    retCompare = o1.getToUserId().compareTo(o2.getToUserId()) * factor;
                }
                return retCompare;
            }
        });
        for (int i = tableRequest.getStart();
                i < db.size() && i < (tableRequest.getStart() + tableRequest.getLength()); i++) {
            Message msg = db.get(i);
            Long fromUserId = msg.getFromUserId();
            Long toUserId = msg.getToUserId();
            User fromUser = new User();
            fromUser.setId(fromUserId);

            User dbUser = this.userService.readUserByUserId(fromUser);
            if (dbUser != null) {
                fromUser.setFirstName(dbUser.getFirstName());
                fromUser.setLastName(dbUser.getLastName());
                msg.setFromUser(fromUser);
            }

            User toUser = new User();
            toUser.setId(toUserId);

            dbUser = this.userService.readUserByUserId(toUser);
            if (dbUser != null) {
                toUser.setFirstName(dbUser.getFirstName());
                toUser.setLastName(dbUser.getLastName());
                msg.setToUser(toUser);
            }

            retList.add(msg);
        }

        DataTableResults<Message> dataTableResult = new DataTableResults<>();
        dataTableResult.setListOfDataObjects(retList);
        dataTableResult.setRecordsTotal(Long.valueOf(db.size()));
        dataTableResult.setRecordsFiltered(Long.valueOf(db.size()));
        dataTableResult.setDraw(tableRequest.getDraw());

        return dataTableResult;
    }

}
