package com.javatmp.module.message.controller;

import com.javatmp.module.message.entity.Message;
import com.javatmp.module.message.service.MessageService;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import com.javatmp.mvc.domain.table.DataTableRequest;
import com.javatmp.mvc.domain.table.DataTableResults;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/message/ListMessagesController")
public class ListMessagesController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            ResponseMessage responseMessage = new ResponseMessage();
            ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
            MessageService cs = sf.getMessageService();
            UserService us = sf.getUserService();
            DataTableRequest tableRequest = (DataTableRequest) MvcHelper.readObjectFromRequest(request, DataTableRequest.class);
            logger.info("datatableRequest [" + MvcHelper.deepToString(tableRequest) + "]");

            DataTableResults<Message> dataTableResult = cs.listMessages(tableRequest);
            Map<Long, User> users = new HashMap<Long, User>();
            for (Message msg : dataTableResult.getData()) {
                User msgUser = null;
                if ((msgUser = users.get(msg.getFromUserId())) == null) {
                    msgUser = new User(msg.getFromUserId());
                    msgUser = us.readBasicUserById(msgUser);
                    users.put(msgUser.getId(), msgUser);
                }
                msg.setFromUser(msgUser);
            }
            responseMessage.setOverAllStatus(true);
            responseMessage.setData(dataTableResult);

            MvcHelper.sendMessageAsJson(response, responseMessage);
        } catch (ParseException ex) {
            logger.log(Level.SEVERE, null, ex);
            throw new ServletException(ex);
        }

    }
}
