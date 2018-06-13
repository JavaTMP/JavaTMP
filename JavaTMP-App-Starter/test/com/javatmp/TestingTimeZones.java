/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp;

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
        for (String id : ids) {
            TimeZone zone = TimeZone.getTimeZone(id);
            int offset = zone.getRawOffset() / 1000;
            int hour = offset / 3600;
            int minutes = (offset % 3600) / 60;
            String displayName = zone.getDisplayName();
            String d = zone.getDisplayName(zone.useDaylightTime(), TimeZone.SHORT);
            System.out.println(String.format(new Locale("ar"), "(GMT%+03d:%02d) %s - %s (%s)", hour, Math.abs(minutes), id, displayName, d));
        }

    }

}
