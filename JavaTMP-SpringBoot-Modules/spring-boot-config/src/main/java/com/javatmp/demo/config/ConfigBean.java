package com.javatmp.demo.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties(prefix="com.javatmp.config")
@Data
public class ConfigBean {
	private String name;
	private String title;
	private String notFound;
}
