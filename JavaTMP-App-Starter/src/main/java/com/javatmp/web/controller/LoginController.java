package com.javatmp.web.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.util.Constants;
import com.javatmp.fw.util.MD5Util;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
public class LoginController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/pages/system/default-login-page.jsp";
    }

    @PostMapping(value = "/login", produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    ResponseMessage doPost(User user, ResponseMessage responseMessage, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {

        ResourceBundle labels = (ResourceBundle) session.getAttribute(Constants.LANGUAGE_ATTR_KEY);

        try {
            log.info("Check User [" + (user) + "]");
            User dbUser = this.userService.readUserByUsername(user);

            if (dbUser.getPassword().equals(MD5Util.convertToMD5(user.getPassword()))) {
                // Authenticated user
                log.info("User found [" + (dbUser) + "]");

                Locale locale = Locale.forLanguageTag(dbUser.getLang());
                ResourceBundle bundle = ResourceBundle.getBundle(Constants.RESOURCE_BUNDLE_BASE_NAME, locale);
                session.setAttribute(Constants.LANGUAGE_ATTR_KEY, bundle);
                session.setAttribute("user", dbUser);

                this.userService.updateLastUserAccess(dbUser);

                responseMessage.setOverAllStatus(true);
                responseMessage.setMessage(request.getContextPath() + "/");
            } else {
                // un authenticated user
                responseMessage.setOverAllStatus(false);
                responseMessage.setMessage(labels.getString("action.login.wrongUserOrPassword"));
            }
        } catch (NoResultException ex) {
            // un authenticated user
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(labels.getString("action.login.wrongUserOrPassword"));
        } catch (Exception ex) {
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(labels.getString("action.login.exception"));
            throw ex;
        }
        return responseMessage;
    }
}
