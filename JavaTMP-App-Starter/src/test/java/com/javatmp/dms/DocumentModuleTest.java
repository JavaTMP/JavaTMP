/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.dms;

import com.javatmp.module.dms.entity.Document;
import com.javatmp.module.dms.repository.DocumentRepository;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.web.server.LocalServerPort;

@Slf4j
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class DocumentModuleTest {

    @LocalServerPort
    int randomServerPort;

    @Autowired
    DocumentRepository documentRepository;

    @Autowired
    UserRepository userRepository;

    @Test
    void getOne() {
        log.info("Spring Boot app runnin on port : {}", randomServerPort);

        Long documentId = 1L;
        Integer randomHash = 395667298;
        String viewType = "inline";

        User user = this.userRepository.getOne(1L);
        log.debug("User name from db {}", user.getUserName());

        Document document = this.documentRepository.getOne(documentId);
        log.debug("document getOne finished");

        log.debug("document from db is null ? [" + (document == null) + "]");
        log.debug("document.id from db {}", document.getDocumentId());
    }

}
