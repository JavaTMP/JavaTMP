package com.javatmp.web.controller.dms;

import com.javatmp.domain.Document;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.service.DocumentService;
import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/dms/FileManagerPageController")
public class FileManagerPageController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        DocumentService ds = sf.getDocumentService();
        List<Document> documents = ds.getAllDocuments();

        ResponseMessage message = new ResponseMessage();
        message.setOverAllStatus(true);
        message.setMessage("All Available File Documents on the Server");
        message.setData(documents);

        MvcHelper.sendMessageAsJson(response, message);

    }
}
