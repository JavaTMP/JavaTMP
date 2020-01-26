/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.country;

import com.javatmp.module.user.entity.Countrytranslation;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.CountryService;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class FetchingCountries {

    @Autowired
    CountryService countryService;

    @Test
    public void main() throws SQLException, ParseException, IOException {

        List<Countrytranslation> countries = countryService.getCountries(new User(0L, "ar"));

        countries.forEach((country) -> {
            System.out.println(country);
        });

        countries = countryService.getCountries(new User(0L, "en"));

        countries.forEach((country) -> {
            System.out.println(country.getCountryName());
        });

    }

}
