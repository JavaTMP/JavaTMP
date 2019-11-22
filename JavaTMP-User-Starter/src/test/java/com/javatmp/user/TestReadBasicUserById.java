/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.user;

import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;

/**
 *
 * @author JavaTMP
 */
public class TestReadBasicUserById {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        UserService userService;
        userService = new UserService(Persistence.createEntityManagerFactory("AppPU"));
        try {
            User user = new User(1L);
            user = userService.readBasicUserById(user);
            System.out.println(MvcHelper.toString(user));
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
