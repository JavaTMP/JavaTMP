package com.javatmp.service;

import com.javatmp.db.JpaDaoHelper;
import com.javatmp.domain.Document;
import com.javatmp.domain.User;
import java.util.List;

public class DocumentService {

    private DBFaker dBFaker;
    private final JpaDaoHelper jpaDaoHelper;

    public DocumentService(DBFaker dBFaker, JpaDaoHelper jpaDaoHelper) {
        this.dBFaker = dBFaker;
        this.jpaDaoHelper = jpaDaoHelper;
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
        return this.jpaDaoHelper.read(Document.class, document.getDocumentId());
    }
}
