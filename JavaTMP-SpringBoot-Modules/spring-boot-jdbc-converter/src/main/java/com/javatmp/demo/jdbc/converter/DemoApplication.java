package com.javatmp.demo.jdbc.converter;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jdbc.repository.config.EnableJdbcRepositories;
import org.springframework.jdbc.core.JdbcTemplate;

@SpringBootApplication
@Slf4j
@EnableJdbcRepositories
public class DemoApplication implements CommandLineRunner {

    @Autowired
    JdbcTemplate jdbcTemplate;
    @Autowired
    private UserRepository userRepository;

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

//    @Bean
//    DataSourceInitializer initializer(DataSource dataSource) {
//
//        DataSourceInitializer initializer = new DataSourceInitializer();
//        initializer.setDataSource(dataSource);
//
//        ClassPathResource script = new ClassPathResource("schema.sql");
//        ResourceDatabasePopulator populator = new ResourceDatabasePopulator(script);
////        initializer.setDatabasePopulator(populator);
//
//        return initializer;
//    }

    @Override
    public void run(String... strings) throws Exception {

        log.info("Creating tables");

//		jdbcTemplate.execute("create table user(\n" +
//				"  id bigint serial,\n" +
//				"  name varchar(50) not null\n" +
//				");");

        User user = new User(null, "Beeblebrox");
        User savedUser = userRepository.save(user);
        log.debug("saved user is : {}", savedUser);
        log.debug("find user by repository : {}", userRepository.findById(savedUser.getId()));

    }
}
