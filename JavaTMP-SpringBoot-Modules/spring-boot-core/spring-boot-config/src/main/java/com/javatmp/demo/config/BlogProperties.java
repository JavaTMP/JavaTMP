package com.javatmp.demo.config;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
@Data
public class BlogProperties {

	@Value("${com.javatmp.config.name}")
	private String name;

	@Value("${com.javatmp.config.title}")
	private String title;

}
