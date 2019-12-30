package com.javatmp.web.filter;

import java.io.IOException;
import java.util.logging.Logger;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UTF8InforcerFilter extends FilterWrapper {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        logger.info("getCharacterEncoding() [" + request.getCharacterEncoding() + "] request.getContentType() [" + request.getContentType() + "]");
        boolean isExcludedUrl = isExcludedRequest(httpRequest);
        if (isExcludedUrl == false) {
            if (request.getCharacterEncoding() == null) {
                request.setCharacterEncoding("UTF-8");
            }
        }
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }
}
