package com.javatmp.fw.web.filter;

import com.javatmp.fw.web.filter.util.GZIPResponseWrapper;
import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class GZIPCompressingFilter extends FilterWrapper {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res,
            FilterChain chain) throws IOException, ServletException {
        if (req instanceof HttpServletRequest) {
            HttpServletRequest request = (HttpServletRequest) req;
            HttpServletResponse response = (HttpServletResponse) res;
            String ae = request.getHeader("accept-encoding");
            String cancelGzip = request.getParameter("_cancelGzip");
            if (ae != null && ae.contains("gzip") && (cancelGzip == null) && (this.isExcludedRequest(request) == false)) {
                log.info("GZIP supported, compressing [" + request.getRequestURI() + "]");
                GZIPResponseWrapper wrappedResponse = new GZIPResponseWrapper(response);
                chain.doFilter(req, wrappedResponse);
                log.info("Finished GZIP.doFilter now we will finish Response");
                wrappedResponse.finishResponse();
                return;
            }
            chain.doFilter(req, res);
        }
    }
}
