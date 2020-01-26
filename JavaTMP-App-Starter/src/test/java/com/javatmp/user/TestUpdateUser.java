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
public class TestUpdateUser {

    UserService userService;

    public void main() {

        User user = userService.readCompleteUserById(new User(1L));
        System.out.println((user));
        try {
            user.setUserName("daw232323223232rim");
            user.getProfilePicDocument().setDocumentName("232w32323223232");
            int updateStatus = userService.updateCompleteUser(user);
            System.out.println("Update status >" + (updateStatus));
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
