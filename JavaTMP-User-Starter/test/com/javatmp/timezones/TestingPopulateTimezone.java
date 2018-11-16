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
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

/**
 *
 * @author JavaTMP
 */
public class TestingPopulateTimezone {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException, ParseException {
        JpaDaoHelper jpaDaoHelper;
        TimezoneService timezoneService;
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        timezoneService = new TimezoneService(jpaDaoHelper);

        List<Timezone> timezones = timezoneService.getTimezones();

        final EntityManager em = jpaDaoHelper.getEntityManagerFactory().createEntityManager();
        EntityTransaction tx = null;
        try {
            tx = em.getTransaction();
            tx.begin();
            timezones.forEach(timezone -> {
//            System.out.println(
//                    "id[" + timezone.getTimezoneId() + "]"
//                    + " idName[" + timezone.getIdName() + "]"
//                    + " offset[" + timezone.getOffsetDescription() + "]"
//                    + " name[" + timezone.getTimezoneName() + "]"
//                    + " description[" + timezone.getTimezoneDescription() + "]");
//            System.out.println(timezone.getTimezoneId() + "|" + timezone.getIdName() + "|" + timezone.getTimezoneName());
                System.out.println("INSERT INTO `timezone` (`timezoneId`) VALUES ('" + timezone.getTimezoneId() + "');");
                System.out.println("INSERT INTO `timezoneTranslation` (`timezoneId`, `langId`, `timezoneName`) VALUES ('" + timezone.getTimezoneId() + "', 'en', '" + timezone.getTimezoneName() + "');");
//                System.out.println(timezone.getTimezoneName());
//                em.merge(timezone);
            });
            tx.commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

}
