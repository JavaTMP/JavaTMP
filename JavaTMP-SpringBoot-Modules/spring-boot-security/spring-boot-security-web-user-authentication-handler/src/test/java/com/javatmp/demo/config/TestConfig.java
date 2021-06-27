package com.javatmp.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;

@Configuration
public class TestConfig {

    @Bean
    public UserDetailsService userDetailsService() {
        InMemoryUserDetailsManager service = new InMemoryUserDetailsManager();

        UserDetails u1 = User.withUsername("mary")
                .password("12345")
                .authorities("write")
                .build();

        UserDetails u2 = User.withUsername("bill")
                .password("12345")
                .authorities("read")
                .build();

        service.createUser(u1);
        service.createUser(u2);

        return service;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return NoOpPasswordEncoder.getInstance();
    }
}
