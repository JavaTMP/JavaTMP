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

public class CacheControlHeadersFilter extends FilterWrapper {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        if (response instanceof HttpServletResponse && request instanceof HttpServletRequest) {
            HttpServletRequest httpRequest = (HttpServletRequest) request;
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            String path = this.getUrl(httpRequest);
            boolean isExcluded = this.isExcludedUrl(path);
            logger.info("Ignore ? path [" + path + "], ? > [" + isExcluded + "]");
            if ("GET".equals(httpRequest.getMethod()) && !isExcluded) {
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

}
