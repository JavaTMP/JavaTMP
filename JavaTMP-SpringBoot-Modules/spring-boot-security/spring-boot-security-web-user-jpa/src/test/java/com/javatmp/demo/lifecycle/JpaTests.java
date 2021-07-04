package com.javatmp.demo;


import com.javatmp.demo.entities.User;
import com.javatmp.demo.model.CustomUserDetails;
import com.javatmp.demo.repositories.UserRepository;
import com.javatmp.demo.services.JpaUserDetailsService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Optional;

@SpringBootTest
@Slf4j
public class JpaTests {

    @Autowired
    JpaUserDetailsService jpaUserDetailsService;

    @Autowired
    private UserRepository userRepository;

    @Test
    public void select() {
        log.debug("before select all");
        List<User> all = userRepository.findAll();
        log.debug("all user in db is : {}", all);
        String user = "john";
        log.debug("before selecting user");
        Optional<User> userByUsername = userRepository.findByUsername(user);
        log.debug("userByUsername.isPresent :{}", userByUsername.isPresent());
        CustomUserDetails u = jpaUserDetailsService.loadUserByUsername(user);
        System.out.println("custom user is : " + u.getUser());
    }

}

