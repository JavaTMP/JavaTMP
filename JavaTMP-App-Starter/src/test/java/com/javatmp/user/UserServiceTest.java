/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.user;

import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.repository.UserRepository;
import com.javatmp.module.user.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.web.server.LocalServerPort;

@Slf4j
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class UserServiceTest {

    @LocalServerPort
    int randomServerPort;

    @Autowired
    UserService userService;

    @Autowired
    UserRepository userRepository;

    @Test
    void getOne() {
        log.info("Spring Boot app runnin on port : {}", randomServerPort);

        Long userId = 2077L;

        User user = this.userRepository.getOne(userId);
        log.debug("User name from db {}", user.getUserName());

        User userToBeUpdated = new User(userId);

        log.debug("user to be update {}", userToBeUpdated);
        int status = this.userService.activateUser(userToBeUpdated);

    }

}
