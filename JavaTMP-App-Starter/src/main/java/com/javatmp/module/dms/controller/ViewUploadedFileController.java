package com.javatmp.module.dms.controller;

import com.javatmp.module.dms.entity.Document;
import com.javatmp.module.dms.repository.DocumentRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

@Slf4j
@Controller
public class ViewUploadedFileController {

    @Autowired
    DocumentRepository documentService;

    @Autowired
    ServletContext context;

    @GetMapping("/ViewUploadedFileController")
    protected @ResponseBody
    ResponseEntity<byte[]> getDocuemnt(@RequestParam("viewType") String viewTypeTemp, Document temp) throws Exception {

        log.info("Requested view type is : {} , Document {}", viewTypeTemp, temp);

        Document document = this.documentService.getOne(temp.getDocumentId());
        log.debug("document request from database is null ? {}", document == null);
        // for nano security check if provided hash equal db one:
        if (!document.getRandomHash().equals(temp.getRandomHash())) {
            throw new IllegalAccessException("illegal access by providing wrong hash value");
        }

        if (document.getContentType() == null) {
            // set to binary type if MIME mapping not found
            document.setContentType("application/octet-stream");
        }

        // forces download
        String headerKey = "Content-Disposition";
        String viewType = "attachment";
        if (viewTypeTemp != null && viewTypeTemp.equals("inline")) {
            viewType = "inline";
        }
        String headerValue = String.format("%s; filename=\"%s\"", viewType, document.getDocumentName());

        // modifies response
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.parseMediaType(document.getContentType()));
        headers.setContentLength(document.getDocumentSize());
        headers.setCacheControl(CacheControl.noCache().getHeaderValue());
        headers.setContentDisposition(ContentDisposition.parse(headerValue));

        ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(document.getDocumentContent(), headers, HttpStatus.OK);
        return responseEntity;
    }

    @GetMapping("/FileDownloader/**")
    protected void fileDownloader(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // Get requested file by path info.
        String requestedFile = request.getRequestURI();
        log.debug("original requestedFile [{}]", requestedFile);
        // Solve problem for context path not "/" : remove context path from request url:
        String contextPath = request.getContextPath();
        if (contextPath != null && contextPath.length() > 0) {
            requestedFile = requestedFile.substring(contextPath.length());
            log.debug("requestedFile after remove context path [{}]", requestedFile);
        }
        requestedFile = "static" + File.separator + requestedFile.substring("/FileDownloader/".length());
        log.debug("Requested File [" + requestedFile + "]");

        if (requestedFile.contains("..")) {
            // This is a security check
            throw new IllegalArgumentException("Cannot store file with relative path outside current directory " + requestedFile);
        }

        Resource requestFileResource = new ClassPathResource(requestedFile);
        log.debug("request file resource [" + requestFileResource + "]");
        log.debug("requestFileResource.exists [" + requestFileResource.exists() + "]");
        log.debug("requestFileResource.getFilename [" + requestFileResource.getFilename() + "]");

        InputStream is = requestFileResource.getInputStream();

        // gets MIME type of the file
        String mimeType = context.getMimeType(requestedFile);
        if (mimeType == null) {
            // set to binary type if MIME mapping not found
            mimeType = "application/octet-stream";
        }

        log.debug("MIME type: {} ", mimeType);
        // modifies response
        response.setContentType(mimeType);
        response.setContentLength((int) requestFileResource.contentLength());
        // forces download
        String headerKey = "Content-Disposition";
        String headerValue = String.format("attachment; filename=\"%s\"", requestFileResource.getFilename());
        response.setHeader(headerKey, headerValue);

        OutputStream outStream = response.getOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        while ((bytesRead = is.read(buffer)) != -1) {
            outStream.write(buffer, 0, bytesRead);
        }
        is.close();
//        outStream.close();
    }
}
