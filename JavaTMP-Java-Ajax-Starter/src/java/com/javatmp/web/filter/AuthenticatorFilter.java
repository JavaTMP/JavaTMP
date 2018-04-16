package com.javatmp.web.filter;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.domain.User;
import com.javatmp.mvc.ClassTypeAdapter;
import com.javatmp.mvc.ResponseMessage;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
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

@WebFilter(filterName = "AuthenticatorFilter", urlPatterns = {"/*"}, dispatcherTypes = DispatcherType.REQUEST)
public class AuthenticatorFilter implements Filter {

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
        System.out.println("*** Start AuthenticatorFilter ****");
        try {
            // https://stackoverflow.com/questions/46592664/request-getservletpath-returned-null-from-spring-mvc
            HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse res = (HttpServletResponse) response;
            String path = req.getRequestURI().substring(req.getContextPath().length());

            this.filterConfig.getServletContext().log("path [" + path + "] is [" + isReqInWhiteList(path) + "]");
            if (isReqInWhiteList(path)) {
                chain.doFilter(request, response);
            } else {
                // check if requester is authenticated or not
                HttpSession session = req.getSession();
                System.out.println("Session Attribute [" + session.getAttribute("user") + "]");
                User user = (User) session.getAttribute("user");
                if (user != null) {
                    chain.doFilter(request, response);
                } else if ("ajax".equals(req.getParameter("_ajax"))) {
                    // we send an error ajax message response consisting
                    ResponseMessage responseMessage = new ResponseMessage();
                    responseMessage.setOverAllStatus(false);
                    responseMessage.setRedirect(true);
                    responseMessage.setRedirectURL(req.getContextPath());
                    responseMessage.setMessage("Un-Authorized Access or your session has been deactivated");
                    Gson gson = new GsonBuilder().serializeNulls()
                            .registerTypeAdapter(Class.class, new ClassTypeAdapter())
                            .create();
                    String json = gson.toJson(responseMessage);
                    System.out.println("response [" + json + "]");
                    res.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                    res.setContentType("application/json");
                    res.setCharacterEncoding("UTF-8");
                    res.getWriter().write(json);

                } else {
                    res.sendRedirect(req.getContextPath() + "/login");
                }
            }
        } catch (Throwable t) {
            t.printStackTrace();
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
