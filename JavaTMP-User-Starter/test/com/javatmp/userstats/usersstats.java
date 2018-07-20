/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.userstats;

import com.javatmp.mvc.MvcHelper;
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
public class usersstats {

    public static void main(String[] args) throws NoSuchFieldException, IllegalArgumentException, IllegalAccessException, InvocationTargetException, InstantiationException {

        ServicesFactory sf = new ServicesFactory(Constants.DEFAULT_PERSISTENT_UNIT_NAME);

        UserStatsService userStatsService = sf.getUserStatsService();

        List<Object[]> results = userStatsService.overallUsersStatuses();

        System.out.println(MvcHelper.toString(results));

        results = userStatsService.usersBirthdayGroupingByMonth();

        for (Object[] row : results) {
            System.out.println(Arrays.toString(row));
        }

        ActivityService activityService = sf.getActivityService();
        results = activityService.userPageViewsActivitiesPerHour();
        for (Object[] row : results) {
            System.out.println(Arrays.toString(row));
        }

        System.out.println("average load time per hour");
        results = activityService.avgPagesLoadTimePerHour();
        for (Object[] row : results) {
            System.out.println(Arrays.toString(row));
        }

        System.out.println("usersCountriesGrouping");
        results = userStatsService.usersCountriesGrouping();
        for (Object[] row : results) {
            System.out.println(Arrays.toString(row));
        }

        Long count = userStatsService.usersVistingToday();

        System.out.println("visiting users today is [" + count + "]");

        count = userStatsService.usersNotVistingToday();

        System.out.println("Not visiting users today is [" + count + "]");

    }

}
