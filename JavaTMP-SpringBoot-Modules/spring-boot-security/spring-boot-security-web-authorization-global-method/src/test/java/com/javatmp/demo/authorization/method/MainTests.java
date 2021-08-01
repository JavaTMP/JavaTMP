package com.javatmp.demo.authorization.method;

import com.javatmp.demo.authorization.method.services.NameService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.test.context.support.WithMockUser;

import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

@SpringBootTest
class MainTests {

    @Autowired
    private NameService nameService;

    @Test
    @DisplayName("When the method is called without an authenticated user, " +
            "it throws AuthenticationException")
    void testNameServiceWithNoUser() {
        assertThrows(AuthenticationException.class,
                () -> nameService.getName());
    }

    @Test
    @WithMockUser(authorities = "read")
    @DisplayName("When the method is called with an authenticated user having a wrong authority, " +
            "it throws AccessDeniedException")
    void testNameServiceWithUserButWrongAuthority() {
        assertThrows(AccessDeniedException.class,
                () -> nameService.getName());
    }

    @Test
    @WithMockUser(authorities = "write")
    @DisplayName("When the method is called with an authenticated user having a correct authority, " +
            "it returns the expected result")
    void testNameServiceWithUserButCorrectAuthority() {
        String result = nameService.getName();

        assertEquals("Fantastico", result);
    }

    @Test
    @DisplayName("When the method is called with a different username parameter than the authenticated user, " +
            "it should throw AccessDeniedException.")
    @WithMockUser(username = "bill")
    void testNameServiceCallingTheSecretNamesMethodWithDifferentUser() {
        assertThrows(AccessDeniedException.class,
                () -> nameService.getSecretNames("emma"));
    }

    @Test
    @DisplayName("When the method is called for the authenticated user, " +
            "it should return the expected result.")
    @WithMockUser(username = "emma")
    void testNameServiceCallingTheSecretNamesMethodWithAuthenticatedUser() {
        List<String> result = nameService.getSecretNames("emma");

        assertEquals(Arrays.asList("Fantastico"), result);
    }

}
