package com.javatmp.module.user;

import com.javatmp.module.country.Country;
import com.javatmp.module.country.Countrytranslation;
import com.javatmp.module.dms.Document;
import com.javatmp.module.language.Language;
import com.javatmp.module.language.Languagetranslation;
import com.javatmp.module.theme.Theme;
import com.javatmp.module.theme.Themetranslation;
import com.javatmp.module.timezone.Timezone;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.module.dms.DocumentService;
import com.javatmp.util.ServicesFactory;
import com.javatmp.util.Constants;
import com.javatmp.util.MD5Util;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.PersistenceException;
import javax.servlet.ServletContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/user/CreateUserController")
@MultipartConfig(fileSizeThreshold = 1024 * 15, maxFileSize = 1024 * 100, maxRequestSize = 1024 * 200)
public class CreateUserController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestPage = "/WEB-INF/pages/user/addNewUser.jsp";
        ServletContext context = request.getServletContext();
        ServicesFactory sf = (ServicesFactory) context.getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("user");
        List<Timezone> timezones = sf.getTimezoneService().getTimezones();
        List<Countrytranslation> countries = sf.getCountryService().getCountries(loggedInUser);
        List<Languagetranslation> languages = sf.getLanguageService().getLanguages(loggedInUser);
        List<Themetranslation> themes = sf.getThemeService().getThemes(loggedInUser);
        request.setAttribute("themes", themes);
        request.setAttribute("languages", languages);
        request.setAttribute("countries", countries);
        request.setAttribute("timezones", timezones);
        request.getRequestDispatcher(requestPage).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        DocumentService ds = sf.getDocumentService();
        UserService us = sf.getUserService();
        HttpSession session = request.getSession();
        ResourceBundle labels = (ResourceBundle) session.getAttribute(Constants.LANGUAGE_ATTR_KEY);

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
            String t = "FileName 'requested' \"to\" Upload [" + fileName + "] type[" + contentType + "] name [" + fieldName + "]size[" + partSize + "]<br/>";
            logger.info(t);

            userToBeCreated.setProfilePicDocument(fileUploading);
            logger.info("UserToBeCreated is [" + MvcHelper.toString(userToBeCreated) + "]");
            userToBeCreated.setPassword(MD5Util.convertToMD5(userToBeCreated.getPassword()));
            userToBeCreated.setCreationDate(new Date());
            userToBeCreated.setStatus((short) 1);

            us.createNewUser(userToBeCreated);

            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage(labels.getString("action.createUser.successMsg"));
            responseMessage.setData(userToBeCreated);

        } catch (IllegalStateException e) {
            logger.info("ERROR : " + e.getMessage());
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(labels.getString("action.createUser.wrongDocumentSize"));
            response.setStatus(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE);
            responseMessage.setStatusCode(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE);
        } catch (PersistenceException e) {
            Throwable t = e;
            while (t.getCause() != null) {
                t = t.getCause();
            }
            logger.log(Level.SEVERE, t.getMessage(), t);
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(t.getMessage());
        } catch (IllegalAccessException | InvocationTargetException ex) {
            logger.log(Level.SEVERE, ex.getMessage(), ex);
            throw new ServletException(ex);
        }

        MvcHelper.sendMessageAsJson(response, responseMessage);

    }
}
