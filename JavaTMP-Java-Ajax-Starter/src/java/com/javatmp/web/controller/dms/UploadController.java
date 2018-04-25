package com.javatmp.web.controller.dms;

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
@MultipartConfig(location = "", fileSizeThreshold = 1024 * 1024,
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
        String text = "";
        for (Part filePart : request.getParts()) {
            String name = filePart.getName();
            long partSize = filePart.getSize();
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
            String contentType = filePart.getContentType();
            InputStream fileContent = filePart.getInputStream();
            String t = "FileName requested to Upload [" + fileName + "] type[" + contentType + "] name [" + name + "]size[" + partSize + "]";
            System.out.println(t);
            text += t;
        }
        response.getWriter().print(text);

    }
}
