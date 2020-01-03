package com.javatmp.web.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import com.javatmp.util.Constants;
import com.javatmp.util.MD5Util;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Slf4j
@Controller
public class LoginController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/WEB-INF/pages/system/default-login-page.jsp";
    }

    @PostMapping(value = "/login")
    public void doPost(User user, ResponseMessage responseMessage, HttpServletRequest request, HttpServletResponse response) throws Exception {

        HttpSession session = request.getSession();
        ResourceBundle labels = (ResourceBundle) session.getAttribute(Constants.LANGUAGE_ATTR_KEY);

        try {
//            MvcHelper.populateBeanByRequestParameters(request, user);
            log.info("Check User [" + MvcHelper.deepToString(user) + "]");
            User dbUser = this.userService.readUserByUsername(user);

            if (dbUser.getPassword().equals(MD5Util.convertToMD5(user.getPassword()))) {
                // Authenticated user
                log.info("User found [" + MvcHelper.deepToString(dbUser) + "]");

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

        MvcHelper.sendMessageAsJson(response, responseMessage);
    }

}
