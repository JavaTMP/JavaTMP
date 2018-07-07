package com.javatmp.service;

import com.javatmp.db.JpaDaoHelper;
import com.javatmp.domain.Language;
import java.util.LinkedList;
import java.util.List;

public class LanguageService {

    private final JpaDaoHelper jpaDaoHelper;

    public LanguageService(JpaDaoHelper jpaDaoHelper) {
        this.jpaDaoHelper = jpaDaoHelper;
    }

    public List<Language> getLanguages() {
        List<Language> languages = new LinkedList<>();
        languages.add(new Language("ar", "Arabic (AR)"));
        languages.add(new Language("en", "English (EN)"));
        return languages;
    }

}
