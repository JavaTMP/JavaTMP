package com.javatmp.module.dms.service;

import com.javatmp.fw.data.jpa.repository.JpaRepository;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.module.dms.entity.Document;
import java.text.ParseException;
import javax.persistence.EntityManagerFactory;

public class DocumentService extends JpaRepository<Document, Long> {

    public DocumentService(EntityManagerFactory emf) {
        super(Document.class, emf);
    }

    public DataTableResults<Document> getAllDocuments(DataTableRequest<Document> page) throws ParseException {

        page.setClassType(Document.class);
        page.setSelects(new String[]{"documentId", "documentName", "documentSize",
            "contentType", "creationDate", "randomHash", "documentType", "parentDocumentId", "status", "createdByUserId"});
        DataTableResults<Document> results = this.retrievePageRequestDetails(page);
        return results;
    }
}
