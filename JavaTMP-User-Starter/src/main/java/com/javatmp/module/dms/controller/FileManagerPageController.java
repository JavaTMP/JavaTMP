package com.javatmp.module.dms.controller;

import com.javatmp.module.dms.service.DocumentService;
import com.javatmp.module.dms.entity.Document;
import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
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

@WebServlet("/dms/FileManagerPageController")
public class FileManagerPageController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
            DocumentService ds = sf.getDocumentService();

            DataTableRequest tableRequest = (DataTableRequest) MvcHelper.readObjectFromRequest(request, DataTableRequest.class);
            logger.info("request Page for file manager is [" + MvcHelper.deepToString(tableRequest) + "]");
            DataTableResults<Document> documents = ds.getAllDocuments(tableRequest);

            ResponseMessage message = new ResponseMessage();
            message.setOverAllStatus(true);
            message.setMessage("All Available File Documents on the Server");
            message.setData(documents);

            MvcHelper.sendMessageAsJson(response, message);
        } catch (ParseException ex) {
            Logger.getLogger(FileManagerPageController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
