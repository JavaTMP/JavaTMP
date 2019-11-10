/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.message;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.module.message.Message;
import com.javatmp.module.message.MessageService;
import com.javatmp.module.user.User;
import com.javatmp.mvc.adapter.ClassTypeAdapter;
import com.javatmp.mvc.adapter.OrderDirTypeAdapter;
import com.javatmp.mvc.domain.table.DataTableRequest;
import com.javatmp.mvc.domain.table.DataTableResults;
import com.javatmp.mvc.domain.table.OrderDir;
import com.javatmp.util.JpaDaoHelper;
import com.javatmp.module.user.UserService;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Logger;

/**
 *
 * @author JavaTMP
 */
public class TestingDynamicSelectMessages {

    private static final Logger logger = Logger.getLogger(TestingDynamicSelectMessages.class.getClass().getName());

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException, ParseException {
        JpaDaoHelper jpaDaoHelper;
        UserService userService;
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        userService = new UserService(jpaDaoHelper);
        MessageService messageService = new MessageService(jpaDaoHelper, userService);
//        messageService.generateMessages();
        Gson gson = new GsonBuilder()
                .setDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX").serializeNulls()
                .registerTypeAdapter(Class.class, new ClassTypeAdapter())
                .registerTypeAdapter(OrderDir.class, new OrderDirTypeAdapter())
                .create();

        String msgReq = "{\"draw\":2,\"columns\":[{\"data\":\"messageId\",\"name\":\"\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"2\",\"regex\":true}},{\"data\":\"messageTitle\",\"name\":\"\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"creationDate\",\"name\":\"\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"fromUserId\",\"name\":\"\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"toUserId\",\"name\":\"\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}}],\"order\":[{\"column\":0,\"dir\":\"asc\"}],\"start\":0,\"length\":10,\"search\":{\"value\":\"\",\"regex\":false},\"_ajaxGlobalBlockUI\":false}";
        msgReq = "{\"_ajaxGlobalBlockUI\":false,\"start\":0,\"length\":20,\"order\":[{\"column\":0,\"dir\":\"desc\"}],\"columns\":[{\"data\":\"creationDate\",\"name\":\"creationDate\",\"search\":{\"value\":\"2019-05-11T20:53:14.364+04:00\",\"operatorType\":\"olderThan\"}},{\"data\":\"toUserId\",\"name\":\"toUserId\",\"search\":{\"value\":\"1\"}}]}";
        DataTableRequest<Message> msgRequest = gson.fromJson(msgReq, DataTableRequest.class);

        logger.info(msgRequest.getColumns().toString());
        DataTableResults<Message> msgs;
        msgs = messageService.listMessages(msgRequest);

//        System.out.println(MvcHelper.deepToString(msgs));
        logger.info(msgs.getRecordsTotal().toString());
        for (Message m : msgs.getData()) {
            logger.info(m.getCreationDate().toString());
        }

        Map<Long, User> users = new HashMap<Long, User>();
        for (Message msg : msgs.getData()) {
            User msgUser = null;
            if ((msgUser = users.get(msg.getFromUserId())) == null) {
                msgUser = new User(msg.getFromUserId());
                msgUser = userService.readBasicUserById(msgUser);
                users.put(msgUser.getId(), msgUser);
            }
            msg.setFromUser(msgUser);
        }

    }

}
