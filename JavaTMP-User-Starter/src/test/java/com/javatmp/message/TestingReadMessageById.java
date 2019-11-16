/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.message;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.module.message.entity.Message;
import com.javatmp.module.message.service.MessageService;
import com.javatmp.module.user.service.UserService;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.adapter.ClassTypeAdapter;
import com.javatmp.mvc.adapter.OrderDirTypeAdapter;
import com.javatmp.mvc.domain.table.DataTableRequest;
import com.javatmp.mvc.domain.table.DataTableResults;
import com.javatmp.mvc.domain.table.OrderDir;
import com.javatmp.util.JpaDaoHelper;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Logger;

/**
 *
 * @author JavaTMP
 */
public class TestingReadMessageById {

    private static final Logger logger = Logger.getLogger(TestingReadMessageById.class.getClass().getName());

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

        String msgReq = "{\"_ajaxGlobalBlockUI\":false,\"start\":0,\"length\":10,\"order\":[{\"column\":0,\"dir\":\"desc\"}],\"columns\":[{\"data\":\"creationDate\",\"name\":\"creationDate\",\"search\":{\"value\":\"2019-05-11T20:53:14.364+04:00\",\"operatorType\":\"olderThan\"}},{\"data\":\"toUserId\",\"name\":\"toUserId\",\"search\":{\"value\":\"1\"}}]}";
        DataTableRequest<Message> msgRequest = gson.fromJson(msgReq, DataTableRequest.class);

        logger.info(msgRequest.getColumns().toString());
        DataTableResults<Message> msgs;
        msgs = messageService.listMessages(msgRequest);

//        System.out.println(MvcHelper.deepToString(msgs));
        logger.info(msgs.getRecordsTotal().toString());
        for (Message m : msgs.getData()) {
            Message newMsg = messageService.readMessageById(m);
            logger.info(MvcHelper.toString(newMsg));
        }

    }

}
