package com.javatmp.module.dms.controller;

import com.javatmp.module.dms.entity.Document;
import com.javatmp.module.dms.service.DocumentService;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletContext;
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

    @Autowired
    ServletContext context;

    @GetMapping("/ViewUploadedFileController")
    protected void viewDocuemntController(Document temp, HttpServletRequest request, HttpServletResponse response) throws Exception {

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

    @GetMapping("/FileDownloader/**")
    protected void fileDownloader(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException, IOException {

        // Get requested file by path info.
        String requestedFile = request.getRequestURI();
        requestedFile = "static" + File.separator + requestedFile.substring("/FileDownloader/".length());
        log.debug("Requested File [" + requestedFile + "]");

        if (requestedFile.contains("..")) {
            // This is a security check
            throw new IllegalArgumentException("Cannot store file with relative path outside current directory " + requestedFile);
        }

        String folderBase = ClassLoader.getSystemClassLoader().getResource("").getPath();
        log.debug("relativePath = " + folderBase);

        File downloadFile = new File(folderBase, requestedFile);
        FileInputStream inStream = new FileInputStream(downloadFile);
        // obtains ServletContext
        // gets MIME type of the file
        String mimeType = context.getMimeType(requestedFile);
        if (mimeType == null) {
            // set to binary type if MIME mapping not found
            mimeType = "application/octet-stream";
        }

        log.debug("MIME type: " + mimeType);
        // modifies response
        response.setContentType(mimeType);
        response.setContentLength((int) downloadFile.length());
        // forces download
        String headerKey = "Content-Disposition";
        String headerValue = String.format("attachment; filename=\"%s\"", downloadFile.getName());
        response.setHeader(headerKey, headerValue);
//        response.setHeader("Content-Disposition", "inline; filename=\"" + file.getName() + "\"");
        // obtains response's output stream
        OutputStream outStream = response.getOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        while ((bytesRead = inStream.read(buffer)) != -1) {
            outStream.write(buffer, 0, bytesRead);
        }
        inStream.close();
        outStream.close();
    }
}
