/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.country;

import com.javatmp.module.country.CountryService;
import com.javatmp.module.country.Countrytranslation;
import com.javatmp.module.language.LanguageService;
import com.javatmp.module.user.entity.User;
import com.javatmp.util.JpaDaoHelper;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import javax.persistence.Persistence;

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
        countryService = new CountryService(Persistence.createEntityManagerFactory("AppPU"));
        LanguageService languageService = new LanguageService(Persistence.createEntityManagerFactory("AppPU"));

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
