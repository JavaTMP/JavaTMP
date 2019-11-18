/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.event;

import com.javatmp.module.event.service.EventService;
import com.javatmp.module.user.entity.User;
import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.util.JpaDaoHelper;
import com.javatmp.module.user.service.UserService;
import java.sql.SQLException;

/**
 *
 * @author JavaTMP
 */
public class TestingEventServices {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        JpaDaoHelper jpaDaoHelper;
        UserService userService;
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        EventService eventService = new EventService(jpaDaoHelper);
        eventService.initialiseDiary();
    }

}
