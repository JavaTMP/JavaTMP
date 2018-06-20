package com.javatmp.service;

import com.javatmp.domain.Language;
import java.util.List;

public class LanguageService {

    private final DBFaker dBFaker;

    public LanguageService(DBFaker dBFaker) {
        this.dBFaker = dBFaker;
    }

    public Long getAllCount() {
        return Long.valueOf(this.dBFaker.getLanguages().size());
    }

    public List<Language> getLanguages() {
        return this.dBFaker.getLanguages();
    }

}
