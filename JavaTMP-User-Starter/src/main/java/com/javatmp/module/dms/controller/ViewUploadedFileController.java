package com.javatmp.module.dms.controller;

import com.javatmp.module.dms.service.DocumentService;
import com.javatmp.module.dms.entity.Document;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.util.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewUploadedFileController")
public class ViewUploadedFileController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            ServletContext context = request.getServletContext();
            ServicesFactory sf = (ServicesFactory) context.getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
            DocumentService ds = sf.getDocumentService();

            Document temp = new Document();

            MvcHelper.populateBeanByRequestParameters(request, temp);
            logger.info("Requested Document [" + MvcHelper.deepToString(temp) + "]");
            String viewTypeTemp = request.getParameter("viewType");
            Document document = ds.readDocumentById(temp);

            // for nano security check if provided hash equal db one:
            if (!document.getRandomHash().equals(temp.getRandomHash())) {
                throw new IllegalAccessException("illegal access by providing wrong hash value");
            }

            if (document.getContentType() == null) {
                // set to binary type if MIME mapping not found
                document.setContentType("application/octet-stream");
            }

            // modifies response
            response.setContentType(document.getContentType());
            response.setContentLength((int) document.getDocumentSize());
            // forces download
            String headerKey = "Content-Disposition";
            String viewType = "attachment";
            if (viewTypeTemp != null && viewTypeTemp.equals("inline")) {
                viewType = "inline";
            }
            String headerValue = String.format("%s; filename=\"%s\"", viewType, document.getDocumentName());
            response.setHeader(headerKey, headerValue);
//        response.setHeader("Content-Disposition", "inline; filename=\"" + file.getName() + "\"");
// obtains response's output stream
            OutputStream outStream = response.getOutputStream();
            outStream.write(document.getDocumentContent());
        } catch (IllegalAccessException ex) {
            logger.log(Level.SEVERE, ex.getMessage(), ex);
            throw new ServletException(ex);
        } catch (InvocationTargetException ex) {
            Logger.getLogger(ViewUploadedFileController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
