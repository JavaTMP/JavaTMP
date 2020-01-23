/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.country;

import com.javatmp.module.user.entity.Countrytranslation;
import com.javatmp.module.user.entity.CountrytranslationPK;
import com.javatmp.module.user.entity.Languagetranslation;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.CountryService;
import com.javatmp.module.user.service.LanguageService;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.LinkedList;
import java.util.List;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author JavaTMP
 */
public class TestingPopulateCountries {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException, ParseException, IOException {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("AppPU");
        CountryService countryService;
        countryService = new CountryService(emf);
        LanguageService languageService = new LanguageService(emf);
        CountryTransalationService countryTransalationService = new CountryTransalationService(emf);
        List<Languagetranslation> languages = languageService.getLanguages(new User(0L, "en"));
        List<Countrytranslation> countries = countryService.getCountries();

        InputStreamReader reader = new InputStreamReader(TestingPopulateCountries.class.getResourceAsStream("arabicCountry.txt"), "utf8");
        System.out.println("encoding [" + reader.getEncoding() + "]");
        BufferedReader bufferedReader = new BufferedReader(reader);
        String temp = null;
        LinkedList<String> countryList = new LinkedList<>();

        while ((temp = bufferedReader.readLine()) != null) {
            countryList.add(temp.trim());
        }
        System.out.println("country of countries in the file is [" + countryList.size() + "]");
        int count = 0;
        countries.forEach((country) -> {
            //System.out.println(country.getCountryName());
            Countrytranslation newCountry
                    = new Countrytranslation(new CountrytranslationPK(country.getCountrytranslationPK().getCountryId(), "en"), country.getCountryName());

            countryTransalationService.save(newCountry);
            newCountry
                    = new Countrytranslation(new CountrytranslationPK(country.getCountrytranslationPK().getCountryId(), "ar"), countryList.remove());
            countryTransalationService.save(newCountry);
        });

        languages.forEach((language) -> {
//            System.out.println(language.getLanguagetranslationPK().getLanguageId());
        });

    }

}
