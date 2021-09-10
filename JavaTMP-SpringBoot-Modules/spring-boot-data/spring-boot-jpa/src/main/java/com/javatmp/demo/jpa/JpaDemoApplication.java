package com.javatmp.demo.jpa;

import com.javatmp.demo.jpa.entity.Customer;
import com.javatmp.demo.jpa.entity.User;
import com.javatmp.demo.jpa.repository.AuthorityRepository;
import com.javatmp.demo.jpa.repository.CustomerRepository;
import com.javatmp.demo.jpa.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@Slf4j
@SpringBootApplication
public class JpaDemoApplication implements CommandLineRunner {

	public static void main(String args[]) {
		SpringApplication.run(JpaDemoApplication.class, args);
	}

	@Autowired
	CustomerRepository repository;

	@Autowired
	UserRepository userRepository;

	@Autowired
	AuthorityRepository authorityRepository;

	@Override
	public void run(String... strings) throws Exception {

		// save a few customers
		repository.save(new Customer(null,"Jack", "Bauer"));
		repository.save(new Customer(null,"Chloe", "O'Brian"));
		repository.save(new Customer(null,"Kim", "Bauer"));
		repository.save(new Customer(null,"David", "Palmer"));
		repository.save(new Customer(null,"Michelle", "Dessler"));

		// fetch all customers
		log.info("Customers found with findAll():");
		log.info("-------------------------------");
		for (Customer customer : repository.findAll()) {
			log.info(customer.toString());
		}
		log.info("");

		// fetch an individual customer by ID
		Customer customer = repository.findById(1L);
		log.info("Customer found with findById(1L):");
		log.info("--------------------------------");
		log.info(customer.toString());
		log.info("");

		// fetch customers by last name
		log.info("Customer found with findByLastName('Bauer'):");
		log.info("--------------------------------------------");
		repository.findByLastName("Bauer").forEach(bauer -> {
			log.info(bauer.toString());
		});
		// for (Customer bauer : repository.findByLastName("Bauer")) {
		//  log.info(bauer.toString());
		// }
		log.info("");

		log.info("cound of users is :{}", userRepository.count());

		userRepository.save(new User(null,"Michelle", "mmmm", 1, null));

		// fetch customers by last name
		log.info("Get all users:");
		log.info("--------------------------------------------");
		userRepository.findAll().forEach(user ->
				log.info("user is : {}", user));

	}
}
