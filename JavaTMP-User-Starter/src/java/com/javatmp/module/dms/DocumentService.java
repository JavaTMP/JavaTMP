package com.javatmp.module.dms;

import com.javatmp.module.event.DBFaker;
import com.javatmp.util.JpaDaoHelper;
import java.util.List;

public class DocumentService {

    private final JpaDaoHelper jpaDaoHelper;
    private DBFaker dBFaker;

    public DocumentService(DBFaker dBFaker, JpaDaoHelper jpaDaoHelper) {
        this.jpaDaoHelper = jpaDaoHelper;
        this.dBFaker = dBFaker;
    }

    public int updateDocument(Document document) {
        int updateStatus = 0;
//        for (Document dbDoc : dBFaker.getDocuments()) {
//            if (dbDoc.getDocumentId().equals(document.getDocumentId())) {
//                dbDoc.setContentType(document.getContentType());
//                dbDoc.setCreationDate(document.getCreationDate());
//                dbDoc.setDocumentContent(document.getDocumentContent());
//                dbDoc.setDocumentName(document.getDocumentName());
//                dbDoc.setDocumentSize(document.getDocumentSize());
//                dbDoc.setRandomHash(document.getRandomHash());
//                updateStatus = 1;
//                break;
//            }
//        }
        return updateStatus;
    }

    public Document readDocumentById(Document document) {
        return this.jpaDaoHelper.read(Document.class, document.getDocumentId());
    }

    public Document createNewDocument(Document document) {
        document.setDocumentId(DBFaker.getNextCounter());
        this.dBFaker.getDocuments().add(document);
        return document;
    }

    public List<Document> getAllDocuments() {
        return dBFaker.getDocuments();
    }

    public Document readTempDocumentById(Document document) {
        for (Document doc : this.dBFaker.getDocuments()) {
            if (doc.getDocumentId().equals(document.getDocumentId())) {
                return doc;
            }
        }
        throw new IllegalArgumentException("document id [" + document.getDocumentId() + "] not found");
    }

}
