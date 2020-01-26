package com.javatmp.module.dms.service;

import com.javatmp.fw.domain.table.DataTableColumn;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.fw.domain.table.Search;
import com.javatmp.module.dms.entity.Document;
import com.javatmp.module.dms.repository.DocumentRepository;
import java.text.ParseException;
import java.util.LinkedList;
import java.util.List;
import javax.persistence.EntityManager;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class DocumentService {

    private EntityManager em;
    private DocumentRepository documentRepository;

    public DocumentService(EntityManager entityManager, DocumentRepository documentRepository) {
        this.em = entityManager;
        this.documentRepository = documentRepository;
    }

    public DataTableResults<Document> getAllDocuments(DataTableRequest<Document> page) throws ParseException {

        page.setClassType(Document.class);
        page.setSelects(new String[]{"documentId", "documentName", "documentSize",
            "contentType", "creationDate", "randomHash", "documentType", "parentDocumentId", "status", "createdByUserId"});
        DataTableResults<Document> results = this.documentRepository.retrievePageRequestDetails(page);
        return results;
    }

    public DataTableResults<Document> retrieveFoldersDocument() throws ParseException {
        DataTableRequest<Document> tableRequest = new DataTableRequest<>();

        tableRequest.setStart(0);
        tableRequest.setLength(Integer.MAX_VALUE);

        tableRequest.setSelects(new String[]{"documentId", "documentName", "documentSize", "contentType", "creationDate",
            "randomHash", "documentType", "parentDocumentId", "status", "createdByUserId"});
        tableRequest.setClassType(Document.class);
        DataTableColumn column = new DataTableColumn(0, "documentType");
        column.setSearch(new Search("2", null));
        List<DataTableColumn> columns = new LinkedList<>();

        columns.add(column);

        tableRequest.setColumns(columns);

        DataTableResults<Document> dataTableResult = this.documentRepository.retrievePageRequestDetails(tableRequest);

        return dataTableResult;
    }

    public Document save(Document fileUploading) {
        return this.documentRepository.save(fileUploading);
    }

    public Document getOne(Long documentId) {
        return this.documentRepository.getOne(documentId);
    }
}
