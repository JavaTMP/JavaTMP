package com.javatmp.demo.jdbc.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.jdbc.core.JdbcTemplate;

import java.time.LocalDate;

@SpringBootApplication
@Slf4j
public class DemoApplication implements CommandLineRunner {

    @Autowired
    JdbcTemplate jdbcTemplate;
    @Autowired
    private UserRepository userRepository;

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }


    @Override
    public void run(String... strings) throws Exception {

        log.info("Creating tables");

//		jdbcTemplate.execute("create table user(\n" +
//				"  id bigint serial,\n" +
//				"  name varchar(50) not null\n" +
//				");");

        User user = new User(null, "Beeblebrox", LocalDate.now());
        log.debug("user to be saved is : {}", user);
        User savedUser = userRepository.save(user);
        log.debug("saved user is : {}", savedUser);
        log.debug("find user by repository : {}", userRepository.findById(savedUser.getId()));

    }
}
