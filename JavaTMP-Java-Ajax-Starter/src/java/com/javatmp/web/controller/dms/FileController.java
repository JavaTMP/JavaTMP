package com.javatmp.web.controller.dms;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.logging.Logger;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FileController/*")
public class FileController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // if you want to use a relative path to context root:
        String folderBase = getServletContext().getRealPath("");
        logger.info("relativePath = " + folderBase);

        // Get requested file by path info.
        String requestedFile = request.getPathInfo();
        logger.info("Requested File [" + requestedFile + "]");
        File downloadFile = new File(folderBase, requestedFile);
        FileInputStream inStream = new FileInputStream(downloadFile);
        // obtains ServletContext
        ServletContext context = getServletContext();
        // gets MIME type of the file
        String mimeType = context.getMimeType(requestedFile);
        if (mimeType == null) {
            // set to binary type if MIME mapping not found
            mimeType = "application/octet-stream";
        }

        logger.info("MIME type: " + mimeType);
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
