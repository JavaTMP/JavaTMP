package com.javatmp.service;

import com.javatmp.domain.Theme;
import java.util.List;

public class ThemeService {

    private final DBFaker dBFaker;

    public ThemeService(DBFaker dBFaker) {
        this.dBFaker = dBFaker;
    }

    public Long getAllCount() {
        return Long.valueOf(this.dBFaker.getThemes().size());
    }

    public List<Theme> getThemes() {
        return this.dBFaker.getThemes();
    }

}
