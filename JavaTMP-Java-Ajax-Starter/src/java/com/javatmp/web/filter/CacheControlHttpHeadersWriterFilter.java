package com.javatmp.web.filter;

import java.io.IOException;
import java.util.Date;
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

@WebFilter(filterName = "CacheControlHttpHeadersWriterFilter", urlPatterns = {"/*"}, dispatcherTypes = DispatcherType.REQUEST)
public class CacheControlHttpHeadersWriterFilter implements Filter {

    private FilterConfig filterConfig = null;

    public CacheControlHttpHeadersWriterFilter() {
    }

    private Set<String> excludeControllers = new HashSet<>();

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
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        excludeControllers.add("/assets");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        try {
            if (response instanceof HttpServletResponse && request instanceof HttpServletRequest) {
                HttpServletRequest httpRequest = (HttpServletRequest) request;
                HttpServletResponse httpResponse = (HttpServletResponse) response;

                String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());

                String finalUrl = null;
                if (httpRequest.getQueryString() != null) {
                    finalUrl = httpRequest.getRequestURL() + "?" + httpRequest.getQueryString();
                } else {
                    finalUrl = httpRequest.getRequestURL().toString();
                }

                this.filterConfig.getServletContext().log("path [" + finalUrl + "] is [" + isReqInWhiteList(path) + "]");
                if (isReqInWhiteList(path)) {

                    int cacheAge = 60 * 60; // in seconds
                    Date currentDate = new Date();
                    long expiry = currentDate.getTime() + (cacheAge * 1000);

                    httpResponse.setDateHeader("Date", currentDate.getTime());
                    httpResponse.setDateHeader("Expires", expiry);
                    httpResponse.addHeader("Cache-Control", "max-age=" + cacheAge);
                    System.out.println("Added Cache header to url [" + finalUrl + "]");
                } else {
                    System.out.println("NOT Added Cache header to url [" + path + "]");
                }
            }
            chain.doFilter(request, response);
        } catch (Throwable t) {
            t.printStackTrace();
            throw t;
        }
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
