package com.javatmp.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Util {

    public static void main(String[] args) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        String password = "testing";
        System.out.println("pass string [" + convertToMD5(password) + "]");
    }

    public static String convertToMD5(String original) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] target = original.getBytes("UTF8");
        target = md.digest(target);
        return convertHexToString(target);
    }

    private static String convertHexToString(byte[] arrays) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < arrays.length; i++) {
            sb.append(Integer.toString((arrays[i] & 0xFF) + 0X100, 16).substring(1));
        }
        return sb.toString();
    }

}
