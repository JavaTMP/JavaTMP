package com.javatmp.demo.authorization.method.permission.controllers;


import com.javatmp.demo.authorization.method.permission.model.Document;
import com.javatmp.demo.authorization.method.permission.services.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class DocumentController {

    @Autowired
    private DocumentService documentService;

    @GetMapping("/documents/{code}")
    public Document getDetails(@PathVariable String code) {
        return documentService.getDocument(code);
    }

    @GetMapping("/documentsCode/{code}")
    public Document getDocumentCode(@PathVariable String code) {
        return documentService.getDocumentCode(code);
    }

}
