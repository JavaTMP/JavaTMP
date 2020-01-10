package com.javatmp.module.user.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.module.dms.service.DocumentService;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import java.text.MessageFormat;
import java.util.ResourceBundle;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import nl.captcha.Captcha;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

@Slf4j
@Controller
@RequestMapping("/user")
public class UserOperationController {

    @Autowired
    UserService userService;

    @Autowired
    DocumentService documentService;

    @PostMapping("/ActivateUserController")
    public @ResponseBody
    ResponseMessage ActivateUser(@RequestBody User userToBeUpdated, @SessionAttribute ResourceBundle labels,
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
    public @ResponseBody
    ResponseMessage DeactivateUser(@RequestBody User userToBeUpdated, @SessionAttribute ResourceBundle labels,
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
    public @ResponseBody
    ResponseMessage DeleteUser(@RequestBody User userToBeDeleted, @SessionAttribute ResourceBundle labels,
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
    public @ResponseBody
    ResponseMessage doPost(String captchaAnswer, User user, @SessionAttribute(Captcha.NAME) Captcha captcha,
            @SessionAttribute ResourceBundle labels, HttpSession session,
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

}
