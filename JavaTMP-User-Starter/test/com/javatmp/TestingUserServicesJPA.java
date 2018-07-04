/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp;

import com.javatmp.domain.User;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.service.DBFaker;
import com.javatmp.service.JpaDaoHelper;
import com.javatmp.service.UserService;
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
        DBFaker dbFaker;
        JpaDaoHelper jpaDaoHelper;
        UserService userService;
        dbFaker = new DBFaker();
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        userService = new UserService(dbFaker, jpaDaoHelper);

        User user = new User();
        user.setUserName("user1");
        user = userService.readUserByUsername(user);
        System.out.println(MvcHelper.deepToString(user));
    }

}
