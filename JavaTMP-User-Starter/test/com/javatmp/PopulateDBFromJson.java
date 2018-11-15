/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.javatmp.module.dms.Document;
import com.javatmp.module.user.User;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.util.MD5Util;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Type;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import java.util.TimeZone;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;

/**
 *
 * @author Mohamed
 */
public class PopulateDBFromJson {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws ParseException, FileNotFoundException {
        TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
        EntityManagerFactory factory = null;
        EntityManager em = null;
        factory = Persistence.createEntityManagerFactory("AppPU");
        em = factory.createEntityManager();
        String jsonStr = "";

        Gson gson = new Gson();
        Type type = new TypeToken<ArrayList<Map<String, String>>>() {
        }.getType();
        InputStream stream = PopulateDBFromJson.class.getResourceAsStream("UserJsonFake.json");
        ArrayList<Map<String, String>> data = gson.fromJson(new InputStreamReader(stream), type);
//        String userTemplate = "logingUser = new User(DBFaker.getNextCounter(), \"###userName###\", MD5Util.convertToMD5(\"###password###\"), "
//                + "\"###firstName###\", \"###lastName###\", (short) ###status###, new Date(###birthDate###),\n"
//                + "            new Date(###creationDate###),\n"
//                + "            \"###email###\", \"###lang###\", \"###theme###\", \"###countryId###\", \"###address###\",\n"
//                + "            \"###timezone###\", ###profilePicDocumentId###L);";
//        String docTemplate = "profileDocument = prepareDocument(\"profilePicture\", \"###docType###\", \"###docBinary###\");";

        try {
            em.getTransaction().begin();

            User logingUser = new User();
            Document profileDocument = null;
//            logingUser.setId(1L);
//            logingUser.setUserName("user1");
//            logingUser.setPassword(MD5Util.convertToMD5(logingUser.getUserName()));
//            logingUser.setFirstName("firstName");
//            logingUser.setLastName("lastName");
//            logingUser.setStatus((short) 1);
//            logingUser.setCreationDate(new Date());
//            logingUser.setEmail("support@javatmp.com");
//            logingUser.setLang("en");
//            logingUser.setTheme("default");
//            logingUser.setTimezone(TimeZone.getTimeZone("UTC").getID());
//            logingUser.setBirthDate(new Date(-399571200000L));
//            logingUser.setCountryId("US");
//            logingUser.setAddress("<p>Not provided yet</p>");
//            logingUser.setLastAccessTime(null);
//            logingUser.setGender((short) 1);
//            profileDocument = prepareDocument("profilePicture", "image/png", "iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAABP0lEQVR4nO3XMavqMBiH8Sf1aqnp4CZEHEVE/AZ+/8nFSUTEqSooWDcDTXKHA2dtDu+Be4f3N/cPD0mXmN1ul/iPFf86oI8GSmmglAZKaaCUBkppoJQGSv3J/fDz+bDf79lsNqSUOBwOpJRYrVbUdf3rux8Hns9nYozEGLler0wmE4wxNE3DcrnkdDpRFAUxRqy1OOeydn2yrvj9ftN1HaPRCPg6laqqGI/HeO8BcM7xfD5p25bpdJq9+5XA2+2Gc46u60gpkVLCGEMIAWMMANZaiqLAWstgMMje9cm64hACx+MRgMvlQlmWeO8JIVBVFfB1WsYYXq8X3nvKssza9ck6wfV6zXa7ZTgcslgsmM1mPB4P2rb9/teapmE+n1PXNff7PXvXx+irTkgDpTRQSgOlNFBKA6U0UEoDpTRQ6i+ZRr8OBrK0SQAAAABJRU5ErkJggg==");
//
////            profileDocument.setDocumentId(1L);
//            em.persist(profileDocument);
////        logingUser.setId(null);
//            logingUser.setProfilePicDocumentId(profileDocument.getDocumentId());
//            logingUser.setProfilePicDocument(profileDocument);
//            em.persist(logingUser);

            for (int i = 0; i < data.size(); i++) {
                User user = new User();
                Map<String, String> record = data.get(i);
                user.setUserName(record.get("userName"));
                user.setPassword(MD5Util.convertToMD5(record.get("password")));
                user.setFirstName(record.get("firstName"));
                user.setLastName(record.get("lastName"));
                user.setStatus(new Short(record.get("status")));

                String birthdateStr = record.get("birthDate");
                SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
                Date birthDate = formater.parse(birthdateStr);
                Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("UTC"));
                cal.setTime(birthDate);
                cal.set(Calendar.HOUR_OF_DAY, -24);
                cal.set(Calendar.MINUTE, 0);
                cal.set(Calendar.SECOND, 0);
                cal.set(Calendar.MILLISECOND, 0);

                user.setBirthDate(cal.getTime());
                user.setCreationDate(formater.parse(record.get("creationDate")));
                user.setEmail(record.get("email"));
                user.setLang(record.get("lang"));
                user.setTheme(record.get("theme"));
                System.out.println("countryId [" + record.get("countryId") + "]");
                user.setCountryId(record.get("countryId"));
                user.setAddress(record.get("address"));
                user.setTimezone(record.get("timezone"));
                user.setLastAccessTime(null);
                user.setGender(new Short(record.get("gender")));
                String imageContentBase64URL = record.get("profilePicDocumentBase64");
//            System.out.println(imageContentBase64URL);
                String[] parts = imageContentBase64URL.split("[:;,]");
//            System.out.println(Arrays.toString(parts));

                String docType = parts[1];
                String docBinary = parts[3];
                Document document = prepareDocument("profilePicture", docType, docBinary);
                em.persist(document);
                user.setProfilePicDocumentId(document.getDocumentId());
//                user.setProfilePicDocument(document);
//                System.out.println("persisting [" + MvcHelper.deepToString(user) + "]");
                em.persist(user);
            }
            em.flush();
            em.getTransaction().commit();
        } catch (PersistenceException e) {
            e.printStackTrace();
        }

    }

    public static Document prepareDocument(String documentName, String docType, String imageContentBase64) {
        Document profileDocument = new Document();
        profileDocument.setDocumentName(documentName);
        profileDocument.setContentType(docType);
        profileDocument.setCreationDate(new Date());
        long randomLongValue = Double.valueOf((Math.random() + 1) * 1000L).longValue();
        profileDocument.setRandomHash((Long) Math.abs(profileDocument.getDocumentName().hashCode() + randomLongValue));

        String defaultProfileImage = imageContentBase64;
        byte[] newImage = Base64.getDecoder().decode(defaultProfileImage);
        profileDocument.setDocumentSize(newImage.length);
        profileDocument.setDocumentContent(newImage);

        return profileDocument;
    }

}
