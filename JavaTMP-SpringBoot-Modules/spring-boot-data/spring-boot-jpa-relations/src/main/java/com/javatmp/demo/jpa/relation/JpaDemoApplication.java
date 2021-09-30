package com.javatmp.demo.jpa.relation;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@SpringBootApplication
public class JpaDemoApplication implements CommandLineRunner {

	public static void main(String args[]) {
		SpringApplication.run(JpaDemoApplication.class, args);
	}

	@Override
	@Transactional
	public void run(String... strings) throws Exception {

	}
}
