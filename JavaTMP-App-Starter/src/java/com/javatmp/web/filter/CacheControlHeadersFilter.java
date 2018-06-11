package com.javatmp.web.filter;

import java.io.IOException;
import java.util.Date;
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

public class CacheControlHeadersFilter implements Filter {

    private final Logger logger = Logger.getLogger(getClass().getName());
    private FilterConfig filterConfig = null;
    private Set<String> excludes = new HashSet<>();

    public CacheControlHeadersFilter() {
        excludes.add("/");
    }

    private boolean ignoreURL(String requestPath) {
        boolean ignore = false;
        for (String path : excludes) {
            if (path.equals(requestPath)) {
                ignore = true;
                break;
            }
        }
        return ignore;
    }

    @Override
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        if (response instanceof HttpServletResponse && request instanceof HttpServletRequest) {
            HttpServletRequest httpRequest = (HttpServletRequest) request;
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
            logger.info("Ignore ? path [" + path + "], ? > [" + ignoreURL(path) + "]");
            if ("GET".equals(httpRequest.getMethod()) && !ignoreURL(path)) {
//                String url;
//                if (httpRequest.getQueryString() != null) {
//                    url = httpRequest.getRequestURI() + "?" + httpRequest.getQueryString();
//                } else {
//                    url = httpRequest.getRequestURI();
//                }
//                String path = url.substring(httpRequest.getContextPath().length());

//                int cacheAge = 60 * 60; // in seconds
                int cacheAge = 60 * 60; // in seconds
                Date currentDate = new Date();
                long expiry = currentDate.getTime() + (cacheAge * 1000);
                httpResponse.setDateHeader("Date", currentDate.getTime());
                httpResponse.setDateHeader("Expires", expiry);
                httpResponse.addHeader("Cache-Control", "max-age=" + cacheAge);
                logger.info("Added Cache header to url [" + path + "]");
            } else {
                logger.info("Not Add Cache-Controler to path [" + path + "]");
            }
        }
        chain.doFilter(request, response);

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

    @Override
    public void destroy() {
    }
}
