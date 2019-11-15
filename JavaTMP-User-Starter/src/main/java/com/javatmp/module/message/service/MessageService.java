package com.javatmp.module.message.service;

import com.javatmp.module.message.entity.Message;
import com.javatmp.module.user.User;
import com.javatmp.module.user.UserService;
import com.javatmp.mvc.domain.table.DataTableRequest;
import com.javatmp.mvc.domain.table.DataTableResults;
import com.javatmp.util.JpaDaoHelper;
import java.text.ParseException;
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

//    public List<Message> getMessages() {
//        return this.jpaDaoHelper.findAll(Message.class);
//    }
    public Message readMessageById(Message message) {
        Message row = this.jpaDaoHelper.read(Message.class, message.getMessageId());

        Long fromUserId = row.getFromUserId();
        Long toUserId = row.getToUserId();
        User fromUser = new User();
        fromUser.setId(fromUserId);

        fromUser = this.userService.readBasicUserById(fromUser);
        if (fromUser != null) {
            row.setFromUser(fromUser);
        }

        User toUser = new User();
        toUser.setId(toUserId);

        toUser = this.userService.readBasicUserById(toUser);
        if (toUser != null) {
            row.setToUser(toUser);
        }
        return row;
    }

    public Message createMessage(Message message) {
        return this.jpaDaoHelper.create(message);
    }

    public DataTableResults<Message> listMessages(DataTableRequest<Message> tableRequest) throws ParseException {

        tableRequest.setClassType(Message.class);
        tableRequest.setSelects(new String[]{"messageId", "messageTitle", "messageContentText", "creationDate", "fromUserId", "toUserId", "messageStatus"});
        DataTableResults<Message> msgs = jpaDaoHelper.retrievePageRequestDetails(tableRequest);
        return msgs;
    }

}
