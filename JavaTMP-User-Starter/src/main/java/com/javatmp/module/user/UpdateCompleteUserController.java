package com.javatmp.module.user;

import com.javatmp.module.dms.Document;
import com.javatmp.module.dms.DocumentService;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.util.Constants;
import com.javatmp.util.MD5Util;
import com.javatmp.util.ServicesFactory;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.PersistenceException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/UpdateCompleteUserController")
@MultipartConfig(fileSizeThreshold = 1024 * 15, maxFileSize = 1024 * 100, maxRequestSize = 1024 * 200)
public class UpdateCompleteUserController extends HttpServlet {

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
            String oldPassword = request.getParameter("oldPassword");
            MvcHelper.populateBeanByRequestParameters(request, userToBeUpdated);
            logger.info("User to be Updated is [" + MvcHelper.toString(userToBeUpdated) + "]");

            dbUser = us.readCompleteUserById(userToBeUpdated);
            logger.info("Existing DB User to be Updated is [" + MvcHelper.toString(dbUser) + "]");

            // first check if existing db password equal provided old password:
            if (dbUser.getPassword().equals(MD5Util.convertToMD5(oldPassword)) == false) {
                throw new IllegalArgumentException("Existing Password does not match provided old password");
            }

            logger.info("UserToBeCreated is [" + MvcHelper.deepToString(userToBeUpdated) + "]");
            userToBeUpdated.setPassword(MD5Util.convertToMD5(userToBeUpdated.getPassword()));

            Document fileUploading = MvcHelper.readDocumentFromRequestIfExist(request, "profilePicture");
            if (fileUploading != null) {
                fileUploading.setDocumentId(dbUser.getProfilePicDocumentId());
                userToBeUpdated.setProfilePicDocument(fileUploading);
                userToBeUpdated.setProfilePicDocumentId(fileUploading.getDocumentId());
            }

            int updateStatus = us.updateCompleteUser(userToBeUpdated);

            responseMessage.setOverAllStatus(Boolean.TRUE);
            responseMessage.setMessage("User Updated successfully");
            responseMessage.setData(userToBeUpdated);
        } catch (PersistenceException e) {
            Throwable t = e;
            while (t.getCause() != null) {
                t = t.getCause();
            }
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(t.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            responseMessage.setStatusCode(HttpServletResponse.SC_BAD_REQUEST);
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
            logger.log(Level.SEVERE, null, ex);
        } catch (InvocationTargetException ex) {
            logger.log(Level.SEVERE, null, ex);
        }
        MvcHelper.sendMessageAsJson(response, responseMessage);

    }
}
