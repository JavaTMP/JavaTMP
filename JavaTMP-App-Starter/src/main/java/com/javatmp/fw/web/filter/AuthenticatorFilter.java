package com.javatmp.fw.web.filter;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.util.Constants;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class AuthenticatorFilter extends FilterWrapper {

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    UserService userService;

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        log.info("*** Start AuthenticatorFilter ****");

        // https://stackoverflow.com/questions/46592664/request-getservletpath-returned-null-from-spring-mvc
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String path = req.getRequestURI().substring(req.getContextPath().length());
        HttpSession session = req.getSession();
        ResourceBundle labels = (ResourceBundle) session.getAttribute(Constants.LANGUAGE_ATTR_KEY);

        boolean isExcludedUrl = isExcludedUrl(path);
        log.info("path [" + path + "] isExcludedUrl [" + isExcludedUrl + "]");
        if (isExcludedUrl == true) {
            chain.doFilter(request, response);
        } else {
            // check if requester is authenticated or not
            log.info("Session is New [" + session.isNew() + "], Session Attribute [" + session.getAttribute("user") + "]");
            User user = (User) session.getAttribute("user");
            if (user != null) {
                log.info("Session User is [" + (user) + "]");
                chain.doFilter(request, response);
            } else if (session.isNew()) {
                // for demo and for new time access we support user123 loggedin:
                User dbUser = new User();
                dbUser.setUserName("user123");
                dbUser = this.userService.readUserByUsername(dbUser);
                Locale locale = Locale.forLanguageTag(dbUser.getLang());
                ResourceBundle bundle = ResourceBundle.getBundle(Constants.RESOURCE_BUNDLE_BASE_NAME, locale);
                session.setAttribute(Constants.LANGUAGE_ATTR_KEY, bundle);
                session.setAttribute("user", dbUser);
                this.userService.updateLastUserAccess(dbUser);
                chain.doFilter(request, response);
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
//                res.setHeader("Location", res.encodeRedirectURL(redirectUrl));
//                res.sendRedirect(redirectUrl);
                request.getRequestDispatcher(redirectUrl).forward(request, response);
            }
        }
    }
}
