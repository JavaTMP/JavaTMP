package com.javatmp.web.controller.dms;

import com.javatmp.domain.Document;
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

@WebServlet("/FileManagerPageController")
public class FileManagerPageController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Document> documentsUploaded = new LinkedList<>();
        ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        DocumentService ds = sf.getDocumentService();
        List<Document> documents = ds.getAllDocuments();
        request.setAttribute("documents", documents);
        request.getRequestDispatcher("/WEB-INF/pages/gallery/file-uploader-manager.jsp").forward(request, response);

    }
}
