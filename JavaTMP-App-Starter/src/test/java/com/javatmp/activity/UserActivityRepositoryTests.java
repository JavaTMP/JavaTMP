/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.activity;

import com.javatmp.module.user.repository.UserActivityRepository;
import java.util.List;
import javax.persistence.Tuple;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class UserActivityRepositoryTests {

    @Autowired
    UserActivityRepository userActivityRepository;

    @Test
    void main() {

        List<Tuple> results = userActivityRepository.userPageViews();

        log.debug("user page views count {}", results.size());
    }

}
