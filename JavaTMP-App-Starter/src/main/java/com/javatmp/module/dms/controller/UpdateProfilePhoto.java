package com.javatmp.module.dms.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.module.dms.entity.Document;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.Date;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/dms/UpdateProfilePhoto")
public class UpdateProfilePhoto extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        ResponseMessage responseMessage = new ResponseMessage();
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("user");
        UserService us = sf.getUserService();
        try {
            int nRead;
            byte[] data = new byte[4 * 1024];
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            while ((nRead = request.getInputStream().read(data, 0, data.length)) != -1) {
                baos.write(data, 0, nRead);
            }
            String buffer = baos.toString();
            String base64Head = "base64,";
            int indexOfBase64 = buffer.indexOf(base64Head);
            String base64Image = buffer.substring(indexOfBase64 + base64Head.length());
            System.out.println(base64Image);
            String dataHead = "data:";
            String contentType = buffer.substring(dataHead.length(), indexOfBase64);
            System.out.println(contentType);
            byte[] imageData = Base64.getDecoder().decode(base64Image);
            Document fileUploading = new Document();
            fileUploading.setDocumentName("profile picture");
            fileUploading.setContentType(contentType);
            fileUploading.setDocumentContent(imageData);
            fileUploading.setDocumentType((short) 1);
            fileUploading.setStatus((short) 1);
            fileUploading.setCreationDate(new Date());
            fileUploading.setDocumentSize(imageData.length);
            long randomLongValue = Double.valueOf((Math.random() + 1) * 1000L).longValue();
            fileUploading.setRandomHash((Long) Math.abs(buffer.hashCode() + randomLongValue));
            fileUploading.setCreatedByUserId(loggedInUser.getId());

            us.updateUserPersonalProfilePhoto(loggedInUser, fileUploading);
            // update logged in user with update document:
            loggedInUser.setProfilePicDocumentId(fileUploading.getDocumentId());
            loggedInUser.setProfilePicDocument(new Document(fileUploading.getDocumentId(), fileUploading.getRandomHash()));
            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage("Personal Profile Photo Updated Successfully");
            responseMessage.setData(fileUploading);

        } catch (IllegalStateException e) {
            logger.info("ERROR : " + e.getMessage());
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage("The file to be uploaded exceeds its maximum permitted size of 51200 bytes");
            response.setStatus(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE);
            responseMessage.setStatusCode(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE);
        }
        MvcHelper.sendMessageAsJson(response, responseMessage);

    }
}
