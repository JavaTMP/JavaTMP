package com.javatmp.module.user.service;

import com.javatmp.module.user.entity.Themetranslation;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.repository.ThemeRepository;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Service;

@Service
public class ThemeService {

    private final EntityManager em;
    private ThemeRepository themeRepository;

    public ThemeService(EntityManager em, ThemeRepository themeRepository) {
        this.em = em;
        this.themeRepository = themeRepository;
    }

    public List<Themetranslation> getThemes(User localeUser) {
        return this.themeRepository.getThemes(localeUser.getLang());
    }

    public List<Themetranslation> getThemes() {

        List<Themetranslation> retList = null;
        TypedQuery<Themetranslation> query = em.createQuery(
                "select new com.javatmp.module.user.entity.Themetranslation(t.themeId, lan.languageId, coalesce(th1.themeName, th2.themeName)) "
                + "from Language lan "
                + "join lan.languagetranslationList lanTr "
                + "on lanTr.languagetranslationPK.languageId = lan.languageId "
                + "and lanTr.languagetranslationPK.langId = lan.languageId "
                + "left outer join Theme t on (1=1) "
                + "left outer join Themetranslation th1 "
                + "on (t.themeId = th1.themetranslationPK.themeId and th1.themetranslationPK.langId = lan.languageId)"
                + "left outer join Themetranslation th2 "
                + "on (t.themeId = th2.themetranslationPK.themeId)"
                + "join Language reflan "
                + "on reflan.languageId = th2.themetranslationPK.langId and reflan.isDefaultLang = 1 "
                + "where th1.themetranslationPK.langId = lan.languageId", Themetranslation.class
        );
        retList = query.getResultList();
        return retList;

    }

}
