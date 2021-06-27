package com.javatmp.demo.config;

import com.javatmp.demo.password.PlainTextPasswordEncoder;
import com.javatmp.demo.password.Sha512PasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.DelegatingPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class WebAuthorizationConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    UserDetailsService userDetailsService;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    PlainTextPasswordEncoder plainTextPasswordEncoder;

    @Autowired
    Sha512PasswordEncoder sha512PasswordEncoder;

    @Autowired
    DelegatingPasswordEncoder delegatingPasswordEncoder;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth
                .userDetailsService(userDetailsService)
//                .passwordEncoder(passwordEncoder)
//                .passwordEncoder(plainTextPasswordEncoder)
                .passwordEncoder(sha512PasswordEncoder);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.httpBasic();
        http.authorizeRequests().anyRequest().authenticated();
    }
}
