/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.country;

import com.javatmp.module.country.CountryService;
import com.javatmp.module.country.Countrytranslation;
import com.javatmp.module.country.CountrytranslationPK;
import com.javatmp.module.language.LanguageService;
import com.javatmp.module.language.Languagetranslation;
import com.javatmp.module.user.entity.User;
import com.javatmp.util.JpaDaoHelper;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author JavaTMP
 */
public class TestingPopulateCountries {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException, ParseException, IOException {
        JpaDaoHelper jpaDaoHelper;
        CountryService countryService;
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        countryService = new CountryService(jpaDaoHelper);
        LanguageService languageService = new LanguageService(jpaDaoHelper);
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

            jpaDaoHelper.create(newCountry);
            newCountry
                    = new Countrytranslation(new CountrytranslationPK(country.getCountrytranslationPK().getCountryId(), "ar"), countryList.remove());
            jpaDaoHelper.create(newCountry);
        });

        languages.forEach((language) -> {
//            System.out.println(language.getLanguagetranslationPK().getLanguageId());
        });

    }

}
