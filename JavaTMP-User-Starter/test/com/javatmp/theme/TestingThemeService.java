/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.theme;

import com.javatmp.mvc.MvcHelper;
import com.javatmp.db.JpaDaoHelper;
import com.javatmp.module.theme.Theme;
import com.javatmp.module.theme.Themetranslation;
import com.javatmp.module.user.User;
import com.javatmp.module.theme.ThemeService;
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
public class TestingThemeService {

    public static void main(String[] args) throws SQLException, ParseException {
        JpaDaoHelper jpaDaoHelper;
        ThemeService themeService;
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        themeService = new ThemeService(jpaDaoHelper);

        List<Object[]> results;
        EntityManager em = jpaDaoHelper.getEntityManagerFactory().createEntityManager();

        List<Themetranslation> resultList = themeService.getThemes();

        for (int i = 0; i < resultList.size(); i++) {
            Themetranslation row = resultList.get(i);
            System.out.println((i + 1) + " " + MvcHelper.deepToString(row));
        }

        User localeUser = new User(0L, "ar");
        resultList = themeService.getThemes(localeUser);

        for (int i = 0; i < resultList.size(); i++) {
            Themetranslation row = resultList.get(i);
            System.out.println((i + 1) + " " + MvcHelper.deepToString(row));
        }

        localeUser.setLang("en");
        resultList = themeService.getThemes(localeUser);

        for (int i = 0; i < resultList.size(); i++) {
            Themetranslation row = resultList.get(i);
            System.out.println((i + 1) + " " + MvcHelper.deepToString(row));
        }
    }

}
