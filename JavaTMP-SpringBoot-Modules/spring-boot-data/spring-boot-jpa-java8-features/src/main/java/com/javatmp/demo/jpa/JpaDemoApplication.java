package com.javatmp.demo.jpa;

import com.github.javafaker.Faker;
import com.javatmp.demo.jpa.entity.Customer;
import com.javatmp.demo.jpa.repository.CustomerRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

import java.util.LinkedList;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.Future;
import java.util.stream.IntStream;
import java.util.stream.Stream;

@Slf4j
@SpringBootApplication
public class JpaDemoApplication implements CommandLineRunner {

    @Autowired
    CustomerRepository repository;

    public static void main(String[] args) {
        SpringApplication.run(JpaDemoApplication.class, args);
    }

    @Override
    @Transactional
    public void run(String... strings) throws Exception {

        Faker faker = new Faker();

        // save a few customers
        List<Customer> customerList = new LinkedList<>();
        IntStream.range(0, 10).forEach(i -> {
            customerList.add(new Customer(null, faker.name().firstName(), faker.name().lastName(), 0));
        });
        repository.saveAll(customerList);


        // fetch an individual customer by ID
        Optional<Customer> customer1 = repository.findById(1L);
        log.info("Customer found with findById(1L):");
        log.info("--------------------------------");
        log.info("customer by findById : {}", customer1);
        log.info("");

        Pageable page = PageRequest.of(10, 10);
        log.info("page is :{}", page);
        Page<Customer> customers = repository.findAll(page);
        for (Customer customer11 : customers) {
            log.info("customer from page is {}", customer11);
        }

        Future<Customer> completableFuture =
                repository.findOneById(1L);

        Customer come = completableFuture.get();
        log.info("customer from completeable futrue is : {}", come);

        Stream<Customer> customerStream = repository.selectForUpdateNative(0);
        Optional<Customer> optionalCustomer = customerStream.findFirst();
        optionalCustomer.ifPresent(customer -> {
            log.info("customer exists is {}", customer);
//            customer.setStatus(1);
            repository.updateCustomerStatus(customer.getId(),
                    customer.getStatus());
        });
        log.info("customer1 isPresent : {}", customer1.isPresent());

        customerStream.close();
    }
}
