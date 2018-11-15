/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.country;

import com.javatmp.module.user.User;
import com.javatmp.util.JpaDaoHelper;
import com.javatmp.module.country.CountryService;
import com.javatmp.module.country.Countrytranslation;
import com.javatmp.module.language.LanguageService;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

/**
 *
 * @author JavaTMP
 */
public class FetchingCountries {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException, ParseException, IOException {
        JpaDaoHelper jpaDaoHelper;
        CountryService countryService;
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        countryService = new CountryService(jpaDaoHelper);
        LanguageService languageService = new LanguageService(jpaDaoHelper);

        List<Countrytranslation> countries = countryService.getCountries();

        countries.forEach((country) -> {
            System.out.println(country);
        });

        countries = countryService.getCountries(new User(0L, "ar"));

        countries.forEach((country) -> {
            System.out.println(country);
        });

        countries = countryService.getCountries(new User(0L, "en"));

        countries.forEach((country) -> {
            System.out.println(country.getCountryName());
        });

    }

}
