/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.language;

import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.module.language.LanguageService;
import com.javatmp.module.language.Languagetranslation;
import com.javatmp.module.theme.ThemeService;
import com.javatmp.module.user.entity.User;
import com.javatmp.util.JpaDaoHelper;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import javax.persistence.Persistence;

/**
 *
 * @author JavaTMP
 */
public class TestingLanguage {

    public static void main(String[] args) throws SQLException, ParseException {
        JpaDaoHelper jpaDaoHelper;
        ThemeService themeService;
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        themeService = new ThemeService(Persistence.createEntityManagerFactory("AppPU"));
        LanguageService languageService = new LanguageService(Persistence.createEntityManagerFactory("AppPU"));
        User testUser = new User();
        testUser.setLang("ar");
        List<Languagetranslation> langs = languageService.getLanguages(testUser);
        int i;
        for (i = 0; i < langs.size(); i++) {
            Languagetranslation row = langs.get(i);
            System.out.println((i + 1) + " " + MvcHelper.toString(row));
        }

        langs = languageService.getLanguages();
        for (i = 0; i < langs.size(); i++) {
            Languagetranslation row = langs.get(i);
            System.out.println((i + 1) + " " + MvcHelper.toString(row));
        }
    }

}
