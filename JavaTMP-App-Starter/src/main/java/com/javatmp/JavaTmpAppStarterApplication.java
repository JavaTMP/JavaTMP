package com.javatmp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories("com.javatmp")
public class JavaTmpAppStarterApplication {

    public static void main(String[] args) {
        SpringApplication.run(JavaTmpAppStarterApplication.class, args);
    }

}
