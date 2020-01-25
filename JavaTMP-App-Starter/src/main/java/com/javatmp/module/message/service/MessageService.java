package com.javatmp.module.message.service;

import com.javatmp.fw.data.jpa.repository.JpaRepository;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.module.message.entity.Message;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import java.text.ParseException;
import javax.persistence.EntityManager;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.jpa.repository.support.JpaEntityInformation;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class MessageService extends JpaRepository<Message, Long> {

    private UserService userService;
    private EntityManager em;

    public MessageService(UserService userService,
            JpaEntityInformation<Message, Long> entityInformation, EntityManager entityManager) {
        super(entityInformation, entityManager);
        this.em = entityManager;
        this.userService = userService;
    }

    public Message readMessageById(Message message) {
        Message row = this.getOne(message.getMessageId());
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

    public DataTableResults<Message> listMessages(DataTableRequest<Message> tableRequest) throws ParseException {

        tableRequest.setClassType(Message.class);
        tableRequest.setSelects(new String[]{"messageId", "messageTitle", "messageContentText", "creationDate", "fromUserId", "toUserId", "messageStatus"});
        DataTableResults<Message> msgs = this.retrievePageRequestDetails(tableRequest);
        return msgs;
    }

}
