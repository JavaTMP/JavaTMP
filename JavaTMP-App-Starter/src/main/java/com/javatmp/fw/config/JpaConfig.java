package com.javatmp.fw.config;

import com.javatmp.fw.data.jpa.repository.ExtendedJpaRepositoryImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@Slf4j
@Configuration
@EnableJpaRepositories(repositoryBaseClass = ExtendedJpaRepositoryImpl.class)
public class JpaConfig {
}
