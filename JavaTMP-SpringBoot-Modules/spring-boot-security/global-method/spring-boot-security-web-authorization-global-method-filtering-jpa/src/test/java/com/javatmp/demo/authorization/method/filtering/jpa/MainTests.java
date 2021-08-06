package com.javatmp.demo.authorization.method.filtering.jpa;


import com.javatmp.demo.authorization.method.filtering.jpa.entities.Product;
import com.javatmp.demo.authorization.method.filtering.jpa.repositories.ProductRepository;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceTransactionManagerAutoConfiguration;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.test.context.support.WithMockUser;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

@SpringBootTest
@EnableAutoConfiguration(
        exclude = {DataSourceAutoConfiguration.class,
                DataSourceTransactionManagerAutoConfiguration.class,
                HibernateJpaAutoConfiguration.class})
class MainTests {

    @MockBean
    private ProductRepository productRepository;

    @Test
    @DisplayName("When the method is called without a user, " +
            "it returns nothing")
    void testProductServiceWithNoUser() {
        List<Product> result = productRepository
                .findProductByNameContains("c");

        assertTrue(result.isEmpty());
    }

    @Test
    @DisplayName("When the method is called with an authenticated user, " +
            "it only returns products for the authenticated user")
    @WithMockUser(username = "julien")
    void testProductServiceWithUser() {
        List<Product> result = productRepository.findProductByNameContains("c");

        result.forEach(p -> {
            assertEquals("julien", p.getOwner());
            assertTrue(p.getName().contains("c"));
        });
    }
}
