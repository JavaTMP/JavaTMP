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
public class TestReadBasicUserById {

    UserService userService;

    public void main() {
        try {
            User user = new User(1L);
            user = userService.readBasicUserById(user);
            System.out.println((user));
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
