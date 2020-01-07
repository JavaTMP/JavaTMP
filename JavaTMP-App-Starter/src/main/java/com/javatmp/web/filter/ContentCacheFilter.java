package com.javatmp.web.filter;

import com.javatmp.web.filter.util.CacheEntry;
import com.javatmp.web.filter.util.CacheResponseWrapper;
import java.io.*;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import javax.servlet.*;
import javax.servlet.http.*;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ContentCacheFilter extends FilterWrapper {

    Map<String, CacheEntry> cache = new ConcurrentHashMap<>();

    @Override
    public void doFilter(ServletRequest req, ServletResponse res,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        String id = request.getRequestURI() + (request.getQueryString() != null ? "?" + request.getQueryString() : "");
        log.info("id[" + id + "] request.methd [" + request.getMethod() + "]");

        //set timestamp check
        boolean isExcludedUrl = isExcludedRequest(request);
        if (isExcludedUrl == true) {
            chain.doFilter(request, response);
        } else if (!cache.containsKey(id) || cache.get(id).content == null || cache.get(id).content.length == 0) {
//                if (!cache.containsKey(id)) {
            log.info("Not cached yet id[" + id + "]");
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            CacheResponseWrapper wrappedResponse
                    = new CacheResponseWrapper(response, baos);
            chain.doFilter(req, wrappedResponse);
            log.info("getContentType [" + response.getContentType() + "]");
//                logger.info("getCharacterEncoding [" + response.getCharacterEncoding() + "]");
            log.info("Content-Length [" + response.getHeader("Content-Length") + "]");
            log.info("Content-Encoding [" + response.getHeader("Content-Encoding") + "]");
            // print here all header of the response.

            CacheEntry entry = new CacheEntry();
            entry.contentType = response.getContentType();
            entry.characterEncoding = response.getCharacterEncoding();
            entry.content = baos.toByteArray();
            entry.contentEncoding = response.getHeader("Content-Encoding");
            entry.contentDisposition = response.getHeader("Content-Disposition");
            cache.put(id, entry);
        } else {
            log.info("Fetch from cache [" + id + "]");
        }
        CacheEntry entry = cache.get(id);
        log.info("cache entry[size[" + entry.content.length
                + "]contentType[" + entry.contentType
                + "]contentEncoding[" + entry.contentEncoding + "]");
        response.setContentType(entry.contentType);
        response.setContentLength(entry.content.length);
        response.setHeader("Content-Encoding", entry.contentEncoding);
        response.setHeader("Content-Disposition", entry.contentDisposition);
        ServletOutputStream sos = res.getOutputStream();
        sos.write(entry.content);

    }
}
