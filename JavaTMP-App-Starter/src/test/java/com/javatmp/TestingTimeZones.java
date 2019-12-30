/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp;

import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

/**
 *
 * @author JavaTMP
 */
public class TestingTimeZones {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        for (String id : TimeZone.getAvailableIDs()) {
            System.out.println(id);
            System.out.println(TimeZone.getTimeZone(id).getDisplayName());
        }

        String[] ids = TimeZone.getAvailableIDs();
        List<String[]> timezones = new LinkedList<>();
        for (String id : ids) {
            TimeZone zone = TimeZone.getTimeZone(id);
            int offset = zone.getRawOffset() / 1000;
            int hour = offset / 3600;
            int minutes = (offset % 3600) / 60;
            String displayName = zone.getDisplayName();
            String d = zone.getDisplayName(zone.useDaylightTime(), TimeZone.SHORT);
            String displayTimezoneInfo = String.format(new Locale("ar"), "(GMT%+03d:%02d) %s - %s (%s)", hour, Math.abs(minutes), id, displayName, d);
            System.out.println(displayTimezoneInfo);

            String[] timezone = new String[2];
            timezone[0] = id;
            timezone[1] = displayTimezoneInfo;
            timezones.add(timezone);
        }

    }

}
