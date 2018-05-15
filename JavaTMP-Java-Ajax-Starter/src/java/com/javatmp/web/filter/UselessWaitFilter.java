package com.javatmp.web.filter;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.domain.User;
import com.javatmp.mvc.ClassTypeAdapter;
import com.javatmp.mvc.ResponseMessage;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UselessWaitFilter implements Filter {

    private FilterConfig filterConfig = null;

    private Set<String> excludeControllers = new HashSet<>();

    public UselessWaitFilter() {
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
        System.out.println("*** Start AuthenticatorFilter ****");

        // https://stackoverflow.com/questions/46592664/request-getservletpath-returned-null-from-spring-mvc
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String path = req.getRequestURI().substring(req.getContextPath().length());

        if (!isReqInWhiteList(path)) {
            try {
                System.out.println("Wait current request for 1 Second");
                Thread.sleep(1 * 1000);
            } catch (InterruptedException ex) {
                Logger.getLogger(UselessWaitFilter.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        chain.doFilter(request, response);

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
