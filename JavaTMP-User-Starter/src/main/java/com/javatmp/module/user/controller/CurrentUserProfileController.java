package com.javatmp.module.user.controller;

import com.javatmp.module.country.Countrytranslation;
import com.javatmp.module.dms.entity.Document;
import com.javatmp.module.dms.service.DocumentService;
import com.javatmp.module.language.Languagetranslation;
import com.javatmp.module.theme.Themetranslation;
import com.javatmp.module.timezone.Timezonetranslation;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.util.Constants;
import com.javatmp.util.MD5Util;
import com.javatmp.util.ServicesFactory;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Locale;
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

@WebServlet("/user/CurrentUserProfileController")
@MultipartConfig(fileSizeThreshold = 1024 * 15, maxFileSize = 1024 * 100, maxRequestSize = 1024 * 200)
public class CurrentUserProfileController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestPage = "/WEB-INF/pages/user/current-user-profile.jsp";
        ServletContext context = request.getServletContext();
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("user");

        ServicesFactory sf = (ServicesFactory) context.getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);

        User dbUser = sf.getUserService().readCompleteUserById(loggedInUser);
        List<Timezonetranslation> timezones = sf.getTimezoneService().getTimezones(loggedInUser);
        List<Countrytranslation> countries = sf.getCountryService().getCountries(loggedInUser);
        List<Languagetranslation> languages = sf.getLanguageService().getLanguages(loggedInUser);
        List<Themetranslation> themes = sf.getThemeService().getThemes(loggedInUser);
        request.setAttribute("themes", themes);
        request.setAttribute("languages", languages);
        request.setAttribute("countries", countries);
        request.setAttribute("timezones", timezones);
        request.setAttribute("user", dbUser);
        request.getRequestDispatcher(requestPage).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        DocumentService ds = sf.getDocumentService();
        UserService us = sf.getUserService();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        ResourceBundle labels = (ResourceBundle) session.getAttribute(Constants.LANGUAGE_ATTR_KEY);
        try {

            User userToBeUpdated = new User();
            User dbUser = sf.getUserService().readCompleteUserById(user);
            String oldPassword = request.getParameter("oldPassword");
            MvcHelper.populateBeanByRequestParameters(request, userToBeUpdated);
            logger.info("User to be Updated is [" + MvcHelper.deepToString(userToBeUpdated) + "]");

            // first check if existing db password equal provided old password:
            logger.info("Old Password is [" + oldPassword + "]");
            if (dbUser.getPassword().equals(MD5Util.convertToMD5(oldPassword)) == false) {
                throw new IllegalArgumentException("Existing Password does not match provided old password");
            }

            userToBeUpdated.setPassword(MD5Util.convertToMD5(userToBeUpdated.getPassword()));
            Document fileUploading = MvcHelper.readDocumentFromRequestIfExist(request, "profilePicture");
            if (fileUploading != null) {
                fileUploading.setDocumentType((short) 1);
                fileUploading.setStatus((short) 1);
                fileUploading.setDocumentId(dbUser.getProfilePicDocumentId());
                userToBeUpdated.setProfilePicDocument(fileUploading);
                userToBeUpdated.setProfilePicDocumentId(fileUploading.getDocumentId());

            }

            int updateStatus = us.updateCompleteUser(userToBeUpdated);

            logger.info("Updated User is [" + MvcHelper.toString(userToBeUpdated) + "]");

            // When we don't update profile picture and database contains one
            // We make sure that the current session object has its information:
            if (userToBeUpdated.getProfilePicDocumentId() == null && dbUser.getProfilePicDocument() != null) {
                Document dbProfileDocument = dbUser.getProfilePicDocument();
                userToBeUpdated.setProfilePicDocument(dbProfileDocument);
                userToBeUpdated.setProfilePicDocumentId(dbProfileDocument.getDocumentId());
                dbProfileDocument.setDocumentContent(null);
                dbProfileDocument.setContentType(null);
                dbProfileDocument.setCreationDate(null);
                dbProfileDocument.setDocumentName(null);
                dbProfileDocument.setDocumentSize(0);
            }

            Locale locale = Locale.forLanguageTag(userToBeUpdated.getLang());
            ResourceBundle bundle = ResourceBundle.getBundle(Constants.RESOURCE_BUNDLE_BASE_NAME, locale);
            session.setAttribute(Constants.LANGUAGE_ATTR_KEY, bundle);
            session.setAttribute("user", userToBeUpdated);

            responseMessage.setOverAllStatus(Boolean.TRUE);
            responseMessage.setRedirect(Boolean.TRUE);
            responseMessage.setMessage(labels.getString("user.action.CurrentUser.successMsg"));
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
        } catch (IllegalArgumentException ex) {
            logger.log(Level.SEVERE, ex.getMessage(), ex);
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(ex.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            responseMessage.setStatusCode(HttpServletResponse.SC_BAD_REQUEST);
        } catch (IllegalStateException ex) {
            logger.log(Level.SEVERE, ex.getMessage(), ex);
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage("The file to be uploaded exceeds its maximum permitted size of 51200 bytes - " + ex.getMessage());
            response.setStatus(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE);
            responseMessage.setStatusCode(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE);
        } catch (IllegalAccessException ex) {
            logger.log(Level.SEVERE, ex.getMessage(), ex);
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(ex.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            responseMessage.setStatusCode(HttpServletResponse.SC_BAD_REQUEST);
        } catch (InvocationTargetException ex) {
            logger.log(Level.SEVERE, ex.getMessage(), ex);
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(ex.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            responseMessage.setStatusCode(HttpServletResponse.SC_BAD_REQUEST);
        }
        MvcHelper.sendMessageAsJson(response, responseMessage);

    }

}
