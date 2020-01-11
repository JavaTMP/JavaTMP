package com.javatmp.module.dms.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class FileDownloader {

    @Autowired
    ServletContext context;

    @GetMapping("/FileDownloader/**")
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
