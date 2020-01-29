/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.fw.web.handler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.util.Constants;
import com.javatmp.module.user.entity.LoggedInUser;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private UserService userService;

    @Autowired
    private ObjectMapper objectMapper;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        if (authentication != null) {
            Object principal = authentication.getPrincipal();
            if (principal instanceof LoggedInUser) {
                LoggedInUser localeProvider = (LoggedInUser) principal;
                User dbUser = localeProvider.getUser();
                Locale locale = Locale.forLanguageTag(dbUser.getLang());
                ResourceBundle bundle = ResourceBundle.getBundle(Constants.RESOURCE_BUNDLE_BASE_NAME, locale);
                request.getSession().setAttribute(Constants.LANGUAGE_ATTR_KEY, bundle);
                request.getSession().setAttribute(Constants.LOG_IN_USER_NAME, dbUser);

                userService.updateLastUserAccess(dbUser);
                ResponseMessage responseMessage = new ResponseMessage(true, request.getContextPath() + "/", 0);
                String responseStr = objectMapper.writeValueAsString(responseMessage);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(responseStr);
            }
        }
    }

}
