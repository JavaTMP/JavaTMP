package com.javatmp.web.controller.dms;

import com.javatmp.domain.Document;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.service.DocumentService;
import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.nio.file.Paths;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/UploadController")
@MultipartConfig(fileSizeThreshold = 1024 * 15, maxFileSize = 1024 * 50, maxRequestSize = 1024 * 100)
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
        OutputStreamWriter isr = new OutputStreamWriter(new FileOutputStream("m.txt"));
        System.out.println("encoding is [" + isr.getEncoding() + "]");
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
                fileUploading.setContentType(contentType);
                fileUploading.setDocumentName(fileName);
                fileUploading.setDocumentSize(partSize);
                fileUploading.setCreationDate(new Date());
                long randomLongValue = Double.valueOf((Math.random() + 1) * 1000L).longValue();
                fileUploading.setRandomHash((Long) Math.abs(fileUploading.getDocumentName().hashCode() + randomLongValue));
                // the following block is intended for simple cases
                // where it is convenient to read all bytes into a byte array.
                // It is not intended for reading input streams with large amounts of data.
                int nRead;
                byte[] data = new byte[4 * 1024];
                ByteArrayOutputStream buffer = new ByteArrayOutputStream();
                while ((nRead = fileContentStream.read(data, 0, data.length)) != -1) {
                    buffer.write(data, 0, nRead);
                }

                fileUploading.setDocumentContent(buffer.toByteArray());
                System.out.println("original size [" + fileUploading.getDocumentSize()
                        + "] stream size [" + fileUploading.getDocumentContent().length + "]");
                ds.createNewDocument(fileUploading);
                System.out.println("db fake id [" + fileUploading.getDocumentId() + "]");
                String t = "FileName 'requested' \"to\" Upload [" + fileName + "] type[" + contentType + "] name [" + fieldName + "]size[" + partSize + "]<br/>";
                System.out.println(t);
                text += t;

                Document uploaded = new Document();
                uploaded.setDocumentId(fileUploading.getDocumentId());
                uploaded.setDocumentName(fileUploading.getDocumentName());
                uploaded.setRandomHash(fileUploading.getRandomHash());
                uploaded.setContentType(fileUploading.getContentType());
                uploaded.setDocumentSize(fileUploading.getDocumentSize());
                uploaded.setCreationDate(fileUploading.getCreationDate());
                documentsUploaded.add(uploaded);
            }
            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage("Files Uploaded successfully");
            responseMessage.setData(documentsUploaded);

        } catch (IllegalStateException e) {
            System.out.println("ERROR : " + e.getMessage());
            e.printStackTrace();
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(e.getMessage());
            response.setStatus(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE);
            responseMessage.setStatusCode(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE);
        }
        MvcHelper.sendMessageAsJson(response, responseMessage);

    }
}
