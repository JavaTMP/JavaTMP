package com.javatmp.web.filter;

import java.io.IOException;
import java.util.Date;
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

@WebFilter(filterName = "CacheFilter", urlPatterns = {"/*"}, dispatcherTypes = DispatcherType.REQUEST)
public class CacheFilter implements Filter {

    private FilterConfig filterConfig = null;

    public CacheFilter() {
    }

    @Override
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        try {
            int cacheAge = 60 * 60; // in seconds
            Date currentDate = new Date();
            long expiry = currentDate.getTime() + (cacheAge * 1000);
            if (response instanceof HttpServletResponse && request instanceof HttpServletRequest) {
                HttpServletRequest httpRequest = (HttpServletRequest) request;
                HttpServletResponse httpResponse = (HttpServletResponse) response;
                httpResponse.setDateHeader("Date", currentDate.getTime());
                httpResponse.setDateHeader("Expires", expiry);
                httpResponse.addHeader("Cache-Control", "max-age=" + cacheAge);

                String finalUrl = null;
                if (httpRequest.getQueryString() != null) {
                    finalUrl = httpRequest.getRequestURL() + "?" + httpRequest.getQueryString();
                } else {
                    finalUrl = httpRequest.getRequestURL().toString();
                }
                System.out.println("Added Cache header to url [" + finalUrl + "]");
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
