package com.javatmp.module.user.service;

import com.javatmp.module.user.entity.Language;
import com.javatmp.module.user.entity.Languagetranslation;
import com.javatmp.module.user.entity.User;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import org.springframework.data.jpa.repository.support.JpaEntityInformation;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;
import org.springframework.stereotype.Service;

@Service
public class LanguageService extends SimpleExtendedJpaRepository<Language, String> {

    private Map<String, List<Languagetranslation>> languages;
    private final EntityManager em;

    public LanguageService(JpaEntityInformation<Language, String> entityInformation, EntityManager entityManager) {
        super(entityInformation, entityManager);
        this.em = entityManager;
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

        List<Languagetranslation> retList = null;
        TypedQuery<Languagetranslation> query = em.createQuery(
                "select new com.javatmp.module.user.entity.Languagetranslation("
                + "l.languageId, lt1.languagetranslationPK.langId, coalesce(lt1.languageName, lt2.languageName)"
                + ") from Language l "
                + "left outer join Languagetranslation lt1 on lt1.languagetranslationPK.languageId = l.languageId "
                + "left outer join Languagetranslation lt2 on (lt2.languagetranslationPK.languageId = l.languageId) "
                + "join Language deflan on deflan.languageId=lt2.languagetranslationPK.langId and deflan.isDefaultLang = 1 "
                + "", Languagetranslation.class
        );
        retList = query.getResultList();
        return retList;

    }

    public List<Languagetranslation> getLanguages_old(User localeUser) {

        List<Languagetranslation> retList = null;
        TypedQuery<Languagetranslation> query = em.createQuery(
                "select "
                + "new com.javatmp.module.user.entity.Languagetranslation("
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

    }

}
