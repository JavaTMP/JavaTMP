/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.timezones;

import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.module.timezone.service.TimezoneService;
import com.javatmp.module.timezone.entity.Timezonetranslation;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import javax.persistence.Persistence;

/**
 *
 * @author JavaTMP
 */
public class TestingTimezoneService {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException, ParseException, UnsupportedEncodingException, IOException {
        TimezoneService timezoneService;
        timezoneService = new TimezoneService(Persistence.createEntityManagerFactory("AppPU"));

        List<Timezonetranslation> timezones = timezoneService.getTimezones();

        timezones.forEach(timezone -> {
            System.out.println(MvcHelper.toString(timezone));
        });
    }

}
