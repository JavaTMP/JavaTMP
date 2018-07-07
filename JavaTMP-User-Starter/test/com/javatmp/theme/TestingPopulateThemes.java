/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.theme;

import com.javatmp.country.*;
import com.javatmp.user.*;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.*;
import com.javatmp.domain.User;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.adapter.ClassTypeAdapter;
import com.javatmp.mvc.adapter.OrderDirTypeAdapter;
import com.javatmp.mvc.domain.table.DataTableRequest;
import com.javatmp.mvc.domain.table.DataTableResults;
import com.javatmp.mvc.domain.table.OrderDir;
import com.javatmp.db.JpaDaoHelper;
import com.javatmp.domain.Country;
import com.javatmp.domain.Theme;
import com.javatmp.service.CountryService;
import com.javatmp.service.ThemeService;
import com.javatmp.service.UserService;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

/**
 *
 * @author JavaTMP
 */
public class TestingPopulateThemes {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException, ParseException {
        JpaDaoHelper jpaDaoHelper;
        ThemeService themeService;
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        themeService = new ThemeService(jpaDaoHelper);

        List<Theme> themes = themeService.getThemes();

        themes.forEach((theme) -> {
            jpaDaoHelper.create(theme);
        });

    }

}
