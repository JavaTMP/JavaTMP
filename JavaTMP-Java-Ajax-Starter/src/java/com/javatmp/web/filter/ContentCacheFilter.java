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

    @Override
    public void doFilter(ServletRequest req, ServletResponse res,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        String id = request.getRequestURI() + (request.getQueryString() != null ? "?" + request.getQueryString() : "");
        System.out.println("id[" + id + "] request.methd [" + request.getMethod() + "]");

        try {
            //set timestamp check
            if (!cache.containsKey(id) || cache.get(id).content == null || cache.get(id).content.length == 0) {
//                if (!cache.containsKey(id)) {
                System.out.println("Not cached yet id[" + id + "]");
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                CacheResponseWrapper wrappedResponse
                        = new CacheResponseWrapper(response, baos);
                chain.doFilter(req, wrappedResponse);
                System.out.println("getContentType [" + response.getContentType() + "]");
//                System.out.println("getCharacterEncoding [" + response.getCharacterEncoding() + "]");
                System.out.println("Content-Length [" + response.getHeader("Content-Length") + "]");
                System.out.println("Content-Encoding [" + response.getHeader("Content-Encoding") + "]");
                // print here all header of the response.
                Collection<String> headers = response.getHeaderNames();
                for (String header : headers) {
                    System.out.println("header[" + header + "][" + response.getHeader(header) + "]");
                }
                CacheEntry entry = new CacheEntry();
                entry.contentType = response.getContentType();
                entry.characterEncoding = response.getCharacterEncoding();
                entry.content = baos.toByteArray();
                entry.contentEncoding = response.getHeader("Content-Encoding");
                entry.contentDisposition = response.getHeader("Content-Disposition");
                cache.put(id, entry);
            } else {
                System.out.println("Fetch from cache [" + id + "]");
            }
            CacheEntry entry = cache.get(id);
            System.out.println("cache entry[size[" + entry.content.length
                    + "]contentType[" + entry.contentType
                    + "]contentEncoding[" + entry.contentEncoding + "]");
            response.setContentType(entry.contentType);
//            response.setCharacterEncoding(entry.characterEncoding);
            response.setContentLength(entry.content.length);
            response.setHeader("Content-Encoding", entry.contentEncoding);
            response.setHeader("Content-Disposition", entry.contentDisposition);
            ServletOutputStream sos = res.getOutputStream();
            sos.write(entry.content);
        } catch (ServletException e) {
            e.printStackTrace();
            throw new ServletException(e);
        } catch (IOException e) {
            e.printStackTrace();
            throw e;
        }

    }

    public void init(FilterConfig filterConfig) {
        this.fc = filterConfig;
    }

    public void destroy() {
    }
}
