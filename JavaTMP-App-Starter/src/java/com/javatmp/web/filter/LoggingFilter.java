package com.javatmp.web.filter;

import java.io.IOException;
import java.util.Collection;
import java.util.logging.Logger;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoggingFilter implements Filter {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {
        long startTime = System.currentTimeMillis();

        String ipAddress = request.getRemoteAddr();

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        String url;
        if (httpRequest.getQueryString() != null) {
            url = httpRequest.getRequestURI() + "?" + httpRequest.getQueryString();
        } else {
            url = httpRequest.getRequestURI();
        }
        String path = url.substring(httpRequest.getContextPath().length());
        logger.info("URL [" + url + "] with path [" + path + "]");

        chain.doFilter(request, response);

        Collection<String> headers = httpResponse.getHeaderNames();
        for (String header : headers) {
            logger.info("Log-header[" + header + "][" + httpResponse.getHeader(header) + "]");
        }

        long endTime = System.currentTimeMillis();
        logger.info("URI [" + httpRequest.getRequestURI() + "]=[" + (endTime - startTime) + "] milliseconds");
    }

    @Override
    public void destroy() {
    }
}
