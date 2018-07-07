/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.user;

import com.javatmp.domain.User;
import com.javatmp.db.JpaDaoHelper;
import com.javatmp.service.UserService;
import javax.persistence.PersistenceException;

/**
 *
 * @author JavaTMP
 */
public class TestUpdateStatusUser {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        JpaDaoHelper jpaDaoHelper;
        UserService userService;
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        userService = new UserService(jpaDaoHelper);
        try {
            User user = new User(1L);
            user = userService.readUserByUserId(user);

            int status = userService.deActivateUser(user);
            System.out.println("status [" + status + "]");
        } catch (PersistenceException e) {
            Throwable t = e;
            while (t != null) {
                System.out.println("type [" + e.getClass().getName() + "]");
                System.out.println("e [" + e.getMessage() + "]");
                t = t.getCause();
            }
        }

    }

}
