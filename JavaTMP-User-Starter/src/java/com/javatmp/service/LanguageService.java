package com.javatmp.service;

import com.javatmp.db.JpaDaoHelper;
import com.javatmp.domain.Language;
import java.util.List;

public class LanguageService {

    private final JpaDaoHelper jpaDaoHelper;
    private List<Language> languages;

    public LanguageService(JpaDaoHelper jpaDaoHelper) {
        this.jpaDaoHelper = jpaDaoHelper;
    }

    public List<Language> getLanguages() {
        if (this.languages == null || this.languages.isEmpty()) {
            synchronized (this) {
                // Check if still empty and not populated before:
                if (this.languages == null || this.languages.isEmpty()) {
                    this.languages = this.jpaDaoHelper.findAll(Language.class);
                }
            }
        }
        return languages;
    }

}
