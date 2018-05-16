package com.javatmp.web.controller.message;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.domain.Message;
import com.javatmp.domain.User;
import com.javatmp.mvc.ClassTypeAdapter;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.ResponseMessage;
import com.javatmp.service.MessageService;
import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
            MessageService ms = sf.getMessageService();

            HttpSession session = request.getSession();
            ResponseMessage responseMessage = new ResponseMessage();

            Message message = new Message();
            MvcHelper.populateBeanByRequestParameters(request, message);
            System.out.println("message to create [" + MvcHelper.deepToString(message) + "]");

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
                responseBody += "Message Created id [" + msg.getMessageId() + "]<br/>";
            }

            Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm:ss").serializeNulls()
                    .registerTypeAdapter(Class.class, new ClassTypeAdapter())
                    //                .registerTypeAdapter(Date.class, new DateTypeAdapter())
                    .create();

            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage(responseBody);
            String json = gson.toJson(responseMessage);
            System.out.println("response [" + json + "]");
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(CreateMessageController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvocationTargetException ex) {
            Logger.getLogger(CreateMessageController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
