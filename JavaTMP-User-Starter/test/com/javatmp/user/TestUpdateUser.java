/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.user;

import com.javatmp.module.user.User;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.db.JpaDaoHelper;
import com.javatmp.module.user.UserService;
import javax.persistence.PersistenceException;

/**
 *
 * @author JavaTMP
 */
public class TestUpdateUser {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        JpaDaoHelper jpaDaoHelper;
        UserService userService;
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        userService = new UserService(jpaDaoHelper);

        User user = userService.readCompleteUserById(new User(1L));
        System.out.println(MvcHelper.deepToString(user));
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
