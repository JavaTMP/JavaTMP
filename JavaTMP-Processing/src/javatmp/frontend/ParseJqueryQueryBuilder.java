/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javatmp.frontend;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

/**
 *
 * @author JavaTMP
 */
public class ParseJqueryQueryBuilder {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String query = "{\n"
                + "  \"condition\": \"AND\",\n"
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

        System.out.println("query [" + query + "]");

        JsonObject obj = new Gson().fromJson(query, JsonObject.class).getAsJsonObject();
        boolean isValid = obj.get("valid").getAsBoolean();
        System.out.println("is valid = " + isValid);

        traverseObj(obj);
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
