package com.javatmp.demo.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.core.env.ConfigurableEnvironment;

/**
 * Spring Boot Main Runner Class
 */
@SpringBootApplication
@Slf4j
@EnableConfigurationProperties({TestConfigBean.class})
public class DemoApplication {

    @Autowired
    ConfigurableEnvironment env;
    @Autowired
    private BlogProperties blogProperties;
    @Autowired
    private ConfigBean configBean;
    @Autowired
    private TestConfigBean testConfigBean;
    @Autowired
    private YamlConfigBean yamlConfigBean;

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

    @Bean
    public CommandLineRunner springBootMain() throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");
            log.debug("blog properties : {}", blogProperties);
            log.debug("config bean : {}", configBean);
            log.debug("test config bean : {}", testConfigBean);
            log.debug("yamlConfigBean : {}", yamlConfigBean);
            env.getPropertySources().forEach(
                    ps -> {
                        log.debug("name : {}, class : {}, value : {}", ps.getName(), ps.getClass(), ps.getProperty(ps.getName()));
                    }
            );

        };
    }

}
