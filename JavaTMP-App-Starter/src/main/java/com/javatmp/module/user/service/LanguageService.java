package com.javatmp.module.user.service;

import com.javatmp.module.user.entity.Languagetranslation;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.repository.LanguageRepository;
import com.javatmp.module.user.repository.LanguagetranslationRepository;
import java.util.List;
import javax.persistence.EntityManager;
import org.springframework.stereotype.Service;

@Service
public class LanguageService {

    private final EntityManager em;
    private LanguageRepository languageRepository;
    private LanguagetranslationRepository languagetranslationRepository;

    public LanguageService(EntityManager entityManager, LanguageRepository languageRepository, LanguagetranslationRepository languagetranslationRepository) {
        this.em = entityManager;
        this.languageRepository = languageRepository;
        this.languagetranslationRepository = languagetranslationRepository;
    }

    public List<Languagetranslation> getLanguages(User localeUser) {
        return this.languagetranslationRepository.listLanguageTransalatedBylanguage(localeUser.getLang());
    }

}
