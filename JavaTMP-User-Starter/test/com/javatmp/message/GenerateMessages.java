/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.message;

import com.javatmp.module.message.MessageService;
import com.javatmp.module.user.UserService;
import com.javatmp.util.JpaDaoHelper;

/**
 *
 * @author JavaTMP
 */
public class GenerateMessages {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        JpaDaoHelper jpaDaoHelper;
        UserService userService;
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        userService = new UserService(jpaDaoHelper);
        MessageService messageService = new MessageService(jpaDaoHelper, userService);
        messageService.generateMessages();
    }

}
