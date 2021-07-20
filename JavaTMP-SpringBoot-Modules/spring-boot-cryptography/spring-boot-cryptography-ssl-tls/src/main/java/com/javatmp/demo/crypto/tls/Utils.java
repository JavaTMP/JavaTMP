package com.javatmp.demo.crypto.tls;

/**
 * Chapter 10 Utils
 */
public class Utils extends com.javatmp.demo.crypto.cms.Utils {
    /**
     * Names and passwords for the key store entries we need.
     */
    public static final String SERVER_NAME = "server";
    public static final char[] SERVER_PASSWORD = "serverPassword".toCharArray();
    public static final String CLIENT_NAME = "client";
    public static final char[] CLIENT_PASSWORD = "clientPassword".toCharArray();
    public static final String TRUST_STORE_NAME = "trustStore";
    public static final char[] TRUST_STORE_PASSWORD = "trustPassword".toCharArray();
    /**
     * Host name for our examples to use.
     */
    public static final String HOST = "localhost";
    /**
     * Port number for our examples to use.
     */
    public static final int PORT_NO = 9020;
}
