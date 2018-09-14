/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.test;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

/**
 *
 * @author JavaTMP
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        System.out.println(Arrays.toString(TimeZone.getAvailableIDs()));
        TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
        Calendar d = Calendar.getInstance();
        System.out.println(d.getTime());

        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:sszzz");

        System.out.println(f.format(d.getTime()));
        TimeZone zone = TimeZone.getTimeZone("Asia/Dubai");
        System.out.println(zone);
        d = Calendar.getInstance(zone);
        d.setTimeZone(zone);
        f.setTimeZone(zone);
        System.out.println("timezone of calendar is [" + d.getTimeZone() + "]");
        System.out.println(d.getTime());
        System.out.println(f.format(d.getTime()));
    }

}
