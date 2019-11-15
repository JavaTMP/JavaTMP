/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.activity;

import com.javatmp.mvc.MvcHelper;
import com.javatmp.module.activity.ActivityService;
import com.javatmp.util.ServicesFactory;
import com.javatmp.module.stats.controller.UserStatsService;
import com.javatmp.util.Constants;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

/**
 *
 * @author JavaTMP
 */
public class PagesView {

    public static void main(String[] args) throws NoSuchFieldException, IllegalArgumentException, IllegalAccessException, InvocationTargetException, InstantiationException {

        ServicesFactory sf = new ServicesFactory(Constants.DEFAULT_PERSISTENT_UNIT_NAME);

        ActivityService activityService = sf.getActivityService();

        List<Object[]> results = activityService.userPageViews();

        System.out.println(MvcHelper.toString(results));
    }

}
