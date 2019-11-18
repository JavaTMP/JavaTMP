/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.language;

import com.javatmp.theme.*;
import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.util.JpaDaoHelper;
import com.javatmp.module.language.Language;
import com.javatmp.module.language.Languagetranslation;
import com.javatmp.module.theme.Theme;
import com.javatmp.module.theme.Themetranslation;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.language.LanguageService;
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
public class TestingLanguage {

    public static void main(String[] args) throws SQLException, ParseException {
        JpaDaoHelper jpaDaoHelper;
        ThemeService themeService;
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        themeService = new ThemeService(jpaDaoHelper);
        LanguageService languageService = new LanguageService(jpaDaoHelper);
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
