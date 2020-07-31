package com.javatmp.demo.ws;

import com.blog.demo.service.AccountServiceEndpointService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

/**
 * Spring Boot Main Runner Class
 */
@SpringBootApplication
@Slf4j
public class WsDemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(WsDemoApplication.class, args);
    }

    @Bean
    public CommandLineRunner springBootMain() throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");
            AccountServiceEndpointService endpointService = new AccountServiceEndpointService();
//
//            AccountService service = endpointService.getAccountServiceEndpointPort();
//            AccountDetailsRequest request = new AccountDetailsRequest();
//            request.setAccountNumber("123");
//            AccountDetailsResponse response = service.getAccountDetails(request);
//            log.debug("response : {}", response);
//            PersonServiceImplService serviceImpl = new PersonServiceImplService();
//
//            PersonService ps = serviceImpl.getPersonServiceImplPort();
//
//            Person p1 = new Person(); p1.setName("JavaTMP"); p1.setId(1); p1.setAge(30);
//            Person p2 = new Person(); p2.setName("Bootstrap"); p2.setId(2); p2.setAge(25);
//
//            //add person
//            log.debug("Add Person Status : {}", ps.addPerson(p1));
//            log.debug("Add Person Status : {}", ps.addPerson(p2));
//
//            //get person
//            log.debug("get person : {}", ps.getPerson(1));
//
//            //get all persons
//            log.debug("get all persons : {}", Arrays.asList(ps.getAllPersons()));
//
//            //delete person
//            log.debug("Delete Person Status : {}", ps.deletePerson(2));
//
//            //get all persons
//            log.debug("get all persons : {}", Arrays.asList(ps.getAllPersons()));
        };
    }

}
