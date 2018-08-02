package com.javatmp.web.controller.user;

import com.javatmp.domain.Country;
import com.javatmp.domain.Document;
import com.javatmp.domain.Language;
import com.javatmp.domain.Theme;
import com.javatmp.domain.Timezone;
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
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/user/CurrentUserProfileController")
@MultipartConfig(fileSizeThreshold = 1024 * 15, maxFileSize = 1024 * 100, maxRequestSize = 1024 * 200)
public class CurrentUserProfileController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestPage = "/WEB-INF/pages/user/current-user-profile.jsp";
        ServletContext context = request.getServletContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        ServicesFactory sf = (ServicesFactory) context.getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);

        User dbUser = sf.getUserService().readCompleteUserById(user);
        List<Timezone> timezones = sf.getTimezoneService().getTimezones();
        List<Country> countries = sf.getCountryService().getCountries();
        List<Language> languages = sf.getLanguageService().getLanguages();
        List<Theme> themes = sf.getThemeService().getThemes();
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
        try {

            User userToBeUpdated = new User();
            User dbUser = sf.getUserService().readCompleteUserById(user);
            String oldPassword = request.getParameter("oldPassword");
            MvcHelper.populateBeanByRequestParameters(request, userToBeUpdated);
            logger.info("User to be Updated is [" + MvcHelper.toString(userToBeUpdated) + "]");

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

            Locale locale = Locale.forLanguageTag(userToBeUpdated.getLang());
            ResourceBundle bundle = ResourceBundle.getBundle(Constants.RESOURCE_BUNDLE_BASE_NAME, locale);
            session.setAttribute(Constants.LANGUAGE_ATTR_KEY, bundle);
            session.setAttribute("user", userToBeUpdated);

            responseMessage.setOverAllStatus(Boolean.TRUE);
            responseMessage.setRedirect(Boolean.TRUE);
            responseMessage.setMessage("User Updated successfully");
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
            logger.log(Level.SEVERE, null, ex);
        } catch (InvocationTargetException ex) {
            logger.log(Level.SEVERE, null, ex);
        }
        MvcHelper.sendMessageAsJson(response, responseMessage);

    }

}
