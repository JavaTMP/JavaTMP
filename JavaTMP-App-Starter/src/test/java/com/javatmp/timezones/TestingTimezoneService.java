/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.timezones;

import com.javatmp.module.user.entity.Timezone;
import com.javatmp.module.user.repository.TimezoneRepository;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

/**
 *
 * @author JavaTMP
 */
public class TestingTimezoneService {

    TimezoneRepository timezoneRepository;

    public void main() throws SQLException, ParseException, UnsupportedEncodingException, IOException {

        List<Timezone> timezones = timezoneRepository.findAll();

        timezones.forEach(timezone -> {
            System.out.println((timezone));
        });
    }

}
