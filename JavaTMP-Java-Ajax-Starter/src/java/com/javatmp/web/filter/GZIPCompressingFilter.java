package com.javatmp.web.filter;

import com.javatmp.util.GZIPResponseWrapper;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// http://www.onjava.com/pub/a/onjava/2003/11/19/filters.html

public class GZIPCompressingFilter implements Filter {

    public void doFilter(ServletRequest req, ServletResponse res,
            FilterChain chain) throws IOException, ServletException {
        if (req instanceof HttpServletRequest) {
            HttpServletRequest request = (HttpServletRequest) req;
            HttpServletResponse response = (HttpServletResponse) res;
            String ae = request.getHeader("accept-encoding");
            if (ae != null && ae.contains("gzip")) {
                System.out.println("GZIP supported, compressing [" + request.getRequestURI() + "]");
                GZIPResponseWrapper wrappedResponse = new GZIPResponseWrapper(response);
                chain.doFilter(req, wrappedResponse);
                System.out.println("Finished GZIP.doFilter now we will finish Response");
                wrappedResponse.finishResponse();
                return;
            }
            chain.doFilter(req, res);
        }
    }

    @Override
    public void init(FilterConfig filterConfig) {
        // noop
    }

    @Override
    public void destroy() {
        // noop
    }
}
