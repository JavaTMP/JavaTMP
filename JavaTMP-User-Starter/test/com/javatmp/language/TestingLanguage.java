/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.language;

import com.javatmp.theme.*;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.db.JpaDaoHelper;
import com.javatmp.domain.Language;
import com.javatmp.domain.Languagetranslation;
import com.javatmp.domain.Theme;
import com.javatmp.domain.Themetranslation;
import com.javatmp.service.ThemeService;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import java.util.Random;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

/**
 *
 * @author JavaTMP
 */
public class TestingLanguage {

    public static void main(String[] args) throws SQLException, ParseException {
        JpaDaoHelper jpaDaoHelper;
        ThemeService themeService;
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        themeService = new ThemeService(jpaDaoHelper);

        List<Object[]> results;
        EntityManager em = jpaDaoHelper.getEntityManagerFactory().createEntityManager();

//        TypedQuery<Themetranslation> query = em.createQuery(
//                "SELECT t FROM Themetranslation t "
//                + "left outer join Themetranslation tra on t.themeId = tra.themeId "
//                + "left outer join Language l on tra.langId = l.languageId", Themetranslation.class);
//        TypedQuery<Themetranslation> query = em.createQuery(
//                "SELECT new com.javatmp.domain.Themetranslation(l.languageId ,t.themeId, coalesce(tra.themeName, t.themeName)) FROM Theme t "
//                + "left outer join Themetranslation tra on t.themeId = tra.themeId "
//                + "left outer join Language l on tra.langId = l.languageId", Themetranslation.class);
//        TypedQuery<Object[]> query = em.createQuery(
//                "SELECT l.languageId, th.themeId, coalesce(t.themeName, th.themeName) "
//                + "FROM Language l "
//                + "left outer join Theme th on (1=1) "
//                + "left outer join Themetranslation t on t.langId = l.languageId and th.themeId = t.themeId "
//                //                + "left outer join Theme th on th.themeId = t.themeId "
//                //                + "where l.languageId = :la", Object[].class);
//                + "where l.languageId = :la", Object[].class);
//        query.setParameter("la", "ar");
/*
select l.languageId, coalesce(lt1.languageName, lt2.languageName)  from language l
left outer join languagetranslation lt1 on lt1.languageId = l.languageId and lt1.langId = 'en'
left outer join languagetranslation lt2 on lt2.languageId = l.languageId
inner join language deflan on deflan.languageId=lt2.langId and deflan.isDefaultLang = 1;
         */
        TypedQuery<Languagetranslation> query = em.createQuery(
                "select "
                + "new com.javatmp.domain.Languagetranslation("
                + "l.languageId, lt1.languagetranslationPK.langId, coalesce(lt1.languageName, lt2.languageName)"
                + ") from Language l "
                + "left outer join Languagetranslation lt1 on "
                + "(lt1.languagetranslationPK.languageId = l.languageId and lt1.languagetranslationPK.langId = :la) "
                + "left outer join Languagetranslation lt2 "
                + "on (lt2.languagetranslationPK.languageId = l.languageId) "
                + "join Language deflan on deflan.languageId=lt2.languagetranslationPK.langId and deflan.isDefaultLang = 1 "
                + "", Languagetranslation.class
        );
        query.setParameter("la", "en");
        List<Languagetranslation> resultList = query.getResultList();
        int i;
        for (i = 0; i < resultList.size(); i++) {
            Languagetranslation row = resultList.get(i);
            System.out.println((i + 1) + " " + (MvcHelper.toString(row)));
        }
        i += new Random().nextInt(10000) + 1;

//        List<Theme> themes = themeService.getThemes();
        EntityTransaction tx = null;
        try {
            tx = em.getTransaction();
            tx.begin();

            Theme t = new Theme("Testing " + i);
            em.persist(t);
            Themetranslation englishTranslation = new Themetranslation(t.getThemeId(), "en", "en name " + i);
            Themetranslation arabicTranslation = new Themetranslation(t.getThemeId(), "ar", "ar name " + i);
            em.persist(englishTranslation);
            em.persist(arabicTranslation);
            tx.commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }

//        List<Themetranslation> tr = jpaDaoHelper.findAll(Themetranslation.class);
//        tr.forEach((tt) -> {
//            System.out.println(MvcHelper.toString(tt));
//        });
//
//        themes.forEach((theme) -> {
//            jpaDaoHelper.create(theme);
//        });
    }

}
