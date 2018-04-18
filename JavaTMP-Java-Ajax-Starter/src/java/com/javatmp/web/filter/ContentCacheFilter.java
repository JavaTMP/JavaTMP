package com.javatmp.web.filter;

/*
 * Copyright 2003 Jayson Falkner (jayson@jspinsider.com)
 * This code is from "Servlets and JavaServer pages; the J2EE Web Tier",
 * http://www.jspbook.com. You may freely use the code both commercially
 * and non-commercially. If you like the code, please pick up a copy of
 * the book and help support the authors, development of more free code,
 * and the JSP/Servlet/J2EE community.
 */
import com.javatmp.util.CacheEntry;
import com.javatmp.util.CacheResponseWrapper;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

public class ContentCacheFilter implements Filter {

    ServletContext sc;
    FilterConfig fc;
    Map<String, CacheEntry> cache = new ConcurrentHashMap<>();

    public void doFilter(ServletRequest req, ServletResponse res,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        String id = request.getRequestURI() + (request.getQueryString() != null ? "?" + request.getQueryString() : "");
        System.out.println("id[" + id + "] request.methd [" + request.getMethod() + "]");

        try {
            //set timestamp check
            if (!cache.containsKey(id)) {
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                CacheResponseWrapper wrappedResponse
                        = new CacheResponseWrapper(response, baos);
                chain.doFilter(req, wrappedResponse);
                System.out.println("getContentType [" + response.getContentType() + "]");
                System.out.println("getCharacterEncoding [" + response.getCharacterEncoding() + "]");
                System.out.println("Content-Length [" + response.getHeader("Content-Length") + "]");
                System.out.println("Content-Encoding [" + response.getHeader("Content-Encoding") + "]");
                // print here all header of the response.

                CacheEntry entry = new CacheEntry();
                entry.contentType = response.getContentType();
                entry.characterEncoding = response.getCharacterEncoding();
                entry.content = baos.toByteArray();
                entry.contentEncoding = response.getHeader("Content-Encoding");
                cache.put(id, entry);
            }
            CacheEntry entry = cache.get(id);
            response.setContentType(entry.contentType);
            response.setCharacterEncoding(entry.characterEncoding);
            response.setContentLength(entry.content.length);
            response.setHeader("Content-Encoding", entry.contentEncoding);
            ServletOutputStream sos = res.getOutputStream();
            sos.write(entry.content);
        } catch (ServletException e) {
            throw new ServletException(e);
        } catch (IOException e) {
            throw e;
        }

    }

    public void init(FilterConfig filterConfig) {
        this.fc = filterConfig;
    }

    public void destroy() {
    }
}
