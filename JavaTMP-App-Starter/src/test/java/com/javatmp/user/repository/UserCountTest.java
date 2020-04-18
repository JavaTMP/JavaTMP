/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.user.repository;

import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.text.ParseException;

/**
 *
 * @author Mohamed
 */
@SpringBootTest
@Slf4j
public class UserCountTest {

    @Autowired
    UserRepository userRepository;

    @Test
    void getUserCountTest() throws ParseException {
        System.out.println("start get user count test");
        DataTableRequest<User> request = new DataTableRequest<>();
        Long count = this.userRepository.retrievePageRequestCount(request);
        log.info("User count : {} ", count);
    }

}
