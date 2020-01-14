/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.userstats;

import com.javatmp.module.user.service.UserActivityService;
import com.javatmp.module.user.service.UserStatsService;
import java.util.Arrays;
import java.util.List;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

/**
 *
 * @author JavaTMP
 */
@SpringBootTest
public class usersstats {

    @Autowired
    UserStatsService userStatsService;

    @Autowired
    UserActivityService userActivityService;

    @Test
    public void main() {

        List<Object[]> results = userStatsService.overallUsersStatuses();
        System.out.println((results));
        results = userStatsService.usersBirthdayGroupingByMonth();

        for (Object[] row : results) {
            System.out.println(Arrays.toString(row));
        }

        results = userActivityService.userPageViewsActivitiesPerHour();
        for (Object[] row : results) {
            System.out.println(Arrays.toString(row));
        }

        System.out.println("average load time per hour");
        results = userActivityService.avgPagesLoadTimePerHour();
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
