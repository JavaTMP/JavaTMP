package com.javatmp.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;

@Configuration
public class ProjectConfig extends WebSecurityConfigurerAdapter {


    @Override
    @Bean
    public UserDetailsService userDetailsService() {
        InMemoryUserDetailsManager manager = new InMemoryUserDetailsManager();

        UserDetails user1 = User.withUsername("john")
                .password("12345")
                .roles("ADMIN")
                .authorities("read")
                .build();

        UserDetails user2 = User.withUsername("jane")
                .password("12345")
                .roles("MANAGER")
                .authorities("read", "premium")
                .build();

        manager.createUser(user1);
        manager.createUser(user2);

        return manager;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return NoOpPasswordEncoder.getInstance();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.httpBasic();

        http.authorizeRequests()
                .mvcMatchers("/hello").hasRole("ADMIN")
                .mvcMatchers("/ciao").hasRole("MANAGER")
//                .anyRequest().permitAll();
                //.anyRequest().denyAll();
                //.anyRequest().authenticated();
        ;

        http.authorizeRequests()
                .mvcMatchers(HttpMethod.GET, "/a").authenticated()
                .mvcMatchers(HttpMethod.POST, "/a").permitAll();

        // the ** operator refers to any number of pathnames.
        // '/a/**/c' would not only match /a/b/c
        // but also /a/b/d/c and a/b/c/d/e/c and so on.

        // If you only want to match one pathname, then you can use a single *.
        // For example, a/*/c would match a/b/c and a/d/c but not a/b/d/c.
        http.authorizeRequests()
                .mvcMatchers( "/a/b/**").authenticated();

        http.authorizeRequests()
                .mvcMatchers( "/product/{code:^[0-9]*$}").permitAll();

        http.authorizeRequests()
                .mvcMatchers( "/hello").authenticated();
        //.antMatchers( "/hello").authenticated();

        http.authorizeRequests()
                .regexMatchers(".*/(us|uk|ca)+/(en|fr).*")
                .authenticated()
                .anyRequest().hasAuthority("premium");

        http.authorizeRequests()
                .mvcMatchers("/email/{email:.*(.+@.+\\.com)}")
                .permitAll();


        http.authorizeRequests().anyRequest().denyAll();
        http.csrf().disable();

    }

}
