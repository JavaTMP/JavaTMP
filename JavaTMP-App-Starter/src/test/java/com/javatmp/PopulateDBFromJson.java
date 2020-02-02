/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.javatmp.fw.util.MD5Util;
import com.javatmp.module.dms.entity.Document;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.entity.User_;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class PopulateDBFromJson {

    @Autowired
    private ObjectMapper objectMapper;

    @Test
    public void main() throws ParseException, FileNotFoundException {
        TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
        EntityManagerFactory factory = null;
        EntityManager em = null;
        factory = Persistence.createEntityManagerFactory("AppPU");
        em = factory.createEntityManager();
        String jsonStr = "";

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
                System.out.println("Try to persist i [" + i + "]");
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
                String countryCode = record.get("countryId");
                if (countryCode.equals("HM")) {
                    countryCode = "US";
                }
                System.out.println("countryId [" + countryCode + "]");

                user.setCountryId(countryCode);
                user.setAddress(record.get("address"));
                user.setTimezone(record.get("timezone"));
                user.setLastAccessTime(null);
                user.setGender(new Short(record.get("gender")));
                String imageContentBase64URL = record.get("profilePicDocumentBase64");
//            System.out.println(imageContentBase64URL);
                String[] parts = imageContentBase64URL.split("[:;,]");
//            System.out.println(Arrays.toString(parts));

                CriteriaBuilder cb = em.getCriteriaBuilder();
                CriteriaQuery<User> cq = cb.createQuery(User.class);
                Root<User> from = cq.from(User.class);
                cq.select(from);
                cq.where(cb.equal(from.get(User_.userName), user.getUserName()));
                TypedQuery<User> query = em.createQuery(cq);
                List<User> tempList = query.getResultList();
                if (tempList == null || tempList.size() == 0) {
                    String docType = parts[1];
                    String docBinary = parts[3];
                    Document document = prepareDocument("profilePicture", docType, docBinary);
                    em.persist(document);
                    user.setProfilePicDocumentId(document.getDocumentId());
//                user.setProfilePicDocument(document);
//                System.out.println("persisting [" + (user) + "]");
                    em.persist(user);
                    document.setCreatedByUserId(user.getId());
                }
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

        profileDocument.setDocumentType((short) 1);
        profileDocument.setParentDocumentId(null);
        profileDocument.setStatus((short) 1);
        profileDocument.setCreatedByUserId(null);

        return profileDocument;
    }

}
