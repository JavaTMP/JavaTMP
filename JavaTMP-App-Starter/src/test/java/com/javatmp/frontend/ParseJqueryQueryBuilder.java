/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.frontend;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.javatmp.fw.domain.table.RuleOrGroup;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class ParseJqueryQueryBuilder {

    @Autowired
    private ObjectMapper objectMapper;

    @Test
    public void main() throws JsonProcessingException {
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
        JsonNode obj = objectMapper.readTree(query);

//        traverseObj(obj);
        RuleOrGroup tableRequest = (RuleOrGroup) objectMapper.readValue(query, RuleOrGroup.class);
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
        RuleOrGroup tableRequest1 = (RuleOrGroup) objectMapper.readValue(query1, RuleOrGroup.class);
        System.out.println("***********************************************");
        System.out.println(objectMapper.writeValueAsString(tableRequest));
        System.out.println(objectMapper.writeValueAsString(tableRequest1));

    }
}
