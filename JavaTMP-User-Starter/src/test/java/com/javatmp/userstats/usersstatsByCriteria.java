/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.userstats;

import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.module.activity.ActivityService;
import com.javatmp.util.ServicesFactory;
import com.javatmp.module.stats.controller.UserStatsService;
import com.javatmp.util.Constants;
import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author JavaTMP
 */
public class usersstatsByCriteria {

    public static void main(String[] args) throws NoSuchFieldException, IllegalArgumentException, IllegalAccessException, InvocationTargetException, InstantiationException {

        ServicesFactory sf = new ServicesFactory(Constants.DEFAULT_PERSISTENT_UNIT_NAME);

        UserStatsService userStatsService = sf.getUserStatsService();

        List<Object[]> results = null;

        System.out.println("usersCountriesGrouping");
        results = userStatsService.usersCountriesGroupingByCriteria();
        for (Object[] row : results) {
            System.out.println(Arrays.toString(row));
        }

    }

}
