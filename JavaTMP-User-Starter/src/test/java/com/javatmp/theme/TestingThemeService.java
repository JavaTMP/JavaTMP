/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.theme;

import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.module.theme.ThemeService;
import com.javatmp.module.theme.Themetranslation;
import com.javatmp.module.user.entity.User;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;

/**
 *
 * @author JavaTMP
 */
public class TestingThemeService {

    public static void main(String[] args) throws SQLException, ParseException {
        ThemeService themeService;
        themeService = new ThemeService(Persistence.createEntityManagerFactory("AppPU"));

        List<Object[]> results;
        EntityManager em = themeService.getEntityManagerFactory().createEntityManager();

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
