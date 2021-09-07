package com.javatmp.demo.jdbc.config;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.jdbc.DataSourceTransactionManagerAutoConfiguration;
import org.springframework.boot.test.autoconfigure.data.jdbc.DataJdbcTest;
import org.springframework.context.annotation.Import;

import java.time.LocalDate;

import static org.assertj.core.api.Assertions.assertThat;

@DataJdbcTest(excludeAutoConfiguration = {DataSourceTransactionManagerAutoConfiguration.class})
@Slf4j
//@SpringBootTest
@Import(JdbcConfig.class)
class UserRepositoryTest {

    @Autowired
    private UserRepository userRepository;

    @Test
    void saveUser() {
        User user = new User(null, "Beeblebrox", LocalDate.now());
        User savedUser = userRepository.save(user);
        assertThat(userRepository.findById(savedUser.getId())).isNotNull();
    }

}