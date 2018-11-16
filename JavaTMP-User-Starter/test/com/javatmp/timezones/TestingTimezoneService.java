/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.timezones;

import com.javatmp.util.JpaDaoHelper;
import com.javatmp.module.timezone.Timezone;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.module.timezone.TimezoneService;
import com.javatmp.module.timezone.Timezonetranslation;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

/**
 *
 * @author JavaTMP
 */
public class TestingTimezoneService {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException, ParseException, UnsupportedEncodingException, IOException {
        JpaDaoHelper jpaDaoHelper;
        TimezoneService timezoneService;
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        timezoneService = new TimezoneService(jpaDaoHelper);

        List<Timezonetranslation> timezones = timezoneService.getTimezones();

        timezones.forEach(timezone -> {
            System.out.println(MvcHelper.toString(timezone));
        });
    }

}
