/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.country;

import com.javatmp.user.*;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.*;
import com.javatmp.module.user.User;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.adapter.ClassTypeAdapter;
import com.javatmp.mvc.adapter.OrderDirTypeAdapter;
import com.javatmp.mvc.domain.table.DataTableRequest;
import com.javatmp.mvc.domain.table.DataTableResults;
import com.javatmp.mvc.domain.table.OrderDir;
import com.javatmp.db.JpaDaoHelper;
import com.javatmp.module.country.Country;
import com.javatmp.module.country.CountryService;
import com.javatmp.module.user.UserService;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

/**
 *
 * @author JavaTMP
 */
public class TestingPopulateCountries {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException, ParseException {
        JpaDaoHelper jpaDaoHelper;
        CountryService countryService;
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        countryService = new CountryService(jpaDaoHelper);

        List<Country> countries = countryService.getCountries();

        countries.forEach((country) -> {
            jpaDaoHelper.create(country);
        });

    }

}
