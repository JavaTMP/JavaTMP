/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.frontend;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Set;

/**
 *
 * @author JavaTMP
 */
public class GenerateAnimateCSSClasses {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        String jsonFile = "C:\\NetBeansProjects\\JavaTMP\\JavaTMP-Static-Ajax\\node_modules\\animate.css\\animate-config.json";
        byte[] content = Files.readAllBytes(new File(jsonFile).toPath());
        System.out.println("content size is " + content.length);
        String headingTmp = "<h4>##header##</h4>";
        String linkTmp = "<a class=\"btn btn-primary ml-1\" mouseenterAdd=\"animated infinite ###ClassName###\" mouseleaveRemove=\"animated infinite ###ClassName###\" href=\"javascript:;\">###ClassName###</a>";
        JsonObject jsonObject = new JsonParser().parse(new String(content)).getAsJsonObject();
        Set<String> keys = jsonObject.keySet();
        for (String key : keys) {
//            System.out.println("key is " + key);
            JsonObject keyValue = jsonObject.getAsJsonObject(key);
            System.out.println(headingTmp.replaceAll("##header##", key));
            for (String inKey : keyValue.keySet()) {
//                System.out.println("inKey is " + inKey);
                JsonObject inKeyValue = jsonObject.getAsJsonObject(inKey);
                System.out.println(linkTmp.replaceAll("###ClassName###", inKey));
            }
        }

    }

}
