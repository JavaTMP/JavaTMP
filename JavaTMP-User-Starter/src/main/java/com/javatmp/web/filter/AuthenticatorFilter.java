package com.javatmp.web.filter;

import com.javatmp.module.user.entity.User;
import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.util.ResourceBundle;
import java.util.logging.Logger;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthenticatorFilter extends FilterWrapper {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        logger.info("*** Start AuthenticatorFilter ****");

        // https://stackoverflow.com/questions/46592664/request-getservletpath-returned-null-from-spring-mvc
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String path = req.getRequestURI().substring(req.getContextPath().length());
        HttpSession session = req.getSession();
        ResourceBundle labels = (ResourceBundle) session.getAttribute(Constants.LANGUAGE_ATTR_KEY);

        boolean isExcludedUrl = isExcludedUrl(path);
        logger.info("path [" + path + "] isExcludedUrl [" + isExcludedUrl + "]");
        if (isExcludedUrl == true) {
            chain.doFilter(request, response);
        } else {
            // check if requester is authenticated or not
            logger.info("Session Attribute [" + session.getAttribute("user") + "]");
            User user = (User) session.getAttribute("user");
            if (user != null) {
                logger.info("Session User is [" + MvcHelper.deepToString(user) + "]");
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
                logger.info("redirect user to login page");
                res.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
//                res.setHeader("Location", res.encodeRedirectURL(redirectUrl));
//                res.sendRedirect(redirectUrl);
                request.getRequestDispatcher(redirectUrl).forward(request, response);
            }
        }
    }
}
