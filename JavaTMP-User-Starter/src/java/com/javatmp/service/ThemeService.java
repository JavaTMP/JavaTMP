package com.javatmp.service;

import com.javatmp.db.JpaDaoHelper;
import com.javatmp.domain.Languagetranslation;
import com.javatmp.domain.Theme;
import com.javatmp.domain.Themetranslation;
import com.javatmp.domain.User;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

public class ThemeService {

    private final JpaDaoHelper jpaDaoHelper;

    private Map<String, List<Themetranslation>> themes;

    public ThemeService(JpaDaoHelper jpaDaoHelper) {
        this.jpaDaoHelper = jpaDaoHelper;
    }

    public List<Themetranslation> getThemes(User localeUser) {
        List<Themetranslation> themes = new LinkedList<>();
        if (this.themes == null || this.themes.isEmpty()) {
            synchronized (this) {
                // Check if still empty and not populated before:
                if (this.themes == null || this.themes.isEmpty()) {
                    this.themes = new HashMap<>();
                    List<Themetranslation> all = this.getThemes();
                    all.forEach((row) -> {
                        if (this.themes.containsKey(row.getThemetranslationPK().getLangId()) == false) {
                            this.themes.put(row.getThemetranslationPK().getLangId(), new LinkedList<>());
                        }
                        this.themes.get(row.getThemetranslationPK().getLangId()).add(row);
                    });
                }
            }
        }
        return this.themes.get(localeUser.getLang());
    }

    public List<Themetranslation> getThemes() {

        EntityManager em = null;
        List<Themetranslation> retList = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            TypedQuery<Themetranslation> query = em.createQuery(
                    "select new com.javatmp.domain.Themetranslation(t.themeId, lan.languageId, coalesce(th1.themeName, th2.themeName)) "
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
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

}
