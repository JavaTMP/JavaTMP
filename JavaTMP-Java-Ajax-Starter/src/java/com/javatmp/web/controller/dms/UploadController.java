package com.javatmp.web.controller.dms;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.domain.Document;
import com.javatmp.mvc.ClassTypeAdapter;
import com.javatmp.mvc.ResponseMessage;
import com.javatmp.service.DocumentService;
import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Paths;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

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
        ResponseMessage responseMessage = new ResponseMessage();
        List<Document> documentsUploaded = new LinkedList<>();
        ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        DocumentService ds = sf.getDocumentService();
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
                fileUploading.creationDate = new Date();
                long randomLongValue = Double.valueOf((Math.random() + 1) * 1000L).longValue();
                fileUploading.randomHash = fileUploading.documentName.hashCode() + randomLongValue;
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
                ds.createNewDocument(fileUploading);
                System.out.println("db fake id [" + fileUploading.documentId + "]");
                String t = "FileName 'requested' \"to\" Upload [" + fileName + "] type[" + contentType + "] name [" + fieldName + "]size[" + partSize + "]<br/>";
                System.out.println(t);
                text += t;

                Document uploaded = new Document();
                uploaded.documentId = fileUploading.documentId;
                uploaded.documentName = fileUploading.documentName;
                uploaded.randomHash = fileUploading.randomHash;
                uploaded.contentType = fileUploading.contentType;
                uploaded.documentSize = fileUploading.documentSize;
                uploaded.creationDate = fileUploading.creationDate;
                documentsUploaded.add(uploaded);
            }
            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage(text);
            responseMessage.setData(documentsUploaded);

        } catch (IllegalStateException e) {
            System.out.println("ERROR : " + e.getMessage());
            e.printStackTrace();
            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage(e.getMessage());
        }
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").serializeNulls()
                .registerTypeAdapter(Class.class, new ClassTypeAdapter())
                //                .registerTypeAdapter(Date.class, new DateTypeAdapter())
                .create();
        String json = gson.toJson(responseMessage);
        System.out.println("response [" + json + "]");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);

    }
}
