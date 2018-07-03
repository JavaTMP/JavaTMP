package com.javatmp.web.controller.user;

import com.javatmp.domain.User;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.service.DocumentService;
import com.javatmp.service.ServicesFactory;
import com.javatmp.service.UserService;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/DeactivateUserController")
public class DeactivateUserController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        DocumentService ds = sf.getDocumentService();
        UserService us = sf.getUserService();

        try {

            User userToBeUpdated = new User();
            User dbUser = null;

            MvcHelper.populateBeanByRequestParameters(request, userToBeUpdated);
            logger.info("User to be Deactivated is [" + MvcHelper.toString(userToBeUpdated) + "]");

            dbUser = us.readUserByUserId(userToBeUpdated);
            logger.info("Existing DB User to be Updated is [" + MvcHelper.toString(dbUser) + "]");
            int updateStatus = 0;
            updateStatus = us.deActivateUser(userToBeUpdated);

            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage("User Deactivated Successfully with status [" + updateStatus + "]");
            responseMessage.setData(userToBeUpdated);

        } catch (IllegalArgumentException e) {
            logger.info("ERROR : " + e.getMessage());
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(e.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            responseMessage.setStatusCode(HttpServletResponse.SC_BAD_REQUEST);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(DeactivateUserController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvocationTargetException ex) {
            Logger.getLogger(DeactivateUserController.class.getName()).log(Level.SEVERE, null, ex);
        }
        MvcHelper.sendMessageAsJson(response, responseMessage);

    }
}