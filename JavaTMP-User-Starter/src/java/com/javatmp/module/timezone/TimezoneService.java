package com.javatmp.module.timezone;

import com.javatmp.util.JpaDaoHelper;
import com.javatmp.module.timezone.Timezone;
import java.util.LinkedList;
import java.util.List;
import java.util.TimeZone;

public class TimezoneService {

    private final JpaDaoHelper jpaDaoHelper;
    private List<Timezone> timezones = new LinkedList<>();

    public TimezoneService(JpaDaoHelper jpaDaoHelper) {
        this.jpaDaoHelper = jpaDaoHelper;
        generateTimezones();
    }

    private void generateTimezones() {
        // prepare a list of timezones - you should prepare them once instead of each request.
        String[] ids = TimeZone.getAvailableIDs();
        for (String id : ids) {
            TimeZone zone = TimeZone.getTimeZone(id);
            int offset = zone.getRawOffset() / 1000;
            int hour = offset / 3600;
            int minutes = (offset % 3600) / 60;
            String displayName = zone.getDisplayName();
            String d = zone.getDisplayName(zone.useDaylightTime(), TimeZone.SHORT);
            String displayTimezoneInfo = String.format("(GMT%+03d:%02d) %s - %s (%s)", hour, Math.abs(minutes), id, displayName, d);
            timezones.add(new Timezone(id, displayTimezoneInfo));
        }
    }

    public Long getAllCount() {
        return Long.valueOf(this.timezones.size());
    }

    public List<Timezone> getTimezones() {
        return this.timezones;
    }

}
