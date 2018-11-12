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
import com.javatmp.domain.User;
import com.javatmp.service.LanguageService;
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
