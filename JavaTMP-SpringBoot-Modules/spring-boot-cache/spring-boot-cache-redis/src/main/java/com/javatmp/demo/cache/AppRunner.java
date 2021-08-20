package com.javatmp.demo.cache;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class AppRunner implements CommandLineRunner {

	@Autowired
	private OrganizationRedisRepository organizationRedisRepository;

	@Override
	public void run(String... args) throws Exception {
		log.info("find by id org1 --> {}", organizationRedisRepository.findById("org1").orElse(null));
		Organization organization = new Organization("org1",
				"Organization One", "admin", "support@javatmp.com", null);
		organizationRedisRepository.save(organization);
		log.info("After save find by id org1 --> {}", organizationRedisRepository.findById("org1").orElse(null));

	}

}
