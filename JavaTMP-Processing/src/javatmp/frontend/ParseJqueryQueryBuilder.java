/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javatmp.frontend;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import org.apache.commons.lang3.builder.RecursiveToStringStyle;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

/**
 *
 * @author JavaTMP
 */
public class ParseJqueryQueryBuilder {

    private static final Gson gson = new GsonBuilder()
            .setDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX").serializeNulls()
            .create();

    public static void main(String[] args) {
        String query = "{\n"
                + "  \"condition\": \"AND\",\n"
                + "  \"not\": false,"
                + "  \"rules\": [\n"
                + "    {\n"
                + "      \"id\": \"price\",\n"
                + "      \"field\": \"price\",\n"
                + "      \"type\": \"double\",\n"
                + "      \"input\": \"number\",\n"
                + "      \"operator\": \"less\",\n"
                + "      \"value\": 10.25\n"
                + "    },\n"
                + "    {\n"
                + "      \"condition\": \"OR\",\n"
                + "      \"not\": false,"
                + "      \"rules\": [\n"
                + "        {\n"
                + "          \"id\": \"category\",\n"
                + "          \"field\": \"category\",\n"
                + "          \"type\": \"integer\",\n"
                + "          \"input\": \"select\",\n"
                + "          \"operator\": \"in\",\n"
                + "          \"value\": [\n"
                + "            1,\n"
                + "            3,\n"
                + "            4\n"
                + "          ]\n"
                + "        },\n"
                + "        {\n"
                + "          \"id\": \"category\",\n"
                + "          \"field\": \"category\",\n"
                + "          \"type\": \"integer\",\n"
                + "          \"input\": \"select\",\n"
                + "          \"operator\": \"in\",\n"
                + "          \"value\": [\n"
                + "            1,\n"
                + "            2,\n"
                + "            3\n"
                + "          ]\n"
                + "        }\n"
                + "      ]\n"
                + "    }\n"
                + "  ],\n"
                + "  \"valid\": true\n"
                + "}";

//        System.out.println("query [" + query + "]");
        JsonObject obj = gson.fromJson(query, JsonObject.class).getAsJsonObject();

//        traverseObj(obj);
        RuleOrGroup tableRequest = (RuleOrGroup) gson.fromJson(query, RuleOrGroup.class);
        System.out.println(ReflectionToStringBuilder.toString(tableRequest, new RecursiveToStringStyle()));
        System.out.println("***********************************************************");
        String query1 = "{\n"
                + "  \"condition\": \"AND\",\n"
                + "  \"rules\": [\n"
                + "    {\n"
                + "      \"id\": \"id\",\n"
                + "      \"field\": \"id\",\n"
                + "      \"type\": \"integer\",\n"
                + "      \"input\": \"number\",\n"
                + "      \"operator\": \"equal\",\n"
                + "      \"value\": 1\n"
                + "    },\n"
                + "    {\n"
                + "      \"id\": \"birthDate\",\n"
                + "      \"field\": \"birthDate\",\n"
                + "      \"type\": \"date\",\n"
                + "      \"input\": \"number\",\n"
                + "      \"operator\": \"less\",\n"
                + "      \"value\": \"01/11/2019\"\n"
                + "    },\n"
                + "    {\n"
                + "      \"condition\": \"OR\",\n"
                + "      \"rules\": [\n"
                + "        {\n"
                + "          \"id\": \"country\",\n"
                + "          \"field\": \"country\",\n"
                + "          \"type\": \"string\",\n"
                + "          \"input\": \"number\",\n"
                + "          \"operator\": \"equal\",\n"
                + "          \"value\": \"AE\"\n"
                + "        },\n"
                + "        {\n"
                + "          \"id\": \"country\",\n"
                + "          \"field\": \"country\",\n"
                + "          \"type\": \"string\",\n"
                + "          \"input\": \"number\",\n"
                + "          \"operator\": \"equal\",\n"
                + "          \"value\": \"AF\"\n"
                + "        }\n"
                + "      ]\n"
                + "    }\n"
                + "  ],\n"
                + "  \"valid\": true\n"
                + "}";
        RuleOrGroup tableRequest1 = (RuleOrGroup) gson.fromJson(query1, RuleOrGroup.class);
        System.out.println(ReflectionToStringBuilder.toString(tableRequest1, new RecursiveToStringStyle()));
        System.out.println("***********************************************");
        System.out.println(gson.toJson(tableRequest));
        System.out.println(gson.toJson(tableRequest1));

    }

    public static void traverseObj(JsonObject node) {
        // check if node is leave:
        System.out.println("size = " + node.size());
        if ((node.size() == 2 || node.size() == 3) && node.has("condition") && node.has("rules")) {
            String condition = node.get("condition").getAsString();
            System.out.println("Condition is = " + condition);
            JsonArray element = null;
            if ((element = node.get("rules").getAsJsonArray()) != null) {
                for (JsonElement childElement : element) {
                    JsonObject child = childElement.getAsJsonObject();
                    traverseObj(child);
                }
            }
        } else {
            // process leave:
            System.out.println("process leave node");
            String id = node.get("id").getAsString();
            String field = node.get("field").getAsString();
            String type = node.get("type").getAsString();
            String input = node.get("input").getAsString();
            String operator = node.get("operator").getAsString();
            JsonElement nodeValueElemt = node.get("value");
            System.out.println("id = " + id + " , field = " + field + " , type = " + type
                    + " , input = " + input + " , operator = " + operator
                    + " , nodeValueObj = " + nodeValueElemt);
        }

    }
}
