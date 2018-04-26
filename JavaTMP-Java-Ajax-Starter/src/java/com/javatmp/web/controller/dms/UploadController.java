package com.javatmp.web.controller.dms;

import com.javatmp.domain.Document;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Paths;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/UploadController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024 * 50 * 5)
public class UploadController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        String description = request.getParameter("description"); // Retrieves <input type="text" name="description">
//        Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
//        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
//        String contentType = filePart.getContentType();
//        InputStream fileContent = filePart.getInputStream();
//        System.out.println("FileName requested to Upload [" + fileName + "] type[" + contentType + "]");
//        response.getWriter().print("UPLOAD DONE");
//
        String tmpDir = System.getProperty("java.io.tmpdir");
        System.out.println("tmpDir [" + tmpDir + "]");
        String text = "";
        try {
            for (Part filePart : request.getParts()) {
                String fieldName = filePart.getName();
                long partSize = filePart.getSize();
                System.out.println("partSize [" + partSize + "]");
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
                String contentType = filePart.getContentType();
                InputStream fileContentStream = filePart.getInputStream();
                Document fileUploading = new Document();
                fileUploading.contentType = contentType;
                fileUploading.documentName = fileName;
                fileUploading.documentSize = partSize;

                // the following block is intended for simple cases
                // where it is convenient to read all bytes into a byte array.
                // It is not intended for reading input streams with large amounts of data.
                int nRead;
                byte[] data = new byte[4 * 1024];
                ByteArrayOutputStream buffer = new ByteArrayOutputStream();
                while ((nRead = fileContentStream.read(data, 0, data.length)) != -1) {
                    buffer.write(data, 0, nRead);
                }

                fileUploading.documentContent = buffer.toByteArray();
                System.out.println("original size [" + fileUploading.documentSize
                        + "] stream size [" + fileUploading.documentContent.length + "]");

                String t = "FileName requested to Upload [" + fileName + "] type[" + contentType + "] name [" + fieldName + "]size[" + partSize + "]<br/>";
                System.out.println(t);
                text += t;
            }
            response.getWriter().print(text);

        } catch (IllegalStateException e) {
            System.out.println("ERROR : " + e.getMessage());
            e.printStackTrace();
            throw e;
        }
    }
}
