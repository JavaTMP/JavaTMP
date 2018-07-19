/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.userstats;

import com.javatmp.user.*;
import com.javatmp.domain.User;
import com.javatmp.domain.User_;
import com.javatmp.db.JpaDaoHelper;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.service.ActivityService;
import com.javatmp.service.ServicesFactory;
import com.javatmp.service.UserService;
import com.javatmp.service.UserStatsService;
import com.javatmp.util.Constants;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceException;
import javax.persistence.Query;
import javax.persistence.Tuple;
import javax.persistence.TupleElement;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Root;
import org.apache.commons.beanutils.BeanUtils;

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

        results = activityService.avgPagesLoadTimePerHour();
        for (Object[] row : results) {
            System.out.println(Arrays.toString(row));
        }

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
