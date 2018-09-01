/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.timezones;

import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.TimeZone;

/**
 *
 * @author JavaTMP
 */
public class PrintDateInZones {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        TimeZone.setDefault(TimeZone.getTimeZone("GST"));
        Calendar epoch = Calendar.getInstance(TimeZone.getTimeZone("GST"));
        epoch.set(1970, 0, 1, 0, 0, 0);
        System.out.println(epoch.getTime());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
        System.out.println(sdf.format(epoch.getTime()));
        LocalTime time = LocalTime.now();
        System.out.println("Current time of the day: " + time);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssXX");
        formatter.setTimeZone(TimeZone.getTimeZone("GST"));

        Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("GST"));
        String timestamp = formatter.format(cal.getTime());
        System.out.println(timestamp);

        // Get TimeZone of user
        TimeZone currentTimeZone = TimeZone.getTimeZone("GST");
        Calendar currentDt = new GregorianCalendar(currentTimeZone, new Locale("EN"));
        System.out.println(formatter.format(currentDt.getTime()));

        ZoneId zoneId = ZoneId.of("Asia/Dubai");
        LocalDateTime today = LocalDateTime.now(zoneId);
        ZonedDateTime todayStart = today.atZone(zoneId);
        System.out.println("todayStart [" + todayStart + "]");
        Instant instant = Instant.now();
        System.out.println("instant [" + instant + "]");
        ZonedDateTime zdt = ZonedDateTime.ofInstant(instant, zoneId);
        System.out.println("zdt [" + zdt + "]");
    }

}
