/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp;

import com.javatmp.module.user.User;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.db.JpaDaoHelper;
import com.javatmp.module.user.UserService;
import java.sql.SQLException;

/**
 *
 * @author JavaTMP
 */
public class TestingUserServicesJPA {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        JpaDaoHelper jpaDaoHelper;
        UserService userService;
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        userService = new UserService(jpaDaoHelper);

        User user = new User();
        user.setUserName("user1");
        user = userService.readUserByUsername(user);
        System.out.println(MvcHelper.deepToString(user));
        user = userService.readUserByUsername(user);
        System.out.println(MvcHelper.deepToString(user));
        System.out.println(user.getProfilePicDocument());

    }

}
