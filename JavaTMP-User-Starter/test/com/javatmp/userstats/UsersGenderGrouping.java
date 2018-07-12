/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.userstats;

import com.javatmp.service.ActivityService;
import com.javatmp.service.ServicesFactory;
import com.javatmp.service.UserStatsService;
import com.javatmp.util.Constants;
import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author JavaTMP
 */
public class UsersGenderGrouping {

    public static void main(String[] args) throws NoSuchFieldException, IllegalArgumentException, IllegalAccessException, InvocationTargetException, InstantiationException {

        ServicesFactory sf = new ServicesFactory(Constants.DEFAULT_PERSISTENT_UNIT_NAME);

        UserStatsService userStatsService = sf.getUserStatsService();

        List<Object[]> results = userStatsService.usersGenderGrouping();

        for (Object[] row : results) {
            System.out.println(Arrays.toString(row));
        }

        results = userStatsService.usersBirthdayGroupingByMonth();

        for (Object[] row : results) {
            System.out.println(Arrays.toString(row));
        }

        ActivityService activityService = sf.getActivityService();
        results = activityService.userPageViewsActivitiesPerHour();
        for (Object[] row : results) {
            System.out.println(Arrays.toString(row));
        }

        results = activityService.avgPagesLoadTimePerHour();
        for (Object[] row : results) {
            System.out.println(Arrays.toString(row));
        }

    }

}
