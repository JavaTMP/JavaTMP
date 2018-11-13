package com.javatmp.module.dms;

import com.javatmp.db.JpaDaoHelper;

public class DocumentService {

    private final JpaDaoHelper jpaDaoHelper;

    public DocumentService(JpaDaoHelper jpaDaoHelper) {
        this.jpaDaoHelper = jpaDaoHelper;
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
}
