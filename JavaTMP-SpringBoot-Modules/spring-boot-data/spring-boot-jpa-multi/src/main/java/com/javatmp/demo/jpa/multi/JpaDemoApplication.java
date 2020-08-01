package com.javatmp.demo.jpa.multi;

import com.javatmp.demo.jpa.multi.repository.test1.UserTest1Repository;
import com.javatmp.demo.jpa.multi.repository.test2.UserTest2Repository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@Slf4j
@SpringBootApplication
public class JpaDemoApplication implements CommandLineRunner {

    @Autowired
    UserTest1Repository repository1;
    @Autowired
    UserTest2Repository repository2;

    public static void main(String[] args) {
        SpringApplication.run(JpaDemoApplication.class, args);
    }

    @Override
    public void run(String... strings) throws Exception {

        log.debug("all repository 1 user count : {}, ", repository1.count());
		log.debug("all repository 2 user count : {}, ", repository2.count());

    }
}
