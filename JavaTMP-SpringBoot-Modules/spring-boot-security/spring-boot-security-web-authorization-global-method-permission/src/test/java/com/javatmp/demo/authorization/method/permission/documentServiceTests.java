package com.javatmp.demo.authorization.method.permission;


import com.javatmp.demo.authorization.method.permission.model.Document;
import com.javatmp.demo.authorization.method.permission.services.DocumentService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.test.context.support.WithMockUser;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

@SpringBootTest
public class documentServiceTests {

    @Autowired
    private DocumentService documentService;

    @Test
    @DisplayName("When the method is called without a user, " +
            "it throws AuthenticationException")
    void testDocumentServiceWithNoUser() {
        assertThrows(AuthenticationException.class,
                () -> documentService.getDocumentCode("abc123"));
    }

    @Test
    @DisplayName("When the method is called with a user having role MANAGER " +
            "and the document doesn't belong to the caller," +
            "it should throw AccessDeniedException")
    @WithMockUser(username = "emma", roles = "manager")
    void testDocumentServiceWithManagerRole() {
        assertThrows(AccessDeniedException.class,
                () -> documentService.getDocumentCode("abc123"));
    }

    @Test
    @DisplayName("When the method is called with a user having role MANAGER " +
            "and the document belongs to the caller," +
            "it should return the document details")
    @WithMockUser(username = "emma", roles = "manager")
    void testDocumentServiceWithManagerRoleForOwnUserDocument() {
        Document result = documentService.getDocumentCode("asd555");
        Document expected = new Document("emma");

        assertEquals(expected, result);
    }

    @Test
    @DisplayName("When the method is called with a user having role ADMIN, " +
            "it should return the document details")
    @WithMockUser(username = "natalie", roles = "admin")
    void testDocumentServiceWithAdminRole() {
        Document result = documentService.getDocumentCode("asd555");
        Document expected = new Document("emma");

        assertEquals(expected, result);
    }
}
