package com.javatmp.service;

import com.javatmp.domain.Document;
import java.util.List;

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
