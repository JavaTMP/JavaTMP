package com.javatmp.module.dms.controller;

import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.module.dms.entity.Document;
import com.javatmp.module.dms.service.DocumentService;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
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
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Slf4j
@Controller
public class ViewUploadedFileController {

    @RequestMapping(value = "/ViewUploadedFileController", method = RequestMethod.GET)
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {

        try {
            ServletContext context = request.getServletContext();
            ServicesFactory sf = (ServicesFactory) context.getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
            DocumentService ds = sf.getDocumentService();

            Document temp = new Document();

            MvcHelper.populateBeanByRequestParameters(request, temp);
            log.info("Requested Document [" + MvcHelper.deepToString(temp) + "]");
            String viewTypeTemp = request.getParameter("viewType");
            Document document = ds.getOne(temp.getDocumentId());

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
            log.error(ex.getMessage(), ex);
            throw new Exception(ex);
        } catch (InvocationTargetException ex) {
            log.error(ex.getMessage(), ex);
            throw new Exception(ex);
        }
    }
}
