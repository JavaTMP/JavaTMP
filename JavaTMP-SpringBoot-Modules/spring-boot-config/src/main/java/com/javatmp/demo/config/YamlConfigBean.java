package com.javatmp.demo.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@ConfigurationProperties(prefix="com.javatmp.config.yaml")
@Data
@PropertySource(value = "classpath:custom.yml", factory = YamlPropertySourceFactory.class)
public class YamlConfigBean {
	private String name;
	private String description;
}
