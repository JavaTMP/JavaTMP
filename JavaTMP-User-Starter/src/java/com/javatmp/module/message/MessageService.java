package com.javatmp.module.message;

import com.javatmp.module.event.DBFaker;
import com.javatmp.module.user.User;
import com.javatmp.module.user.UserService;
import com.javatmp.mvc.domain.table.DataTableColumnSpecs;
import com.javatmp.mvc.domain.table.DataTableRequest;
import com.javatmp.mvc.domain.table.DataTableResults;
import com.javatmp.mvc.domain.table.Order;
import com.javatmp.mvc.domain.table.Search;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.util.JpaDaoHelper;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;
import java.util.logging.Logger;

public class MessageService {

    private final Logger logger = Logger.getLogger(getClass().getName());
    private final JpaDaoHelper jpaDaoHelper;
    private UserService userService;

    public MessageService(JpaDaoHelper jpaDaoHelper, UserService userService) {
        this.jpaDaoHelper = jpaDaoHelper;
        this.userService = userService;
    }

    public Long getAllCount() {
        return this.jpaDaoHelper.getAllCount(Message.class);
    }

    public List<Message> getMessages() {
        return this.jpaDaoHelper.findAll(Message.class);
    }

    public Message readMessageById(Message message) {
        List<Message> db = this.getMessages();
        for (Message row : db) {
            if (row.getMessageId().equals(message.getMessageId())) {
                Long fromUserId = row.getFromUserId();
                Long toUserId = row.getToUserId();
                User fromUser = new User();
                fromUser.setId(fromUserId);

                fromUser = this.userService.readCompleteUserById(fromUser);
                if (fromUser != null) {
                    row.setFromUser(fromUser);
                }

                User toUser = new User();
                toUser.setId(toUserId);

                toUser = this.userService.readUserByUserId(toUser);
                if (toUser != null) {
                    row.setToUser(toUser);
                }
                return row;
            }
        }
        throw new IllegalArgumentException("Record id [" + message.getMessageId() + "] Not found");
    }

    public Message createMessage(Message message) {
        return this.jpaDaoHelper.create(message);
    }

