package com.javatmp.demo.config;

import com.javatmp.demo.authentication.filters.InitialAuthenticationFilter;
import com.javatmp.demo.authentication.filters.JwtAuthenticationFilter;
import com.javatmp.demo.authentication.providers.OtpAuthenticationProvider;
import com.javatmp.demo.authentication.providers.UsernamePasswordAuthenticationProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;


@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private InitialAuthenticationFilter initialAuthenticationFilter;

    @Autowired
    private JwtAuthenticationFilter jwtAuthenticationFilter;

    @Autowired
    private OtpAuthenticationProvider otpAuthenticationProvider;

    @Autowired
    private UsernamePasswordAuthenticationProvider usernamePasswordAuthenticationProvider;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) {
        auth.authenticationProvider(otpAuthenticationProvider)
            .authenticationProvider(usernamePasswordAuthenticationProvider);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable();

        http.addFilterAt(
                initialAuthenticationFilter,
                BasicAuthenticationFilter.class)
            .addFilterAfter(
                jwtAuthenticationFilter,
                BasicAuthenticationFilter.class
            );

        http.authorizeRequests()
                .anyRequest().authenticated();
    }

    @Override
    @Bean
    protected AuthenticationManager authenticationManager() throws Exception {
        return super.authenticationManager();
    }
}
