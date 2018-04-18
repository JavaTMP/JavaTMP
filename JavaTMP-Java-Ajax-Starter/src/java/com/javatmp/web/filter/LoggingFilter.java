package com.javatmp.web.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoggingFilter implements Filter {

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
        System.out.println("URL [" + url + "] with path [" + path + "]");

        chain.doFilter(request, response);
        long endTime = System.currentTimeMillis();
        System.out.println("URI [" + httpRequest.getRequestURI() + "]=[" + (endTime - startTime) + "] milliseconds");
    }

    @Override
    public void destroy() {
    }
}