    public DataTableResults<Message> listMessages(DataTableRequest<Message> tableRequest) {
        List<Message> retList = new LinkedList<>();
        List<Message> database = this.getMessages();
        List<Message> db = null;
        List<Order> orders = tableRequest.getOrder();
        logger.info("Order requested [" + orders + "]");
        logger.info("is global search provide");
        if (tableRequest.isGlobalSearch()) {
            logger.info("*** isGlobalSearch starting ***");
            String query = tableRequest.getSearch().getValue().trim().toLowerCase();
            db = new LinkedList<>();
            for (Message msg : database) {
                String userStr = MvcHelper.deepToString(msg);
                if (userStr.toLowerCase().contains(query)) {
                    db.add(msg);
                }
            }
        } else {
            db = new LinkedList<>(this.getMessages());
        }

        for (DataTableColumnSpecs s : tableRequest.getColumns()) {
            System.out.println(s.getName() + " - " + s.getSearch());
        }

        logger.info("Start mapping search parameteres");
        Map<String, Search> searchParameters = new HashMap<>();
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

        logger.info("search [" + searchParameters + "]");
// apply individual column search:
        List<Message> newDB = new LinkedList<>();
        for (Message msg : db) {
            try {
                if (searchParameters.get("messageId") != null && !searchParameters.get("messageId").getValue().equals("")) {
                    Search searchValueObject = searchParameters.get("messageId");
                    Long searchValue = new Long(searchValueObject.getValue());
                    Long dbValue = msg.getMessageId();
                    if (!dbValue.equals(searchValue)) {
                        continue;
                    }
                }
                if (searchParameters.get("messageTitle") != null && searchParameters.get("messageTitle").getValue() != null && !searchParameters.get("messageTitle").getValue().equals("")) {
                    Search searchValueObject = searchParameters.get("messageTitle");
                    String searchValue = searchValueObject.getValue().trim().toLowerCase();
                    String dbValue = msg.getMessageTitle();
                    if (!dbValue.toLowerCase().contains(searchValue)) {
                        continue;
                    }
                }
                if (searchParameters.get("creationDate") != null && searchParameters.get("creationDate").getValue() != null && !searchParameters.get("creationDate").getValue().equals("")) {
                    Search searchValueObject = searchParameters.get("creationDate");
                    String searchValue = searchValueObject.getValue();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
                    Date dbValue = msg.getCreationDate();
                    Date searchDate = sdf.parse(searchValue);
                    Long search = searchDate.getTime();
//                    System.out.println("to[" + msg.getFromUserId() + "] db msg id [" + msg.getMessageId() + "] Operator [" + searchValueObject.getOperatorType() + "], search[" + searchDate + "] , database [" + dbValue + "]");
                    if ((dbValue.getTime() >= search) && (searchValueObject.getOperatorType() != null && searchValueObject.getOperatorType().equals("olderThan"))) {
                        //escape current
//                        System.out.println("escaped 1");
                        continue;
                    } else if ((dbValue.getTime() <= search) && (searchValueObject.getOperatorType() != null && searchValueObject.getOperatorType().equals("newerThan"))) {
                        //escape current
//                        System.out.println("escaped 2");
                        continue;
                    } else if ((dbValue.getTime() != search) && (searchValueObject.getOperatorType() != null && searchValueObject.getOperatorType().equals("equalThan"))) {
                        //escape current
//                        System.out.println("escaped 3");
                        continue;
                    } else if (dbValue.getTime() != search && (searchValueObject.getOperatorType() == null || searchValueObject.getOperatorType().equals(""))) {
                        //escape current
//                        System.out.println("escaped 4");
                        continue;
                    }
                }
                if (searchParameters.get("fromUserId") != null && searchParameters.get("fromUserId").getValue() != null && !searchParameters.get("fromUserId").getValue().equals("")) {
                    Search searchValueObject = searchParameters.get("fromUserId");
                    String searchValueStr = searchValueObject.getValue().trim().toLowerCase();
                    Long searchValue = new Long(searchValueStr);
                    Long dbValue = msg.getFromUserId();
                    if (!dbValue.equals(searchValue)) {
                        continue;
                    }
                }
                if (searchParameters.get("toUserId") != null && searchParameters.get("toUserId").getValue() != null && !searchParameters.get("toUserId").getValue().equals("")) {
                    Search searchValueObject = searchParameters.get("toUserId");
                    String searchValueStr = searchValueObject.getValue().trim().toLowerCase();
                    Long searchValue = new Long(searchValueStr);
                    Long dbValue = msg.getToUserId();
                    if (!dbValue.equals(searchValue)) {
//                        System.out.println("escaped 5");
                        continue;
                    }
                }
//                System.out.println("msg added [" + msg.getMessageId() + "]");
                newDB.add(msg);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        db = newDB;
        Collections.sort(db, new Comparator<Message>() {
            @Override
            public int compare(Message o1, Message o2) {
                int retCompare = 0;
//                logger.info("Could we order [" + !(orders == null || orders.size() == 0) + "]");
                if (orders == null || orders.size() == 0) {
                    return retCompare;
                }
                // we support only one sort:
                Order order = orders.get(0);
//                logger.info("Order by [" + order + "]");
                int factor = order.getDir().value().equals("desc") ? -1 : +1;
//                logger.info("Order factor [" + factor + "]");
                DataTableColumnSpecs orderColumn = tableRequest.getColumns().get(order.getColumn());
//                logger.info("orderColumn [" + orderColumn + "]");
//                logger.info("Order by column [" + orderColumn + "]");
                if (!(orderColumn != null && orderColumn.getData() != null)) {
                    return retCompare;
                }
                String orderColumnName = orderColumn.getData();
//                logger.info("Order by column name [" + orderColumnName + "]");
                if ("messageId".equals(orderColumnName)) { // messageId
                    retCompare = o1.getMessageId().compareTo(o2.getMessageId()) * factor;
                } else if ("messageTitle".equals(orderColumnName)) { // messageTitle
                    retCompare = o1.getMessageTitle().compareTo(o2.getMessageTitle()) * factor;
                } else if ("creationDate".equals(orderColumnName)) { // creationDate
                    retCompare = o1.getCreationDate().compareTo(o2.getCreationDate()) * factor * -1;
                } else if ("fromUserId".equals(orderColumnName)) { // fromUser
                    retCompare = o1.getFromUserId().compareTo(o2.getFromUserId()) * factor;
                } else if ("toUserId".equals(orderColumnName)) { // toUser
                    retCompare = o1.getToUserId().compareTo(o2.getToUserId()) * factor;
                }
                return retCompare;
            }
        });
        System.out.println("return result size [" + db.size() + "]");
        for (int i = tableRequest.getStart();
                i < db.size() && i < (tableRequest.getStart() + tableRequest.getLength()); i++) {
            Message msg = db.get(i);
            Long fromUserId = msg.getFromUserId();
            Long toUserId = msg.getToUserId();
            User fromUser = new User();
            fromUser.setId(fromUserId);

            User dbUser = this.userService.readCompleteUserById(fromUser);
            if (dbUser != null) {
                fromUser.setFirstName(dbUser.getFirstName());
                fromUser.setLastName(dbUser.getLastName());
                msg.setFromUser(dbUser);
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
        dataTableResult.setData(retList);
        dataTableResult.setRecordsTotal(Long.valueOf(db.size()));
        dataTableResult.setRecordsFiltered(Long.valueOf(db.size()));
        dataTableResult.setDraw(tableRequest.getDraw());

        return dataTableResult;
    }
    private static Long counter = 0L;

    public static synchronized Long getNextCounter() {
        return ++counter;
    }

    public void generateMessages() {

        Random rand = new Random();
        List<User> users = this.userService.getUsers();
        for (int i = 0; i < users.size(); i++) {
            Long from = users.get(i).getId();
            // get random to:
            for (int j = 0; j < 250; j++) {
                int randomTo = 0;
                while ((randomTo = rand.nextInt(users.size())) == i);
//                logger.info("i[" + i + "] => random to is [" + randomTo + "]");
                Long to = users.get(randomTo).getId();
                Message message = new Message();
                message.setFromUserId(from);
                message.setToUserId(to);
                message.setMessageStatus((short) 1);
                message.setMessageTitle("Fake Message number " + getNextCounter());

                message.setMessageContentText("<p>A fake data summary text to show you number " + getNextCounter() + " geneated from fake database, Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>");

                Calendar calendar = Calendar.getInstance();
                int randomDayOfMonth = ThreadLocalRandom.current().nextInt(31);
                calendar.add(Calendar.DAY_OF_MONTH, randomDayOfMonth * -1);
                if (randomDayOfMonth != 0) {
                    calendar.set(Calendar.HOUR_OF_DAY, ThreadLocalRandom.current().nextInt(24));
                    calendar.set(Calendar.MINUTE, ThreadLocalRandom.current().nextInt(60));
                    calendar.set(Calendar.SECOND, ThreadLocalRandom.current().nextInt(60));
                    calendar.set(Calendar.MILLISECOND, ThreadLocalRandom.current().nextInt(1000));
                } else {
                    int value = 0;
                    value = calendar.get(Calendar.HOUR_OF_DAY);
                    calendar.set(Calendar.HOUR_OF_DAY, ThreadLocalRandom.current().nextInt(value == 0 ? 1 : value));
                    value = calendar.get(Calendar.MINUTE);
                    calendar.set(Calendar.MINUTE, ThreadLocalRandom.current().nextInt(value == 0 ? 1 : value));
                    value = calendar.get(Calendar.SECOND);
                    calendar.set(Calendar.SECOND, ThreadLocalRandom.current().nextInt(value == 0 ? 1 : value));
                    value = calendar.get(Calendar.MILLISECOND);
                    calendar.set(Calendar.MILLISECOND, ThreadLocalRandom.current().nextInt(value == 0 ? 1 : value));
                }

                message.setCreationDate(calendar.getTime());
                this.createMessage(message);
            }
        }
    }

}
