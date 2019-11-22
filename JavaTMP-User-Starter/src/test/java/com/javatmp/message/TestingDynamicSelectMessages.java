/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.message;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.fw.domain.table.OrderDir;
import com.javatmp.fw.mvc.adapter.ClassTypeAdapter;
import com.javatmp.fw.mvc.adapter.OrderDirTypeAdapter;
import com.javatmp.module.message.entity.Message;
import com.javatmp.module.message.service.MessageService;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Logger;
import javax.persistence.Persistence;

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
        UserService userService;
        userService = new UserService("AppPU");
        MessageService messageService = new MessageService(Persistence.createEntityManagerFactory("AppPU"), userService);
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
