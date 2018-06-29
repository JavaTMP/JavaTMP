package com.javatmp.web.controller.user;

import com.javatmp.domain.Document;
import com.javatmp.domain.User;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.service.DocumentService;
import com.javatmp.service.ServicesFactory;
import com.javatmp.service.UserService;
import com.javatmp.util.Constants;
import com.javatmp.util.MD5Util;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/DeleteUserController")
@MultipartConfig(fileSizeThreshold = 1024 * 15, maxFileSize = 1024 * 50, maxRequestSize = 1024 * 200)
public class DeleteUserController extends HttpServlet {

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
            logger.info("User to be deleted is [" + MvcHelper.toString(userToBeUpdated) + "]");

            dbUser = us.readUserByUserId(userToBeUpdated);
            logger.info("Existing DB User to be Updated is [" + MvcHelper.toString(dbUser) + "]");
            int updateStatus = 0;
//            updateStatus = us.updateCompleteUser(userToBeUpdated);

            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage("User deleted status [" + updateStatus + "]");
            responseMessage.setData(userToBeUpdated);

        } catch (IllegalArgumentException e) {
            logger.info("ERROR : " + e.getMessage());
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(e.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            responseMessage.setStatusCode(HttpServletResponse.SC_BAD_REQUEST);
        } catch (IllegalStateException e) {
            logger.info("ERROR : " + e.getMessage());
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage("The file to be uploaded exceeds its maximum permitted size of 51200 bytes - " + e.getMessage());
            response.setStatus(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE);
            responseMessage.setStatusCode(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(DeleteUserController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvocationTargetException ex) {
            Logger.getLogger(DeleteUserController.class.getName()).log(Level.SEVERE, null, ex);
        }
        MvcHelper.sendMessageAsJson(response, responseMessage);

    }
}
