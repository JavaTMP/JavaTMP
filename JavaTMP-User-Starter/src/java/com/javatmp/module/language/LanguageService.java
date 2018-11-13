package com.javatmp.module.language;

import com.javatmp.db.JpaDaoHelper;
import com.javatmp.module.language.Language;
import com.javatmp.module.user.User;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

public class LanguageService {

    private final JpaDaoHelper jpaDaoHelper;
    private Map<String, List<Languagetranslation>> languages;

    public LanguageService(JpaDaoHelper jpaDaoHelper) {
        this.jpaDaoHelper = jpaDaoHelper;
    }

    public List<Languagetranslation> getLanguages(User localeUser) {
        if (this.languages == null || this.languages.isEmpty()) {
            synchronized (this) {
                // Check if still empty and not populated before:
                if (this.languages == null || this.languages.isEmpty()) {
                    this.languages = new HashMap<>();
                    List<Languagetranslation> all = this.getLanguages();
                    all.forEach((row) -> {
                        if (this.languages.containsKey(row.getLanguagetranslationPK().getLangId()) == false) {
                            this.languages.put(row.getLanguagetranslationPK().getLangId(), new LinkedList<>());
                        }
                        this.languages.get(row.getLanguagetranslationPK().getLangId()).add(row);
                    });
                }
            }
        }
        return this.languages.get(localeUser.getLang());
    }

    public List<Languagetranslation> getLanguages() {

        EntityManager em = null;
        List<Languagetranslation> retList = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            TypedQuery<Languagetranslation> query = em.createQuery(
                    "select "
                    + "new com.javatmp.module.language.Languagetranslation("
                    + "l.languageId, lt1.languagetranslationPK.langId, coalesce(lt1.languageName, lt2.languageName)"
                    + ") from Language l "
                    + "left outer join Languagetranslation lt1 on lt1.languagetranslationPK.languageId = l.languageId "
                    + "left outer join Languagetranslation lt2 on (lt2.languagetranslationPK.languageId = l.languageId) "
                    + "join Language deflan on deflan.languageId=lt2.languagetranslationPK.langId and deflan.isDefaultLang = 1 "
                    + "", Languagetranslation.class
            );
            retList = query.getResultList();
            return retList;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Languagetranslation> getLanguages_old(User localeUser) {

        EntityManager em = null;
        List<Languagetranslation> retList = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            TypedQuery<Languagetranslation> query = em.createQuery(
                    "select "
                    + "new com.javatmp.module.language.Languagetranslation("
                    + "l.languageId, lt1.languagetranslationPK.langId, coalesce(lt1.languageName, lt2.languageName)"
                    + ") from Language l "
                    + "left outer join Languagetranslation lt1 on "
                    + "(lt1.languagetranslationPK.languageId = l.languageId and lt1.languagetranslationPK.langId = :la) "
                    + "left outer join Languagetranslation lt2 "
                    + "on (lt2.languagetranslationPK.languageId = l.languageId) "
                    + "join Language deflan on deflan.languageId=lt2.languagetranslationPK.langId and deflan.isDefaultLang = 1 "
                    + "", Languagetranslation.class
            );
            query.setParameter("la", localeUser.getLang());
            retList = query.getResultList();
            return retList;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

}
