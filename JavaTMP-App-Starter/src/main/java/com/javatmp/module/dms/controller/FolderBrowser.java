package com.javatmp.module.dms.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.domain.table.DataTableColumn;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.fw.domain.table.Search;
import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.module.dms.entity.Document;
import com.javatmp.module.dms.service.DocumentService;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.io.IOException;
import java.text.ParseException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/dms/FolderBrowser")
public class FolderBrowser extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        DocumentService documentService = sf.getDocumentService();

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
        DataTableResults<Document> dataTableResult;
        try {
            dataTableResult = documentService.retrievePageRequestDetails(tableRequest);
            ResponseMessage responseMessage = new ResponseMessage();
            responseMessage.setOverAllStatus(true);
            responseMessage.setData(dataTableResult);
            MvcHelper.sendMessageAsJson(response, responseMessage);

        } catch (ParseException ex) {
            logger.log(Level.SEVERE, null, ex);
            throw new ServletException(ex);
        }
    }

}
