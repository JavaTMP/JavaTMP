package com.javatmp.web.filter;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.module.user.entity.User;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.servlet.FilterChain;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AuthenticatorFilter extends FilterWrapper {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        log.info("*** Start AuthenticatorFilter ****");

        // https://stackoverflow.com/questions/46592664/request-getservletpath-returned-null-from-spring-mvc
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        ServletContext context = request.getServletContext();
        ServicesFactory sf = (ServicesFactory) context.getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
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
                log.info("Session User is [" + MvcHelper.deepToString(user) + "]");
                chain.doFilter(request, response);
            } else if (session.isNew()) {
                // for demo and for new time access we support user123 loggedin:
                User dbUser = new User();
                dbUser.setUserName("user123");
                dbUser = sf.getUserService().readUserByUsername(dbUser);
                Locale locale = Locale.forLanguageTag(dbUser.getLang());
                ResourceBundle bundle = ResourceBundle.getBundle(Constants.RESOURCE_BUNDLE_BASE_NAME, locale);
                session.setAttribute(Constants.LANGUAGE_ATTR_KEY, bundle);
                session.setAttribute("user", dbUser);
                sf.getUserService().updateLastUserAccess(dbUser);
                chain.doFilter(request, response);
            } else if ("ajax".equals(req.getParameter("_ajax")) || req.getMethod().equals("POST")) {
                // we send an error ajax message response consisting
                res.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                ResponseMessage responseMessage = new ResponseMessage();
                responseMessage.setOverAllStatus(false);
                responseMessage.setRedirect(true);
                responseMessage.setRedirectURL(req.getContextPath() + "/");
                responseMessage.setMessage(labels.getString("global.illegalAccessMsg"));
                MvcHelper.sendMessageAsJson(res, responseMessage);

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