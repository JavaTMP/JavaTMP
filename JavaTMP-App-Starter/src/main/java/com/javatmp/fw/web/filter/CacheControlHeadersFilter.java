package com.javatmp.fw.web.filter;

import java.io.IOException;
import java.util.Date;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CacheControlHeadersFilter extends FilterWrapper {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        if (response instanceof HttpServletResponse && request instanceof HttpServletRequest) {
            HttpServletRequest httpRequest = (HttpServletRequest) request;
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            String path = this.getUrl(httpRequest);
            boolean isExcluded = this.isExcludedUrl(path);
            log.info("Ignore ? path [" + path + "], ? > [" + isExcluded + "]");
            if ("GET".equals(httpRequest.getMethod()) && !isExcluded) {
                int cacheAge = 60 * 60; // in seconds
                Date currentDate = new Date();
                long expiry = currentDate.getTime() + (cacheAge * 1000);
                httpResponse.setDateHeader("Date", currentDate.getTime());
                httpResponse.setDateHeader("Expires", expiry);
                httpResponse.addHeader("Cache-Control", "max-age=" + cacheAge);
                log.info("Added Cache header to url [" + path + "]");
            } else {
                log.info("Not Add Cache-Controler to path [" + path + "]");
            }
        }
        chain.doFilter(request, response);
    }

}
