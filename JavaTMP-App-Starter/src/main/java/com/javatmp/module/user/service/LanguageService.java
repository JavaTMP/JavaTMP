package com.javatmp.module.user.service;

import com.javatmp.module.user.entity.Languagetranslation;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.repository.LanguageRepository;
import java.util.List;
import javax.persistence.EntityManager;
import org.springframework.stereotype.Service;

@Service
public class LanguageService {

    private final EntityManager em;
    private LanguageRepository languageRepository;

    public LanguageService(EntityManager entityManager, LanguageRepository languageRepository) {
        this.em = entityManager;
        this.languageRepository = languageRepository;
    }

    public List<Languagetranslation> getLanguages(User localeUser) {
        return this.languageRepository.getLanguages(localeUser.getLang());
    }

}
