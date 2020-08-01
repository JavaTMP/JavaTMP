package com.javatmp.demo.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

@Configuration
@ConfigurationProperties(prefix="com.javatmp.config.custom")
@PropertySource("classpath:custom.properties")
@Component
@Data
public class TestConfigBean {
	private String name;
	private String description;
}
