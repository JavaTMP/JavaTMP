/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp;

import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;

/**
 *
 * @author JavaTMP
 */
public class TestingUserServicesJPA {

    UserService userService;

    public void main() {

        User user = new User();
        user.setUserName("user1");
        user = userService.readUserByUsername(user);
        System.out.println((user));
        user = userService.readUserByUsername(user);
        System.out.println((user));
        System.out.println(user.getProfilePicDocument());

    }

}
