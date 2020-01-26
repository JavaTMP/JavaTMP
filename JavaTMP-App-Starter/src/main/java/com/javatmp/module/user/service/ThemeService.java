package com.javatmp.module.user.service;

import com.javatmp.module.user.entity.Themetranslation;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.repository.ThemeRepository;
import com.javatmp.module.user.repository.ThemetranslationRepository;
import java.util.List;
import javax.persistence.EntityManager;
import org.springframework.stereotype.Service;

@Service
public class ThemeService {

    private final EntityManager em;
    private ThemeRepository themeRepository;
    private ThemetranslationRepository themetranslationRepository;

    public ThemeService(EntityManager em, ThemeRepository themeRepository, ThemetranslationRepository themetranslationRepository) {
        this.em = em;
        this.themeRepository = themeRepository;
        this.themetranslationRepository = themetranslationRepository;
    }

    public List<Themetranslation> getThemes(User localeUser) {
        return this.themetranslationRepository.listThemeTransalatedBylanguage(localeUser.getLang());
    }

    public List<Themetranslation> getThemes() {
        return this.themetranslationRepository.findAll();

    }

}
