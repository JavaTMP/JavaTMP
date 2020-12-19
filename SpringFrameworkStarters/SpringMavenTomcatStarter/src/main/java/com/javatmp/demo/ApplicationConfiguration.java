package com.javatmp.demo;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;

@Data
@Configuration
@PropertySource("classpath:application.properties")
public class ApplicationConfiguration {
    @Value("${db.driverClassName}")
    private String dbDriverClass;
    @Value("${db.url}")
    private String dbUrl;
    @Value("${db.username}")
    private String dbUser;
    @Value("${db.password}")
    private String dbPwd;

    //register PropertySourcesPlaceholderConfigurer
    //in order to resolve ${...} placeholders
    @Bean
    public static PropertySourcesPlaceholderConfigurer propertyConfigInDev() {
        return new PropertySourcesPlaceholderConfigurer();
    }
}

