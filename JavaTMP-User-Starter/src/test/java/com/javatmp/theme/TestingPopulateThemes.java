/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.theme;

import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.module.theme.Theme;
import com.javatmp.module.theme.ThemeService;
import com.javatmp.module.theme.Themetranslation;
import com.javatmp.util.JpaDaoHelper;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import java.util.Random;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

/**
 *
 * @author JavaTMP
 */
public class TestingPopulateThemes {

    public static void main(String[] args) throws SQLException, ParseException {
        JpaDaoHelper jpaDaoHelper;
        ThemeService themeService;
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        themeService = new ThemeService(Persistence.createEntityManagerFactory("AppPU"));

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
select lanTr.`languageName`, t.`themeId`, coalesce(th1.themeName, th2.themeName) as col_2_0_
from `language` lan
join languagetranslation lanTr on lanTr.`languageId` = lan.`languageId` and lanTr.`langId` = lan.`languageId`
left outer join theme t on 1 = 1
left outer join themetranslation th1 on (t.themeId = th1.themeId and th1.`langId` = lan.`languageId`)
left outer join themetranslation th2 on (t.themeId = th2.themeId)
join `language` reflan on reflan.`languageId` = th2.`langId` and reflan.`isDefaultLang` = 1;
         */
//TypedQuery<Themetranslation> query = em.createQuery(
//                "select lanTr.languageName, t.themeId, coalesce(th1.themeName, th2.themeName) "
//                + "from Language lan "
//                + "join lan.languagetranslationList lanTr "
//                + "on lanTr.languagetranslationPK.languageId = lan.languageId "
//                + "and lanTr.languagetranslationPK.langId = 'ar' "
//                + "left outer join Theme t on (1=1) "
//                + "left outer join Themetranslation th1 "
//                + "on (t.themeId = th1.themetranslationPK.themeId and th1.themetranslationPK.langId = lan.languageId)"
//                + "left outer join Themetranslation th2 "
//                + "on (t.themeId = th2.themetranslationPK.themeId)"
//                + "join Language reflan "
//                + "on reflan.languageId = th2.themetranslationPK.langId and reflan.isDefaultLang = 1 "
//                + "where th1.themetranslationPK.langId = lan.languageId"
//                //                + "where lanTr.language1 = :la"
//                //                + "left outer join Theme th on th.themeId = t.themeId "
//                //                + "where l.languageId = :la", Themetranslation.class);
//                + "", Themetranslation.class
//        );
        TypedQuery<Themetranslation> query = em.createQuery(
                "select new com.javatmp.domain.Themetranslation(t.themeId, lan.languageId, coalesce(th1.themeName, th2.themeName)) "
                + "from Language lan "
                + "join lan.languagetranslationList lanTr "
                + "on lanTr.languagetranslationPK.languageId = lan.languageId "
                //                + "and lanTr.languagetranslationPK.langId = 'ar' "
                + "left outer join Theme t on (1=1) "
                + "left outer join Themetranslation th1 "
                + "on (t.themeId = th1.themetranslationPK.themeId and th1.themetranslationPK.langId = lan.languageId)"
                + "left outer join Themetranslation th2 "
                + "on (t.themeId = th2.themetranslationPK.themeId)"
                + "join Language reflan "
                + "on reflan.languageId = th2.themetranslationPK.langId and reflan.isDefaultLang = 1 "
                + "where th1.themetranslationPK.langId = lan.languageId"
                //                + "where lanTr.language1 = :la"
                //                + "left outer join Theme th on th.themeId = t.themeId "
                //                + "where l.languageId = :la", Themetranslation.class);
                + "", Themetranslation.class
        );
//        query.setParameter("la", new Language("en"));
        List<Themetranslation> resultList = query.getResultList();
        int i;
        for (i = 0; i < resultList.size(); i++) {
            Themetranslation row = resultList.get(i);
            System.out.println((i + 1) + " " + MvcHelper.deepToString(row));
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
