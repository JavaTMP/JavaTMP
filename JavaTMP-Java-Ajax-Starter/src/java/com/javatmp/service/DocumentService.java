/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.service;

import com.javatmp.domain.Document;
import java.util.List;

/**
 *
 * @author m_dar
 */
public class DocumentService {

    private DBFaker dBFaker;

    public DocumentService(DBFaker dBFaker) {
        this.dBFaker = dBFaker;
    }

    public List<Document> getAllDocuments() {
        return dBFaker.getDocuments();
    }

    public Document createNewDocument(Document document) {
        document.setDocumentId(DBFaker.getNextCounter());
        this.dBFaker.getDocuments().add(document);
        return document;
    }

    public Document readDocumentById(Document document) {
        for (Document doc : this.dBFaker.getDocuments()) {
            if (doc.getDocumentId().equals(document.getDocumentId())) {
                return doc;
            }
        }
        throw new IllegalArgumentException("document id [" + document.getDocumentId() + "] not found");
    }

}
