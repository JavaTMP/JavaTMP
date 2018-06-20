package com.javatmp.service;

import com.javatmp.domain.Theme;
import com.javatmp.domain.Timezone;
import java.util.List;

public class TimezoneService {

    private final DBFaker dBFaker;

    public TimezoneService(DBFaker dBFaker) {
        this.dBFaker = dBFaker;
    }

    public Long getAllCount() {
        return Long.valueOf(this.dBFaker.getTimezones().size());
    }

    public List<Timezone> getTimezones() {
        return this.dBFaker.getTimezones();
    }

}
