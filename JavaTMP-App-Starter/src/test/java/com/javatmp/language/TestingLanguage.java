/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.language;

import com.javatmp.module.user.entity.Language;
import com.javatmp.module.user.entity.Languagetranslation;
import com.javatmp.module.user.repository.LanguageRepository;
import com.javatmp.module.user.repository.LanguagetranslationRepository;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

/**
 *
 * @author JavaTMP
 */
public class TestingLanguage {

    LanguageRepository languageRepository;

    LanguagetranslationRepository languagetranslationRepository;

    public void main() throws SQLException, ParseException {

        List<Language> lanuages = languageRepository.findAll();

        lanuages.forEach((language) -> {
            List<Languagetranslation> langs = languagetranslationRepository.listLanguageTransalatedBylanguage(language.getLanguageId());
            for (int i = 0; i < langs.size(); i++) {
                Languagetranslation row = langs.get(i);
                System.out.println((i + 1) + " " + (row));
            }
        });

        List<Languagetranslation> languagetranslations = languagetranslationRepository.findAll();
        for (int i = 0; i < languagetranslations.size(); i++) {
            Languagetranslation row = languagetranslations.get(i);
            System.out.println((i + 1) + " " + (row));
        }
    }

}
