/*
 * Copyright 2003 Jayson Falkner (jayson@jspinsider.com)
 * This code is from "Servlets and JavaServer pages; the J2EE Web Tier",
 * http://www.jspbook.com. You may freely use the code both commercially
 * and non-commercially. If you like the code, please pick up a copy of
 * the book and help support the authors, development of more free code,
 * and the JSP/Servlet/J2EE community.
 */
package com.javatmp.util;

import java.io.Serializable;

public class CacheEntry implements Serializable {

    public String contentType;
    public String characterEncoding;
    public String contentEncoding;
    public String contentDisposition;
    public byte[] content;
}
