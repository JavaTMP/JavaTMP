/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.theme;

import com.javatmp.mvc.MvcHelper;
import com.javatmp.db.JpaDaoHelper;
import com.javatmp.domain.Theme;
import com.javatmp.domain.Themetranslation;
import com.javatmp.service.ThemeService;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import javax.persistence.EntityManager;
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
        TypedQuery<Themetranslation> query = em.createQuery(
                "SELECT new com.javatmp.domain.Themetranslation(tr.langId, coalesce(tr.themeId, de.themeId), coalesce(tr.themeName, de.themeName)) "
                + "FROM Theme t "
                + "left outer join Themetranslation tr on t.themeId = tr.themeId and tr.langId = :la "
                + "left outer join Themetranslation de on t.themeId = de.themeId and de.isDefaultLang = 1 "
                //                + "left outer join Theme th on th.themeId = t.themeId "
                //                + "where l.languageId = :la", Themetranslation.class);
                + "", Themetranslation.class);
        query.setParameter("la", "ar");
        List<Themetranslation> resultList = query.getResultList();
        int i;
        for (i = 0; i < resultList.size(); i++) {
            System.out.println((i + 1) + MvcHelper.toString(resultList.get(i)));
        }
        i += 1010;
        em.close();

        List<Theme> themes = themeService.getThemes();
        Theme t = new Theme("Testing " + i);
        jpaDaoHelper.create(t);

        Themetranslation englishTranslation = new Themetranslation("en", t.getThemeId(), "en name " + i);
        Themetranslation arabicTranslation = new Themetranslation("ar", t.getThemeId(), "ar name " + i);
        jpaDaoHelper.create(englishTranslation);
        jpaDaoHelper.create(arabicTranslation);

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
