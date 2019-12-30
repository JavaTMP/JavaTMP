package com.javatmp.module.dms.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.module.dms.entity.Document;
import com.javatmp.module.dms.service.DocumentService;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/dms/UploadController")
@MultipartConfig(fileSizeThreshold = 1024 * 15, maxFileSize = 1024 * 50, maxRequestSize = 1024 * 100)
public class UploadController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        ResponseMessage responseMessage = new ResponseMessage();
        List<Document> documentsUploaded = new LinkedList<>();

        DocumentService ds = sf.getDocumentService();
        String tmpDir = System.getProperty("java.io.tmpdir");
        logger.info("tmpDir [" + tmpDir + "]");
        String text = "";
        try {
            for (Part filePart : request.getParts()) {
                String fieldName = filePart.getName();
                long partSize = filePart.getSize();
                logger.info("partSize [" + partSize + "]");
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
                String contentType = filePart.getContentType();
                InputStream fileContentStream = filePart.getInputStream();
                Document fileUploading = new Document();
                fileUploading.setContentType(contentType);
                fileUploading.setDocumentType((short) 1);
                fileUploading.setStatus((short) 1);
                fileUploading.setDocumentName(fileName);
                fileUploading.setDocumentSize(partSize);
                fileUploading.setCreationDate(new Date());
                long randomLongValue = Double.valueOf((Math.random() + 1) * 1000L).longValue();
                fileUploading.setRandomHash((Long) Math.abs(fileUploading.getDocumentName().hashCode() + randomLongValue));
                // the following block is intended for simple cases
                // where it is convenient to getOne all bytes into a byte array.
                // It is not intended for reading input streams with large amounts of data.
                int nRead;
                byte[] data = new byte[4 * 1024];
                ByteArrayOutputStream buffer = new ByteArrayOutputStream();
                while ((nRead = fileContentStream.read(data, 0, data.length)) != -1) {
                    buffer.write(data, 0, nRead);
                }

                fileUploading.setDocumentContent(buffer.toByteArray());
                logger.info("original size [" + fileUploading.getDocumentSize()
                        + "] stream size [" + fileUploading.getDocumentContent().length + "]");
                ds.save(fileUploading);
                logger.info("db fake id [" + fileUploading.getDocumentId() + "]");
                String t = "FileName 'requested' \"to\" Upload [" + fileName + "] type[" + contentType + "] name [" + fieldName + "]size[" + partSize + "]<br/>";
                logger.info(t);
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
            logger.info("ERROR : " + e.getMessage());
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage("The file to be uploaded exceeds its maximum permitted size of 51200 bytes");
            response.setStatus(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE);
            responseMessage.setStatusCode(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE);
        }
        MvcHelper.sendMessageAsJson(response, responseMessage);

    }
}
