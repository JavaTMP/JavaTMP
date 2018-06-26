/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.javatmp.domain.User;
import com.javatmp.service.DBFaker;
import com.javatmp.util.MD5Util;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Type;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Map;

/**
 *
 * @author Mohamed
 */
public class ConvertJsonToUser {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws ParseException, FileNotFoundException {

        String jsonStr = "";

        Gson gson = new Gson();
        Type type = new TypeToken<ArrayList<Map<String, String>>>() {
        }.getType();
        InputStream stream = ConvertJsonToUser.class.getResourceAsStream("UserJsonFake.json");
        ArrayList<Map<String, String>> data = gson.fromJson(new InputStreamReader(stream), type);
        String userTemplate = "logingUser = new User(DBFaker.getNextCounter(), \"###userName###\", MD5Util.convertToMD5(\"###password###\"), "
                + "\"###firstName###\", \"###lastName###\", (short) ###status###, new Date(###birthDate###),\n"
                + "            new Date(###creationDate###),\n"
                + "            \"###email###\", \"###lang###\", \"###theme###\", \"###countryId###\", \"###address###\",\n"
                + "            \"###timezone###\", ###profilePicDocumentId###L);";
        String docTemplate = "profileDocument = prepareDocument(\"profilePicture\", \"###docType###\", \"###docBinary###\");";
        for (int i = 0; i < data.size(); i++) {
            Map<String, String> record = data.get(i);
//            System.out.println(record);
            String tempRec = userTemplate;
            tempRec = tempRec.replaceFirst("###userName###", record.get("userName"));
            tempRec = tempRec.replaceFirst("###password###", record.get("password"));
            tempRec = tempRec.replaceFirst("###firstName###", record.get("firstName"));
            tempRec = tempRec.replaceFirst("###lastName###", record.get("lastName"));
            tempRec = tempRec.replaceFirst("###status###", record.get("status"));

            String birthdateStr = record.get("birthDate");
            SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
            long birthLong = formater.parse(birthdateStr).getTime();

            tempRec = tempRec.replaceFirst("###birthDate###", birthLong + "L");
            long creationDateLong = formater.parse(record.get("creationDate")).getTime();
            tempRec = tempRec.replaceFirst("###creationDate###", creationDateLong + "L");
            tempRec = tempRec.replaceFirst("###email###", record.get("email"));
            tempRec = tempRec.replaceFirst("###lang###", record.get("lang"));
            tempRec = tempRec.replaceFirst("###theme###", record.get("theme"));
            tempRec = tempRec.replaceFirst("###countryId###", record.get("countryId"));
            tempRec = tempRec.replaceFirst("###address###", record.get("address"));
            tempRec = tempRec.replaceFirst("###timezone###", record.get("timezone"));
            String imageContentBase64URL = record.get("profilePicDocumentBase64");
//            System.out.println(imageContentBase64URL);
            String[] parts = imageContentBase64URL.split("[:;,]");
//            System.out.println(Arrays.toString(parts));

            String tempDoc = docTemplate;
            tempDoc = tempDoc.replaceFirst("###docType###", parts[1]);
            tempDoc = tempDoc.replaceFirst("###docBinary###", parts[3]);
            System.out.println(tempDoc);
            tempRec = tempRec.replaceFirst("###profilePicDocumentId###", 0 + "");
            System.out.println(tempRec);
            System.out.println("logingUser.setProfilePicDocument(profileDocument);\n"
                    + "logingUser.setProfilePicDocumentId(profileDocument.getDocumentId());\n"
                    + "this.documents.add(profileDocument);\n"
                    + "this.users.add(logingUser);");
        }
    }
}
