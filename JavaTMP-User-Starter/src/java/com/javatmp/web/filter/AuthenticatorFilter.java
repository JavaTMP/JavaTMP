package com.javatmp.web.filter;

import com.javatmp.domain.User;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
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

public class AuthenticatorFilter implements Filter {

    private final Logger logger = Logger.getLogger(getClass().getName());

    private FilterConfig filterConfig = null;

    private Set<String> excludeControllers = new HashSet<>();

    public AuthenticatorFilter() {
        excludeControllers.add("/assets");
        excludeControllers.add("/login");
        excludeControllers.add("/logout");
    }

    @Override
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    private boolean isReqInWhiteList(String requestPath) {
        boolean isWhiteListed = false;
        for (String path : excludeControllers) {
            if (requestPath.startsWith(path)) {
                isWhiteListed = true;
                break;
            }
        }
        return isWhiteListed;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        logger.info("*** Start AuthenticatorFilter ****");

        // https://stackoverflow.com/questions/46592664/request-getservletpath-returned-null-from-spring-mvc
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String path = req.getRequestURI().substring(req.getContextPath().length());

        logger.info("path [" + path + "] is [" + isReqInWhiteList(path) + "]");
        if (isReqInWhiteList(path)) {
            chain.doFilter(request, response);
        } else {
            // check if requester is authenticated or not
            HttpSession session = req.getSession();
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
                responseMessage.setMessage("Un-Authorized Access or your session has been deactivated");
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

    public static String getBaseUrl(HttpServletRequest request) {
        String scheme = request.getScheme() + "://";
        String serverName = request.getServerName();
        String serverPort = (request.getServerPort() == 80) ? "" : ":" + request.getServerPort();
        String contextPath = request.getContextPath();
        return scheme + serverName + serverPort + contextPath;
    }

    /**
     * Return the filter configuration object for this filter.
     *
     * @return
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    public void destroy() {
    }
}
