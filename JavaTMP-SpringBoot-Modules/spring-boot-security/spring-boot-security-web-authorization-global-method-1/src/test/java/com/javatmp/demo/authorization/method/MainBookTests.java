package com.javatmp.demo.authorization.method;


import com.javatmp.demo.authorization.method.model.Employee;
import com.javatmp.demo.authorization.method.services.BookService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.test.context.support.WithMockUser;

import java.util.Arrays;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

@SpringBootTest
class MainBookTests {

    @Autowired
    private BookService bookService;

    @Test
    @DisplayName("When the method is called without a user, " +
            "it throws AuthenticationException")
    void testBookServiceWithNoUser() {
        assertThrows(AuthenticationException.class,
                () -> bookService.getBookDetails("emma"));
    }

    @Test
    @DisplayName("When the method is called with a user " +
            "but the returned object doesn't meet the authorization rules, " +
            "it should throw AccessDeniedException")
    @WithMockUser(username = "emma")
    void testBookServiceSearchingProtectedUser() {
        assertThrows(AccessDeniedException.class,
                () -> bookService.getBookDetails("natalie"));
    }

    @Test
    @DisplayName("When the method is called for a reader that doesn't have the reader role, " +
            "it should successfully return.")
    @WithMockUser(username = "natalie")
    void testNameServiceSearchingUnprotectedUser() {
        Employee result = bookService.getBookDetails("emma");

        Employee expected = new Employee("Emma Thompson",
                Arrays.asList("Karamazov Brothers"),
                Arrays.asList("accountant", "reader"));

        assertEquals(expected, result);
    }

}
