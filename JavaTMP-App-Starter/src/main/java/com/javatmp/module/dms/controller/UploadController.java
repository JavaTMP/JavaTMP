package com.javatmp.module.dms.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.module.dms.entity.Document;
import com.javatmp.module.dms.service.DocumentService;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@WebServlet("/dms/UploadController")

@Slf4j
@Controller
public class UploadController {

    @Autowired
    DocumentService documentService;

    @PostMapping("/dms/UploadController")
    public @ResponseBody
    ResponseMessage doPost(@RequestBody MultipartFile[] files) throws IOException {
        ResponseMessage responseMessage = new ResponseMessage();
        List<Document> documentsUploaded = new LinkedList<>();
        String text = "";
        for (MultipartFile filePart : files) {
            String fieldName = filePart.getName();
            long partSize = filePart.getSize();
            log.info("partSize [" + partSize + "]");
            String fileName = filePart.getOriginalFilename();
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
            log.info("original size [" + fileUploading.getDocumentSize()
                    + "] stream size [" + fileUploading.getDocumentContent().length + "]");
            this.documentService.save(fileUploading);
            log.info("db fake id [" + fileUploading.getDocumentId() + "]");
            String t = "FileName 'requested' \"to\" Upload [" + fileName + "] type[" + contentType + "] name [" + fieldName + "]size[" + partSize + "]<br/>";
            log.info(t);
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

        return responseMessage;

    }
}
