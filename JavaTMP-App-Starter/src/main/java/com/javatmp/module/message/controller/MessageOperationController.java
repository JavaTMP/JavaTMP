package com.javatmp.module.message.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.module.message.entity.Message;
import com.javatmp.module.message.service.MessageService;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import com.javatmp.util.Constants;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

@Slf4j
@Controller
@RequestMapping("/message")
public class MessageOperationController {

    @Autowired
    MessageService messageService;

    @Autowired
    UserService userService;

    @PostMapping("/CreateMessageController")
    public @ResponseBody
    ResponseMessage CreateMessageController(@SessionAttribute(Constants.LOG_IN_USER_NAME) User loggedInUser,
            Message message, HttpServletRequest request, HttpServletResponse response) {

        ResponseMessage responseMessage = new ResponseMessage();

        log.info("message to create [" + (message) + "]");

        String responseBody = "";
        for (Long to : message.getMessageTos()) {
            Message msg = new Message();
            msg.setFromUserId(loggedInUser.getId());
            msg.setToUserId(to);
            msg.setCreationDate(new Date());
            msg.setMessageContentText(message.getMessageContentText());
            msg.setMessageTitle(message.getMessageTitle());
            msg.setMessageStatus((short) 1);
            this.messageService.save(msg);
            log.info("message after created [" + (msg) + "]");
            responseBody += "Message Created id [" + msg.getMessageId() + "]<br/>";
        }
        responseMessage.setOverAllStatus(true);
        responseMessage.setMessage(responseBody);
        return responseMessage;
    }

    @GetMapping("/ViewMessageController")
    public String viewMessageController(ModelMap model, Message message, HttpServletRequest request, HttpServletResponse response) {

        log.info("message to read [" + (message) + "]");

        message = this.messageService.readMessageById(message);

        model.addAttribute("message", message);
        return "/pages/message/ViewMessage.jsp";

    }

    @PostMapping("/ViewMessageController")
    public @ResponseBody
    ResponseMessage doPost(@RequestBody DataTableRequest tableRequest, ResponseMessage responseMessage, HttpServletRequest request, HttpServletResponse response) throws ParseException {

        log.info("datatableRequest [" + (tableRequest) + "]");

        DataTableResults<Message> dataTableResult = this.messageService.listMessages(tableRequest);
        Map<Long, User> users = new HashMap<Long, User>();
        for (Message msg : dataTableResult.getData()) {
            User msgUser = null;
            if ((msgUser = users.get(msg.getFromUserId())) == null) {
                msgUser = new User(msg.getFromUserId());
                msgUser = this.userService.readBasicUserById(msgUser);
                users.put(msgUser.getId(), msgUser);
            }
            msg.setFromUser(msgUser);
        }
        responseMessage.setOverAllStatus(true);
        responseMessage.setData(dataTableResult);

        return responseMessage;

    }

}
