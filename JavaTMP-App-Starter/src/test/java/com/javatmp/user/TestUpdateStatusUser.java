/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.user;

import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import javax.persistence.PersistenceException;

/**
 *
 * @author JavaTMP
 */
public class TestUpdateStatusUser {

    UserService userService;

    public void main() {

        try {
            User user = new User(1L);
            user = userService.readCompleteUserById(user);
            int status = 0;
            System.out.println("current status = " + user.getStatus());
            if (user.getStatus().equals(new Short("1"))) {
                System.out.println("Start deactivate");
                status = userService.deActivateUser(user);
            } else {
                System.out.println("Start activate");
                status = userService.activateUser(user);
            }

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
