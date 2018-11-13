package com.javatmp.web.filter;

import com.javatmp.module.activity.Activity;
import com.javatmp.module.user.User;
import com.javatmp.util.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.util.Collection;
import java.util.Date;
import java.util.logging.Logger;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoggingFilter implements Filter {

    private final Logger logger = Logger.getLogger(getClass().getName());
    private ServicesFactory sf = null;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        sf = (ServicesFactory) filterConfig.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {
        logger.info("request.getCharacterEncoding() [" + request.getCharacterEncoding() + "] request.getContentType() [" + request.getContentType() + "]");
        if (request.getCharacterEncoding() == null) {
//            String encoding = selectEncoding(request);
            request.setCharacterEncoding("UTF-8");
//            if (encoding != null) {
//                request.setCharacterEncoding("UTF-8");
//            }
        }

        Date creationDate = new Date();
        long startTime = creationDate.getTime();
        String ipAddress = request.getRemoteAddr();

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        String url;
        if (httpRequest.getQueryString() != null) {
            url = httpRequest.getRequestURI() + "?" + httpRequest.getQueryString();
        } else {
            url = httpRequest.getRequestURI();
        }
        String uri = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
        String path = url.substring(httpRequest.getContextPath().length());
        logger.info("URL [" + url + "] with path [" + path + "]");

        Activity activity = new Activity();
        activity.setCreationDate(creationDate);
        activity.setIPaddress(ipAddress);
        activity.setActionType("page_view");
        activity.setActionId(uri);
        sf.getActivityService().createActivity(activity);

        HttpSession session = httpRequest.getSession(false);
        if (session != null) {
            activity.setSessionId(session.getId());
            User user = (User) session.getAttribute("user");
            if (user != null) {
                activity.setUserId(user.getId());
            }
        }

        chain.doFilter(request, response);

        Collection<String> headers = httpResponse.getHeaderNames();
        logger.info("headers collection [" + headers + "]");

        // check if session exist:
        session = httpRequest.getSession(false);
        if (session != null) {
            activity.setSessionId(session.getId());
            User user = (User) session.getAttribute("user");
            if (user != null) {
                activity.setUserId(user.getId());
            }
        }

        long endTime = new Date().getTime();
        long lastTime = (endTime - startTime);
        logger.info("URI [" + httpRequest.getRequestURI() + "]=[" + (endTime - startTime) + "] milliseconds");

        activity.setTimeLast(lastTime);
        sf.getActivityService().updateActivity(activity);

    }

    @Override
    public void destroy() {
    }
}
