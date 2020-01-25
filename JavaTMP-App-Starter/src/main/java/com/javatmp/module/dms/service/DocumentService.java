package com.javatmp.module.dms.service;

import com.javatmp.fw.data.jpa.repository.ExtendedJpaRepository;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.module.dms.entity.Document;
import java.text.ParseException;
import javax.persistence.EntityManager;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.jpa.repository.support.JpaEntityInformation;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class DocumentService extends ExtendedJpaRepository<Document, Long> {

    private EntityManager em;

    public DocumentService(JpaEntityInformation<Document, Long> entityInformation, EntityManager entityManager) {
        super(entityInformation, entityManager);
        this.em = entityManager;
    }

    public DataTableResults<Document> getAllDocuments(DataTableRequest<Document> page) throws ParseException {

        page.setClassType(Document.class);
        page.setSelects(new String[]{"documentId", "documentName", "documentSize",
            "contentType", "creationDate", "randomHash", "documentType", "parentDocumentId", "status", "createdByUserId"});
        DataTableResults<Document> results = this.retrievePageRequestDetails(page);
        return results;
    }
}
