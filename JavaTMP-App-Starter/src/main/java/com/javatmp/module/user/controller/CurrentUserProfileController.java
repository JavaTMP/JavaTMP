package com.javatmp.module.user.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.fw.util.Util;
import com.javatmp.module.country.entity.Countrytranslation;
import com.javatmp.module.dms.entity.Document;
import com.javatmp.module.language.entity.Languagetranslation;
import com.javatmp.module.theme.entity.Themetranslation;
import com.javatmp.module.timezone.entity.Timezonetranslation;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import com.javatmp.util.Constants;
import com.javatmp.util.MD5Util;
import com.javatmp.util.ServicesFactory;
import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

@Slf4j
@Controller
public class CurrentUserProfileController {

    @Autowired
    UserService userService;

    @GetMapping("/user/CurrentUserProfileController")
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestPage = "/pages/user/current-user-profile.jsp";
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

    @PostMapping("/user/CurrentUserProfileController")
    public @ResponseBody
    ResponseMessage doPost(@SessionAttribute ResourceBundle labels,
            @SessionAttribute(Constants.LOG_IN_USER_NAME) User user,
            @RequestParam(required = false) MultipartFile profilePicture,
            User userToBeUpdated, String oldPassword,
            HttpSession session, ResponseMessage responseMessage) throws IOException, IllegalArgumentException {

        User dbUser = this.userService.readCompleteUserById(user);
        log.info("User to be Updated is [" + MvcHelper.deepToString(userToBeUpdated) + "]");

        // first check if existing db password equal provided old password:
        log.info("Old Password is [" + oldPassword + "]");
        if (dbUser.getPassword().equals(MD5Util.convertToMD5(oldPassword)) == false) {
            throw new IllegalArgumentException("Existing Password does not match provided old password");
        }

        userToBeUpdated.setPassword(MD5Util.convertToMD5(userToBeUpdated.getPassword()));
        Document fileUploading = Util.readDocumentFromRequestIfExist(profilePicture);
        if (fileUploading != null) {
            fileUploading.setDocumentType((short) 1);
            fileUploading.setStatus((short) 1);
            fileUploading.setDocumentId(dbUser.getProfilePicDocumentId());
            userToBeUpdated.setProfilePicDocument(fileUploading);
            userToBeUpdated.setProfilePicDocumentId(fileUploading.getDocumentId());

        }

        int updateStatus = this.userService.updateCompleteUser(userToBeUpdated);

        log.info("Updated User is [" + MvcHelper.toString(userToBeUpdated) + "]");

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
        session.setAttribute(Constants.LOG_IN_USER_NAME, userToBeUpdated);

        responseMessage.setOverAllStatus(Boolean.TRUE);
        responseMessage.setRedirect(Boolean.TRUE);
        responseMessage.setMessage(labels.getString("user.action.CurrentUser.successMsg"));
        responseMessage.setData(userToBeUpdated);

        return responseMessage;
    }

}
