package com.javatmp.fw.util;

import com.javatmp.module.dms.entity.Document;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StreamUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

@Slf4j
public class Util {

    public static Document readDocumentFromRequestIfExist(MultipartFile profilePicture) throws IOException {

        if (profilePicture == null || profilePicture.isEmpty()) {
            return null;
        }

        String fileName = StringUtils.cleanPath(profilePicture.getOriginalFilename());
        log.info("file name to be used [{}]", fileName);

        if (fileName.contains("..")) {
            // This is a security check
            throw new IllegalArgumentException(
                    "Cannot store file with relative path outside current directory "
                    + fileName);
        }
        String contentType = profilePicture.getContentType();
        long partSize = profilePicture.getSize();
        Document fileUploading = new Document();
        fileUploading.setContentType(contentType);
        fileUploading.setDocumentName(fileName);
        fileUploading.setDocumentSize(partSize);
        fileUploading.setCreationDate(new Date());
        fileUploading.setDocumentType((short) 1);
        fileUploading.setParentDocumentId(null);
        fileUploading.setStatus((short) 1);
        fileUploading.setCreatedByUserId(null);

        long randomLongValue = Double.valueOf((Math.random() + 1) * 1000L).longValue();
        fileUploading.setRandomHash((Long) Math.abs(fileUploading.getDocumentName().hashCode() + randomLongValue));
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        try (InputStream inputStream = profilePicture.getInputStream()) {
            StreamUtils.copy(inputStream, buffer);
            buffer.flush();
        }

        fileUploading.setDocumentContent(buffer.toByteArray());
        return fileUploading;
    }
}
