package com.javatmp.service;

import com.javatmp.domain.Document;
import com.javatmp.domain.User;
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

    public int updateDocument(Document document) {
        int updateStatus = 0;
        for (Document dbDoc : dBFaker.getDocuments()) {
            if (dbDoc.getDocumentId().equals(document.getDocumentId())) {
                dbDoc.setContentType(document.getContentType());
                dbDoc.setCreationDate(document.getCreationDate());
                dbDoc.setDocumentContent(document.getDocumentContent());
                dbDoc.setDocumentName(document.getDocumentName());
                dbDoc.setDocumentSize(document.getDocumentSize());
                dbDoc.setRandomHash(document.getRandomHash());
                updateStatus = 1;
                break;
            }
        }
        return updateStatus;
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
