package com.javatmp.module.message.controller;

import com.javatmp.module.message.entity.Message;
import com.javatmp.module.message.service.MessageService;
import com.javatmp.module.user.User;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/message/CreateMessageController")
public class CreateMessageController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
            MessageService ms = sf.getMessageService();

            HttpSession session = request.getSession();
            ResponseMessage responseMessage = new ResponseMessage();

            Message message = new Message();
            MvcHelper.populateBeanByRequestParameters(request, message);
            logger.info("message to create [" + MvcHelper.deepToString(message) + "]");

            User loggedInUser = (User) session.getAttribute("user");
            String responseBody = "";
            for (Long to : message.getMessageTos()) {
                Message msg = new Message();
                msg.setFromUserId(loggedInUser.getId());
                msg.setToUserId(to);
                msg.setCreationDate(new Date());
                msg.setMessageContentText(message.getMessageContentText());
                msg.setMessageTitle(message.getMessageTitle());
                msg.setMessageStatus((short) 1);
                ms.createMessage(msg);
                logger.info("message after created [" + MvcHelper.toString(msg) + "]");
                responseBody += "Message Created id [" + msg.getMessageId() + "]<br/>";
            }
            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage(responseBody);

            MvcHelper.sendMessageAsJson(response, responseMessage);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(CreateMessageController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvocationTargetException ex) {
            Logger.getLogger(CreateMessageController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
