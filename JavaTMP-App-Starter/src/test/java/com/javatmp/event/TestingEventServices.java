/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.event;

import com.javatmp.module.event.service.EventService;
import java.sql.SQLException;
import javax.persistence.Persistence;

/**
 *
 * @author JavaTMP
 */
public class TestingEventServices {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        EventService eventService = new EventService(Persistence.createEntityManagerFactory("AppPU"));
        eventService.initialiseDiary();
    }

}
