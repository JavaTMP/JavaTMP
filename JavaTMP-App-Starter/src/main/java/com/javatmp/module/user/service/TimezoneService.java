package com.javatmp.module.user.service;

import com.javatmp.module.user.entity.Timezone;
import com.javatmp.module.user.entity.Timezonetranslation;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.repository.TimezoneRepository;
import java.util.List;
import java.util.TimeZone;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class TimezoneService {

    @Autowired
    TimezoneRepository timezoneRepository;

    private void generateAllTimezones() {
        // prepare a list of timezones - you should prepare them once instead of each request.
        String[] ids = TimeZone.getAvailableIDs();
        for (String id : ids) {
            this.generateTimezone(id);
        }
    }

    private Timezone generateTimezone(String id) {
        // prepare a list of timezones - you should prepare them once instead of each request.
        TimeZone zone = TimeZone.getTimeZone(id);
        int offset = zone.getRawOffset() / 1000;
        int hour = offset / 3600;
        int minutes = (offset % 3600) / 60;
        String displayName = zone.getDisplayName();
        String d = zone.getDisplayName(zone.useDaylightTime(), TimeZone.SHORT);
        String offsetDescription = String.format("GMT%+03d:%02d", hour, Math.abs(minutes));
        String displayTimezoneInfo = String.format("(%s) %s - %s (%s)", offsetDescription, id, displayName, d);
        return new Timezone(id, d, offsetDescription, displayName, displayTimezoneInfo);
    }

    public List<Timezonetranslation> getTimezones(User localeUser) {
        List<Timezonetranslation> timezonetranslations = this.timezoneRepository.getTimezones(localeUser.getLang());
        timezonetranslations.forEach((row) -> {
            Timezone current = generateTimezone(row.getTimezonetranslationPK().getTimezoneId());
            row.setTimezone(current);
        });
        return timezonetranslations;

    }

}
