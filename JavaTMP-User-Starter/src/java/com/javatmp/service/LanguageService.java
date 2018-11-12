package com.javatmp.service;

import com.javatmp.db.JpaDaoHelper;
import com.javatmp.domain.Language;
import com.javatmp.domain.Languagetranslation;
import com.javatmp.domain.User;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

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
//
//    public List<Languagetranslation> getLanguages(User localeUser) {
//
//        EntityManager em = null;
//        List<> retList = null;
//        try {
//            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
//            CriteriaBuilder cb = em.getCriteriaBuilder();
//            CriteriaQuery<T> cq = cb.createQuery(classObject);
//            Root<T> root = cq.from(classObject);
//            cq.select(root);
//            TypedQuery<T> query = em.createQuery(cq);
//            retList = query.getResultList();
//            return retList;
//        } finally {
//            if (em != null) {
//                em.close();
//            }
//        }
//
//        return languages;
//    }

}
