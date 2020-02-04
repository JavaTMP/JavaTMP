/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.fw.web.handler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.util.Constants;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.SecurityService;
import com.javatmp.module.user.service.UserService;
import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class CustomAuthenticationEntryPoint implements AuthenticationEntryPoint {

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    UserService userService;

    @Autowired
    SecurityService securityService;

    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response,
            AuthenticationException authException) throws IOException, ServletException {
        // https://stackoverflow.com/questions/46592664/request-getservletpath-returned-null-from-spring-mvc
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String path = req.getRequestURI().substring(req.getContextPath().length());
        HttpSession session = req.getSession();
        ResourceBundle labels = (ResourceBundle) session.getAttribute(Constants.LANGUAGE_ATTR_KEY);
        log.debug("Session is new [" + session.isNew() + "] labels [" + labels + "]");
        if (session.isNew()) {
            // for demo and for new time access we support user123 loggedin:
            User dbUser = new User();
            dbUser.setUserName("user123");
            dbUser = userService.readUserByUsername(dbUser);
            Locale locale = Locale.forLanguageTag(dbUser.getLang());
            ResourceBundle bundle = ResourceBundle.getBundle(Constants.RESOURCE_BUNDLE_BASE_NAME, locale);
            session.setAttribute(Constants.LANGUAGE_ATTR_KEY, bundle);
            session.setAttribute("user", dbUser);
            userService.updateLastUserAccess(dbUser);

            securityService.autoLogin(dbUser.getUserName(), dbUser.getUserName());

            String redirectUrl = req.getContextPath() + "/";
            log.info("redirect user to {}", redirectUrl);
//            res.setStatus(HttpServletResponse.SC_OK);
//            res.setHeader("Location", res.encodeRedirectURL(redirectUrl));
//            res.sendRedirect(redirectUrl);
            // Getting request information without the hostname.
            String uri = request.getRequestURI();
            String url = request.getRequestURL().toString();
            log.debug("uri [" + uri + "], url [" + url + "]");
            request.getRequestDispatcher(uri).forward(request, response);
        } else if ("ajax".equals(req.getParameter("_ajax")) || req.getMethod().equals("POST")) {
            // we send an error ajax message response consisting
            res.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            ResponseMessage responseMessage = new ResponseMessage();
            responseMessage.setOverAllStatus(false);
            responseMessage.setRedirect(true);
            responseMessage.setRedirectURL(req.getContextPath() + "/");
            responseMessage.setMessage(labels.getString("global.illegalAccessMsg"));
            String responseStr = this.objectMapper.writeValueAsString(responseMessage);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(responseStr);

        } else {
//                String redirectUrl = req.getContextPath() + "/login";
            String redirectUrl = "/login";
            log.info("redirect user to login page");
            res.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            res.setHeader("Location", res.encodeRedirectURL(redirectUrl));
            res.sendRedirect(redirectUrl);
//            request.getRequestDispatcher(redirectUrl).forward(request, response);
        }
    }
}
