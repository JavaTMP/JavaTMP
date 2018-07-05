/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.user;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.*;
import com.javatmp.domain.User;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.adapter.ClassTypeAdapter;
import com.javatmp.mvc.adapter.OrderDirTypeAdapter;
import com.javatmp.mvc.domain.table.DataTableRequest;
import com.javatmp.mvc.domain.table.DataTableResults;
import com.javatmp.mvc.domain.table.OrderDir;
import com.javatmp.service.DBFaker;
import com.javatmp.service.JpaDaoHelper;
import com.javatmp.service.UserService;
import java.sql.SQLException;
import java.text.ParseException;
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
        DBFaker dbFaker;
        JpaDaoHelper jpaDaoHelper;
        UserService userService;
        dbFaker = new DBFaker();
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        userService = new UserService(dbFaker, jpaDaoHelper);

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
