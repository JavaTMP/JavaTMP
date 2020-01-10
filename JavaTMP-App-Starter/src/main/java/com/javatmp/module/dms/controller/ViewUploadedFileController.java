package com.javatmp.module.dms.controller;

import com.javatmp.module.dms.entity.Document;
import com.javatmp.module.dms.service.DocumentService;
import java.io.OutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class ViewUploadedFileController {

    @Autowired
    DocumentService documentService;

    @GetMapping("/ViewUploadedFileController")
    protected void doGet(Document temp, HttpServletRequest request, HttpServletResponse response) throws Exception {

        log.info("Requested Document [" + (temp) + "]");
        String viewTypeTemp = request.getParameter("viewType");
        Document document = this.documentService.getOne(temp.getDocumentId());

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

    }
}
