/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.activity;

import com.javatmp.module.user.entity.UserActivity;
import com.javatmp.module.user.service.UserActivityService;
import java.util.Date;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

/**
 *
 * @author Mohamed
 */
@SpringBootTest
public class AddNewActivityTest {

    @Autowired
    UserActivityService userActivityService;

    @Test
    void contextLoads() {
        UserActivity activity = new UserActivity();
        activity.setCreationDate(new Date());
        this.userActivityService.save(activity);
    }

}
