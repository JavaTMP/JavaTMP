package com.javatmp.demo.jpa;

import com.javatmp.demo.jpa.entity.primary.PrimaryMultiTable;
import com.javatmp.demo.jpa.entity.second.SecondMultiTable;
import com.javatmp.demo.jpa.repository.primary.PrimaryMultiTableRepository;
import com.javatmp.demo.jpa.repository.second.SecondMultiTableRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@Slf4j
public class SpringBootDemoMultiDatasourceJpaApplication implements CommandLineRunner {

    public static void main(String[] args) {
        SpringApplication.run(SpringBootDemoMultiDatasourceJpaApplication.class, args);
    }

    @Autowired
    PrimaryMultiTableRepository primaryMultiTableRepository;

    @Autowired
    SecondMultiTableRepository secondMultiTableRepository;

    @Override
    public void run(String... strings) throws Exception {

        for(long i = 1; i < 100; i++) {
            this.primaryMultiTableRepository.save(new PrimaryMultiTable(i, "name " + i));
        }

        for(long i = 1; i < 100; i++) {
            this.secondMultiTableRepository.save(new SecondMultiTable(i, "name " + i));
        }

        for (PrimaryMultiTable primaryMultiTable : primaryMultiTableRepository.findAll()) {
            log.info("primary table object : {}", primaryMultiTable);
        }

        secondMultiTableRepository.findAll().forEach(secondMultiTable -> {
            log.info("second table object : {}", secondMultiTable);
        });

    }

}

