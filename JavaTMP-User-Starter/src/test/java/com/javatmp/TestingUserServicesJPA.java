/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp;

import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import java.sql.SQLException;
import javax.persistence.Persistence;

/**
 *
 * @author JavaTMP
 */
public class TestingUserServicesJPA {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        UserService userService;
        userService = new UserService(Persistence.createEntityManagerFactory("AppPU"));

        User user = new User();
        user.setUserName("user1");
        user = userService.readUserByUsername(user);
        System.out.println(MvcHelper.deepToString(user));
        user = userService.readUserByUsername(user);
        System.out.println(MvcHelper.deepToString(user));
        System.out.println(user.getProfilePicDocument());

    }

}
