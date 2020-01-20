/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.activity;

import com.javatmp.module.user.service.UserActivityService;
import java.util.List;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class PagesViewTest {

    @Autowired
    UserActivityService activityService;

    @Test
    void main() {

        List<Object[]> results = activityService.userPageViews();

        System.out.println((results));
    }

}
