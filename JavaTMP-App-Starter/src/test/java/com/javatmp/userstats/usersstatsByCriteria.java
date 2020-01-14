/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.userstats;

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
public class usersstatsByCriteria {

    @Autowired
    UserStatsService userStatsService;

    @Test
    public void main() {

        List<Object[]> results = null;

        System.out.println("usersCountriesGrouping");
        results = userStatsService.usersCountriesGroupingByCriteria();
        for (Object[] row : results) {
            System.out.println(Arrays.toString(row));
        }

    }

}
