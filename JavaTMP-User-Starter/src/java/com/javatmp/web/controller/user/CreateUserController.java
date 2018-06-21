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
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.nio.file.Paths;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/user/CreateUserController")
@MultipartConfig(fileSizeThreshold = 1024 * 15, maxFileSize = 1024 * 50, maxRequestSize = 1024 * 200)
public class CreateUserController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestPage = "/WEB-INF/pages/user/addNewUser.jsp";

        // prepare a list of timezones - you should prepare them once instead of each request.
        String[] ids = TimeZone.getAvailableIDs();
        List<String[]> timezones = new LinkedList<>();
        for (String id : ids) {
            TimeZone zone = TimeZone.getTimeZone(id);
            int offset = zone.getRawOffset() / 1000;
            int hour = offset / 3600;
            int minutes = (offset % 3600) / 60;
            String displayName = zone.getDisplayName();
            String d = zone.getDisplayName(zone.useDaylightTime(), TimeZone.SHORT);
            String displayTimezoneInfo = String.format(new Locale("ar"), "(GMT%+03d:%02d) %s - %s (%s)", hour, Math.abs(minutes), id, displayName, d);
            System.out.println(displayTimezoneInfo);

            String[] timezone = new String[2];
            timezone[0] = id;
            timezone[1] = displayTimezoneInfo;
            timezones.add(timezone);
        }
        request.setAttribute("timezones", timezones);
        request.getRequestDispatcher(requestPage).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        DocumentService ds = sf.getDocumentService();
        UserService us = sf.getUserService();

        String text = "";
        try {

            User userToBeCreated = new User();

            MvcHelper.populateBeanByRequestParameters(request, userToBeCreated);
            logger.info("User to be created is [" + MvcHelper.toString(userToBeCreated) + "]");
            Part filePart = request.getPart("profilePicture"); // Retrieves <input type="file" name="file">
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
            String contentType = filePart.getContentType();
            InputStream fileContentStream = filePart.getInputStream();
            String fieldName = filePart.getName();
            long partSize = filePart.getSize();
            logger.info("partSize [" + partSize + "]");

            Document fileUploading = new Document();
            fileUploading.setContentType(contentType);
            fileUploading.setDocumentName(fileName);
            fileUploading.setDocumentSize(partSize);
            fileUploading.setCreationDate(new Date());
            long randomLongValue = Double.valueOf((Math.random() + 1) * 1000L).longValue();
            fileUploading.setRandomHash((Long) Math.abs(fileUploading.getDocumentName().hashCode() + randomLongValue));
            // the following block is intended for simple cases
            // where it is convenient to read all bytes into a byte array.
            // It is not intended for reading input streams with large amounts of data.
            int nRead;
            byte[] data = new byte[4 * 1024];
            ByteArrayOutputStream buffer = new ByteArrayOutputStream();
            while ((nRead = fileContentStream.read(data, 0, data.length)) != -1) {
                buffer.write(data, 0, nRead);
            }

            fileUploading.setDocumentContent(buffer.toByteArray());
            logger.info("original size [" + fileUploading.getDocumentSize()
                    + "] stream size [" + fileUploading.getDocumentContent().length + "]");
            ds.createNewDocument(fileUploading);
            logger.info("db fake id [" + fileUploading.getDocumentId() + "]");
            String t = "FileName 'requested' \"to\" Upload [" + fileName + "] type[" + contentType + "] name [" + fieldName + "]size[" + partSize + "]<br/>";
            logger.info(t);
            text += t;
            System.out.println("Text[" + text + "]");
            userToBeCreated.setProfilePicDocumentId(fileUploading.getDocumentId());

            logger.info("UserToBeCreated is [" + MvcHelper.deepToString(userToBeCreated) + "]");
            userToBeCreated.setPassword(MD5Util.convertToMD5(userToBeCreated.getPassword()));
            userToBeCreated.setCreationDate(new Date());
            userToBeCreated.setStatus((short) 1);

            us.createNewUser(userToBeCreated);

            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage("User Created successfully");
            responseMessage.setData(userToBeCreated);

            MvcHelper.sendMessageAsJson(response, responseMessage);

        } catch (IllegalStateException e) {
            logger.info("ERROR : " + e.getMessage());
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage("The file to be uploaded exceeds its maximum permitted size of 51200 bytes - " + e.getMessage());
            response.setStatus(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE);
            responseMessage.setStatusCode(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(CreateUserController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvocationTargetException ex) {
            Logger.getLogger(CreateUserController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
