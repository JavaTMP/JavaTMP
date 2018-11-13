/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.timezones;

import com.javatmp.db.JpaDaoHelper;
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

        EntityManager em = null;
        EntityTransaction tx = null;
        try {
            em = jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            tx = em.getTransaction();
            tx.begin();
            for (Timezone timezone : timezones) {
                em.persist(timezone);
            }
            tx.commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }

    }

}
