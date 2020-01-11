/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.dms;

import com.javatmp.fw.domain.table.DataTableColumn;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.fw.domain.table.Search;
import com.javatmp.module.dms.entity.Document;
import com.javatmp.module.dms.service.DocumentService;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.LinkedList;
import java.util.List;
import javax.persistence.Persistence;

public class TestingDynamicSelectDocuments {

    public static void main(String[] args) throws SQLException, ParseException {
        DocumentService documentService = new DocumentService(Persistence.createEntityManagerFactory("AppPU"));

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
        DataTableResults<Document> dataTableResult = documentService.retrievePageRequestDetails(tableRequest);

        System.out.println(dataTableResult.getRecordsTotal());
        for (Document m : dataTableResult.getData()) {
            System.out.println((m));
        }

    }

}
