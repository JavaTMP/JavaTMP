package com.javatmp.demo.authorization.method.permission.services;

import com.javatmp.demo.authorization.method.permission.model.Document;
import com.javatmp.demo.authorization.method.permission.repositories.DocumentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

@Service
public class DocumentService {

    @Autowired
    private DocumentRepository documentRepository;

    @PostAuthorize("hasPermission(returnObject, 'ROLE_admin')")
    public Document getDocument(String code) {
        return documentRepository.findDocument(code);
    }


    @PreAuthorize("hasPermission(#code, 'document', 'ROLE_admin')")
    public Document getDocumentCode(String code) {
        return documentRepository.findDocument(code);
    }
}
