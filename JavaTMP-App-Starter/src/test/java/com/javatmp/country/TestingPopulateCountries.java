/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.country;

import com.javatmp.module.user.entity.Country;
import com.javatmp.module.user.entity.Countrytranslation;
import com.javatmp.module.user.entity.CountrytranslationPK;
import com.javatmp.module.user.entity.Languagetranslation;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.repository.CountryRepository;
import com.javatmp.module.user.repository.CountrytranslationRepository;
import com.javatmp.module.user.service.LanguageService;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.LinkedList;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class TestingPopulateCountries {

    CountryRepository countryRepository;
    LanguageService languageService;
    CountrytranslationRepository countrytranslationRepository;

    public void main() throws SQLException, ParseException, IOException {

        List<Languagetranslation> languages = languageService.getLanguages(new User(0L, "en"));
        List<Country> countries = countryRepository.findAll();

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
                    = new Countrytranslation(new CountrytranslationPK(country.getCountryId(), "ar"), countryList.remove());
            countrytranslationRepository.save(newCountry);
        });

        languages.forEach((language) -> {
//            System.out.println(language.getLanguagetranslationPK().getLanguageId());
        });

    }

}
