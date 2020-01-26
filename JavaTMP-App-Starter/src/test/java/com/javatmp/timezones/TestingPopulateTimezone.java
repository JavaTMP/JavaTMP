/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.timezones;

import com.javatmp.module.user.entity.Timezone;
import com.javatmp.module.user.repository.TimezoneRepository;
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
public class TestingPopulateTimezone {

    TimezoneRepository timezoneRepository;
    EntityManager em;

    public void main() throws SQLException, ParseException, UnsupportedEncodingException, IOException {

        List<Timezone> timezones = timezoneRepository.findAll();

        InputStreamReader reader = new InputStreamReader(TestingPopulateTimezone.class.getResourceAsStream("arabicTimezones.txt"), "utf8");
        System.out.println("encoding [" + reader.getEncoding() + "]");
        BufferedReader bufferedReader = new BufferedReader(reader);
        String temp = null;
        LinkedList<String> timezoneList = new LinkedList<>();

        while ((temp = bufferedReader.readLine()) != null) {
            timezoneList.add(temp.trim());
        }
        System.out.println("country of countries in the file is [" + timezoneList.size() + "]");

        OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream("insertTimezone.txt"), "utf8");
        BufferedWriter bw = new BufferedWriter(writer);

        EntityTransaction tx = null;
        try {
            tx = em.getTransaction();
            tx.begin();
            timezones.forEach(timezone -> {
                try {
                    //            System.out.println(
//                    "id[" + timezone.getTimezoneId() + "]"
//                    + " idName[" + timezone.getIdName() + "]"
//                    + " offset[" + timezone.getOffsetDescription() + "]"
//                    + " name[" + timezone.getTimezoneName() + "]"
//                    + " description[" + timezone.getTimezoneDescription() + "]");
//            System.out.println(timezone.getTimezoneId() + "|" + timezone.getIdName() + "|" + timezone.getTimezoneName());
//                System.out.println("INSERT INTO `timezone` (`timezoneId`) VALUES ('" + timezone.getTimezoneId() + "');");
//                System.out.println("INSERT INTO `timezoneTranslation` (`timezoneId`, `langId`, `timezoneName`) VALUES ('" + timezone.getTimezoneId() + "', 'en', '" + timezone.getTimezoneName() + "');");
//                System.out.println("INSERT INTO `timezoneTranslation` (`timezoneId`, `langId`, `timezoneName`) VALUES ('" + timezone.getTimezoneId() + "', 'ar', '" + timezoneList.remove() + "');");
                    bw.write("INSERT INTO `timezone` (`timezoneId`) VALUES ('" + timezone.getTimezoneId() + "');");
                    bw.newLine();
                    bw.write("INSERT INTO `timezoneTranslation` (`timezoneId`, `langId`, `timezoneName`) VALUES ('" + timezone.getTimezoneId() + "', 'en', '" + timezone.getTimezoneName() + "');");
                    bw.newLine();
                    bw.write("INSERT INTO `timezoneTranslation` (`timezoneId`, `langId`, `timezoneName`) VALUES ('" + timezone.getTimezoneId() + "', 'ar', '" + timezoneList.remove() + "');");
                    bw.newLine();
//                System.out.println(timezone.getTimezoneName());
//                em.merge(timezone);
                } catch (IOException ex) {
                    Logger.getLogger(TestingPopulateTimezone.class.getName()).log(Level.SEVERE, null, ex);
                }
            });
            bw.flush();
            bw.close();
            tx.commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

}
