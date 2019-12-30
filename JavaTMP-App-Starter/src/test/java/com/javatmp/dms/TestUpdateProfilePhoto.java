/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.dms;

import com.javatmp.module.dms.entity.Document;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import java.util.Base64;
import java.util.Date;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;

/**
 *
 * @author JavaTMP
 */
public class TestUpdateProfilePhoto {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        UserService us;

        us = new UserService(Persistence.createEntityManagerFactory("AppPU"));
        String buffer = "data:image/jpeg;base64,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";
        try {
            User user = new User(1L);
            String base64Head = "base64,";
            int indexOfBase64 = buffer.indexOf(base64Head);
            String base64Image = buffer.substring(indexOfBase64 + base64Head.length());
            System.out.println(base64Image);
            String dataHead = "data:";
            String contentType = buffer.substring(dataHead.length(), indexOfBase64);
            System.out.println(contentType);
            byte[] imageData = Base64.getDecoder().decode(base64Image);
            Document fileUploading = new Document();
            fileUploading.setDocumentName("profile picture");
            fileUploading.setContentType(contentType);
            fileUploading.setDocumentContent(imageData);
            fileUploading.setDocumentType((short) 1);
            fileUploading.setStatus((short) 1);
            fileUploading.setCreationDate(new Date());
            long randomLongValue = Double.valueOf((Math.random() + 1) * 1000L).longValue();
            fileUploading.setRandomHash((Long) Math.abs(buffer.hashCode() + randomLongValue));
            us.updateUserPersonalProfilePhoto(user, fileUploading);
        } catch (PersistenceException e) {
            Throwable t = e;
            while (t != null) {
                System.out.println("type [" + e.getClass().getName() + "]");
                System.out.println("e [" + e.getMessage() + "]");
                t = t.getCause();
            }
        }
    }
}
