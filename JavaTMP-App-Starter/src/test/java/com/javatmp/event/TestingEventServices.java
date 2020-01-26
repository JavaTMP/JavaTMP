/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.event;

import com.javatmp.module.event.service.EventService;
import java.sql.SQLException;

/**
 *
 * @author JavaTMP
 */
public class TestingEventServices {

    EventService eventService;

    public void main() throws SQLException {
        eventService.initialiseDiary();
    }

}
