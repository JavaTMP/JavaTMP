package com.javatmp.module.user.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.fw.util.Util;
import com.javatmp.module.dms.entity.Document;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import com.javatmp.util.Constants;
import com.javatmp.util.MD5Util;
import java.io.IOException;
import java.text.MessageFormat;
import java.util.Date;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import nl.captcha.Captcha;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

@Slf4j
@RestController
@RequestMapping("/user")
public class UserOperationController {

    @Autowired
    UserService userService;

    @PostMapping("/ActivateUserController")
    public ResponseMessage ActivateUser(@RequestBody User userToBeUpdated, @SessionAttribute ResourceBundle labels,
            ResponseMessage responseMessage, HttpServletRequest request, HttpServletResponse response) {

        log.info("User to be Activated is {}", userToBeUpdated);

        int updateStatus = userService.activateUser(userToBeUpdated);

        responseMessage.setOverAllStatus(true);
        responseMessage.setTitle(labels.getString("action.successTitle"));
        responseMessage.setMessage(MessageFormat.format(labels.getString("action.ActivateUser.successMsg"), updateStatus));
        responseMessage.setData(userToBeUpdated);

        return responseMessage;
    }

    @PostMapping("/DeactivateUserController")
    public ResponseMessage DeactivateUser(@RequestBody User userToBeUpdated, @SessionAttribute ResourceBundle labels,
            ResponseMessage responseMessage, HttpServletRequest request, HttpServletResponse response) {

        log.info("User to be Deactivated is {}", userToBeUpdated);

        int updateStatus = this.userService.deActivateUser(userToBeUpdated);

        responseMessage.setOverAllStatus(true);
        responseMessage.setTitle(labels.getString("action.successTitle"));
        responseMessage.setMessage(MessageFormat.format(labels.getString("action.DeactivateUser.successMsg"), updateStatus));
        responseMessage.setData(userToBeUpdated);

        return responseMessage;
    }

    @PostMapping("/DeleteUserController")
    public ResponseMessage DeleteUser(@RequestBody User userToBeDeleted, @SessionAttribute ResourceBundle labels,
            ResponseMessage responseMessage, HttpServletRequest request, HttpServletResponse response) {

        log.info("User to be Deactivated is {}", userToBeDeleted);

        int updateStatus = this.userService.deleteUser(userToBeDeleted);

        responseMessage.setOverAllStatus(true);
        responseMessage.setTitle(labels.getString("action.successTitle"));
        responseMessage.setMessage(MessageFormat.format(labels.getString("action.deleteUser.successMsg"), updateStatus));
        responseMessage.setData(userToBeDeleted);

        return responseMessage;
    }

    @PostMapping("/register")
    public ResponseMessage register(String captchaAnswer, User user, @SessionAttribute(Captcha.NAME) Captcha captcha,
            @SessionAttribute ResourceBundle labels,
            ResponseMessage responseMessage, HttpServletRequest request) {

        log.info("User to be Registerd {}", user);

        if (captcha != null && captcha.isCorrect(captchaAnswer)) {
            userService.createNewBasicUser(user);
            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage(labels.getString("action.register.success"));
            responseMessage.setRedirectURL(request.getContextPath() + "/");
        } else {
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(labels.getString("action.register.wrongCaptcha"));
        }
        return responseMessage;
    }

    @PostMapping(value = "/ListUsersController", produces = MediaType.APPLICATION_JSON_VALUE)
    public DataTableResults<User> listUsersController(@RequestBody DataTableRequest tableRequest) {
        log.debug("datatableRequest [{}]", tableRequest);
        DataTableResults<User> dataTableResult = this.userService.listAllUsers(tableRequest);
        return dataTableResult;
    }

    @PostMapping("/CreateUserController")
    public ResponseMessage createUserController(@SessionAttribute ResourceBundle labels,
            @RequestParam("profilePicture") MultipartFile profilePicture, User userToBeCreated,
            HttpServletRequest request, HttpServletResponse response) throws IOException {

        ResponseMessage responseMessage = new ResponseMessage();

        log.info("User to be created is {}", userToBeCreated);
        Document fileUploading = Util.readDocumentFromRequestIfExist(profilePicture);
        log.info("original size [" + fileUploading.getDocumentSize()
                + "] stream size [" + fileUploading.getDocumentContent().length + "]");
        String t = "FileName 'requested' \"to\" Upload [" + fileUploading.getDocumentName()
                + "] type[" + fileUploading.getContentType() + "]size[" + fileUploading.getDocumentSize() + "]<br/>";
        log.info(t);

        userToBeCreated.setProfilePicDocument(fileUploading);
        log.info("UserToBeCreated is {}", userToBeCreated);
        userToBeCreated.setPassword(MD5Util.convertToMD5(userToBeCreated.getPassword()));
        userToBeCreated.setCreationDate(new Date());
        userToBeCreated.setStatus((short) 1);

        this.userService.createNewUser(userToBeCreated);

        responseMessage.setOverAllStatus(true);
        responseMessage.setMessage(labels.getString("action.createUser.successMsg"));
        responseMessage.setData(userToBeCreated);

        return responseMessage;
    }

    @PostMapping("/CurrentUserProfileController")
    public ResponseMessage currentUserProfileController(@SessionAttribute ResourceBundle labels,
            @SessionAttribute(Constants.LOG_IN_USER_NAME) User user,
            @RequestParam("profilePicture") MultipartFile profilePicture,
            User userToBeUpdated, String oldPassword,
            HttpSession session, ResponseMessage responseMessage) throws IOException, IllegalArgumentException {

        User dbUser = this.userService.readCompleteUserById(user);
        log.info("User to be Updated is [" + (userToBeUpdated) + "]");

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

        log.info("Updated User is [" + (userToBeUpdated) + "]");

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

    @PostMapping("/UpdateCompleteUserController")
    public ResponseMessage updateCompleteUserController(User userToBeUpdated, String oldPassword, @RequestParam MultipartFile profilePicture,
            HttpServletRequest request, HttpServletResponse response) throws IOException {

        ResponseMessage responseMessage = new ResponseMessage();

        log.info("User to be Updated is [" + (userToBeUpdated) + "]");

        User dbUser = this.userService.readCompleteUserById(userToBeUpdated);
        log.info("Existing DB User to be Updated is [" + (dbUser) + "]");

        // first check if existing db password equal provided old password:
        if (dbUser.getPassword().equals(MD5Util.convertToMD5(oldPassword)) == false) {
            throw new IllegalArgumentException("Existing Password does not match provided old password");
        }

        log.info("UserToBeCreated is [" + (userToBeUpdated) + "]");
        userToBeUpdated.setPassword(MD5Util.convertToMD5(userToBeUpdated.getPassword()));

        Document fileUploading = Util.readDocumentFromRequestIfExist(profilePicture);
        if (fileUploading != null) {
            fileUploading.setDocumentId(dbUser.getProfilePicDocumentId());
            userToBeUpdated.setProfilePicDocument(fileUploading);
            userToBeUpdated.setProfilePicDocumentId(fileUploading.getDocumentId());
        }

        int updateStatus = this.userService.updateCompleteUser(userToBeUpdated);

        responseMessage.setOverAllStatus(Boolean.TRUE);
        responseMessage.setMessage("User Updated successfully");
        responseMessage.setData(userToBeUpdated);

        return responseMessage;
    }

}
