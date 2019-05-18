package com.javatmp.module.dms;

import com.javatmp.mvc.domain.table.DataTableRequest;
import com.javatmp.mvc.domain.table.DataTableResults;
import com.javatmp.util.JpaDaoHelper;
import java.text.ParseException;
import java.util.List;

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

    public Document createNewDocument(Document document) {
        return this.jpaDaoHelper.create(document);
    }

    public DataTableResults<Document> getAllDocuments(DataTableRequest<Document> page) throws ParseException {

        page.setClassType(Document.class);
        page.setSelects(new String[]{"documentId", "documentName", "documentSize",
            "contentType", "creationDate", "randomHash", "documentType", "parentDocumentId", "status", "createdByUserId"});
        DataTableResults<Document> results = jpaDaoHelper.retrievePageRequestDetails(page);
        return results;
    }
}
