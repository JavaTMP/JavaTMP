package com.javatmp.module.user;

import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.module.dms.service.DocumentService;
import com.javatmp.util.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.MessageFormat;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user/DeactivateUserController")
public class DeactivateUserController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        DocumentService ds = sf.getDocumentService();
        UserService us = sf.getUserService();
        HttpSession session = request.getSession();
        ResourceBundle labels = (ResourceBundle) session.getAttribute(Constants.LANGUAGE_ATTR_KEY);

        try {

            User userToBeUpdated = null;
            userToBeUpdated = (User) MvcHelper.readObjectFromRequest(request, User.class);
//            MvcHelper.populateBeanByRequestParameters(request, userToBeUpdated);
            logger.info("User to be Deactivated is [" + MvcHelper.toString(userToBeUpdated) + "]");

            int updateStatus = us.deActivateUser(userToBeUpdated);

            responseMessage.setOverAllStatus(true);
            responseMessage.setTitle(labels.getString("action.successTitle"));
            responseMessage.setMessage(MessageFormat.format(labels.getString("action.DeactivateUser.successMsg"), updateStatus));
            responseMessage.setData(userToBeUpdated);

        } catch (IllegalArgumentException e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(e.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            responseMessage.setStatusCode(HttpServletResponse.SC_BAD_REQUEST);
        }
        MvcHelper.sendMessageAsJson(response, responseMessage);
    }
}
