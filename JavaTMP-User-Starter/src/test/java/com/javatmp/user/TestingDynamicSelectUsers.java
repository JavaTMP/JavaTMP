/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.user;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.*;
import com.javatmp.module.message.entity.Message;
import com.javatmp.module.message.service.MessageService;
import com.javatmp.module.user.entity.User;
import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.fw.mvc.adapter.ClassTypeAdapter;
import com.javatmp.fw.mvc.adapter.OrderDirTypeAdapter;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.fw.domain.table.OrderDir;
import com.javatmp.util.JpaDaoHelper;
import com.javatmp.module.user.service.UserService;
import com.javatmp.fw.domain.table.RuleOrGroup;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Predicate;

/**
 *
 * @author JavaTMP
 */
public class TestingDynamicSelectUsers {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException, ParseException {

        String request = "{\"draw\":1,\"columns\":[{\"data\":\"id\",\"name\":\"id\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"userName\",\"name\":\"userName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"firstName\",\"name\":\"firstName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"lastName\",\"name\":\"lastName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"birthDate\",\"name\":\"birthDate\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"birthDate\",\"name\":\"age\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"email\",\"name\":\"email\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"status\",\"name\":\"status\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"countryId\",\"name\":\"countryId\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"address\",\"name\":\"address\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"lang\",\"name\":\"lang\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"theme\",\"name\":\"theme\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"timezone\",\"name\":\"timezone\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"creationDate\",\"name\":\"creationDate\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}}],\"order\":[{\"column\":0,\"dir\":\"asc\"}],\"start\":0,\"length\":10,\"search\":{\"value\":\"\",\"regex\":false},\"_ajaxGlobalBlockUI\":false}";
        request = "{\"draw\":2,\"columns\":[{\"data\":\"id\",\"name\":\"id\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"userName\",\"name\":\"userName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"firstName\",\"name\":\"firstName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"lastName\",\"name\":\"lastName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"birthDate\",\"name\":\"birthDate\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"birthDate\",\"name\":\"age\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"email\",\"name\":\"email\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"status\",\"name\":\"status\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"countryId\",\"name\":\"countryId\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"address\",\"name\":\"address\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"lang\",\"name\":\"lang\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"theme\",\"name\":\"theme\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"timezone\",\"name\":\"timezone\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"creationDate\",\"name\":\"creationDate\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}}],\"order\":[{\"column\":0,\"dir\":\"desc\"}],\"start\":0,\"length\":10,\"search\":{\"value\":\"\",\"regex\":false},\"_ajaxGlobalBlockUI\":false}";
        request = "{\"draw\":2,\"columns\":[{\"data\":\"id\",\"name\":\"id\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"8\",\"regex\":true}},{\"data\":\"userName\",\"name\":\"userName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"firstName\",\"name\":\"firstName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"lastName\",\"name\":\"lastName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"birthDate\",\"name\":\"birthDate\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"birthDate\",\"name\":\"age\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"email\",\"name\":\"email\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"status\",\"name\":\"status\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"countryId\",\"name\":\"countryId\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"address\",\"name\":\"address\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"lang\",\"name\":\"lang\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"theme\",\"name\":\"theme\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"timezone\",\"name\":\"timezone\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"creationDate\",\"name\":\"creationDate\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}}],\"order\":[{\"column\":0,\"dir\":\"asc\"}],\"start\":0,\"length\":10,\"search\":{\"value\":\"\",\"regex\":false},\"_ajaxGlobalBlockUI\":false}";
//        request = "{\"draw\":5,\"columns\":[{\"data\":\"id\",\"name\":\"id\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"8\",\"regex\":true}},{\"data\":\"userName\",\"name\":\"userName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"user1\",\"regex\":true}},{\"data\":\"firstName\",\"name\":\"firstName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"lastName\",\"name\":\"lastName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"birthDate\",\"name\":\"birthDate\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"birthDate\",\"name\":\"age\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"email\",\"name\":\"email\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"status\",\"name\":\"status\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"countryId\",\"name\":\"countryId\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"address\",\"name\":\"address\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"lang\",\"name\":\"lang\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"theme\",\"name\":\"theme\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"timezone\",\"name\":\"timezone\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"creationDate\",\"name\":\"creationDate\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}}],\"order\":[{\"column\":0,\"dir\":\"asc\"}],\"start\":0,\"length\":10,\"search\":{\"value\":\"\",\"regex\":false},\"_ajaxGlobalBlockUI\":false}";
//        request = "{\"draw\":3,\"columns\":[{\"data\":\"id\",\"name\":\"id\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"userName\",\"name\":\"userName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"firstName\",\"name\":\"firstName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"lastName\",\"name\":\"lastName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"birthDate\",\"name\":\"birthDate\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"birthDate\",\"name\":\"age\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"60\",\"regex\":true}},{\"data\":\"email\",\"name\":\"email\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"status\",\"name\":\"status\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"countryId\",\"name\":\"countryId\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"address\",\"name\":\"address\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"lang\",\"name\":\"lang\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"theme\",\"name\":\"theme\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"timezone\",\"name\":\"timezone\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"creationDate\",\"name\":\"creationDate\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}}],\"order\":[{\"column\":0,\"dir\":\"desc\"}],\"start\":0,\"length\":10,\"search\":{\"value\":\"\",\"regex\":false},\"_ajaxGlobalBlockUI\":false}";
        request = "{\"draw\":3,\"columns\":[{\"data\":\"id\",\"name\":\"id\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"userName\",\"name\":\"userName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"firstName\",\"name\":\"firstName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"lastName\",\"name\":\"lastName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"birthDate\",\"name\":\"birthDate\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"birthDate\",\"name\":\"age\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"email\",\"name\":\"email\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"status\",\"name\":\"status\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"countryId\",\"name\":\"countryId\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"lang\",\"name\":\"lang\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"theme\",\"name\":\"theme\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"timezone\",\"name\":\"timezone\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"creationDate\",\"name\":\"creationDate\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}}],\"order\":[{\"column\":0,\"dir\":\"asc\"}],\"start\":0,\"length\":10,\"search\":{\"value\":\"\",\"regex\":false},\"_ajaxGlobalBlockUI\":false,\"advancedSearchQuery\":{\"condition\":\"AND\",\"rules\":[{\"condition\":\"OR\",\"rules\":[{\"id\":\"id\",\"field\":\"id\",\"type\":\"integer\",\"input\":\"number\",\"operator\":\"equal\",\"value\":1},{\"id\":\"id\",\"field\":\"id\",\"type\":\"integer\",\"input\":\"number\",\"operator\":\"equal\",\"value\":2}]},{\"condition\":\"OR\",\"rules\":[{\"id\":\"country\",\"field\":\"countryId\",\"type\":\"string\",\"operator\":\"equal\",\"value\":\"AE\"},{\"id\":\"country\",\"field\":\"countryId\",\"type\":\"string\",\"operator\":\"equal\",\"value\":\"AG\"}]}],\"valid\":true}}";
        Gson gson = new GsonBuilder()
                .setDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX").serializeNulls()
                .registerTypeAdapter(Class.class, new ClassTypeAdapter())
                .registerTypeAdapter(OrderDir.class, new OrderDirTypeAdapter())
                .create();

        System.out.println("*** start of test ***");
        DataTableRequest<User> tableRequest = gson.fromJson(request, DataTableRequest.class);

        tableRequest.setStart(0);
        tableRequest.setLength(11);

        tableRequest.setSelects(new String[]{"id", "userName", "firstName", "lastName", "status",
            "birthDate", "creationDate", "email", "lang", "theme", "countryId", "address", "timezone",
            "profilePicDocumentId", "profilePicDocument.randomHash"});
        tableRequest.setClassType(User.class);

        applyAdvanedSearchQuery(tableRequest.getAdvancedSearchQuery());
        System.out.println();
//        if (true) {
//            return;
//        }

        JpaDaoHelper jpaDaoHelper;
        jpaDaoHelper = new JpaDaoHelper("AppPU");

        DataTableResults<User> dataTableResult = jpaDaoHelper.retrievePageRequestDetails(tableRequest);

        System.out.println(MvcHelper.deepToString(dataTableResult));
        System.out.println(dataTableResult.getRecordsTotal());
    }

    private static void applyAdvanedSearchQuery(RuleOrGroup ruleOrGroup) {
        String condition = ruleOrGroup.getCondition();
        if (condition != null) {
            // Group node:
//            System.out.println("Condition [" + condition + "] rule node of [" + ruleOrGroup.getRules().size() + "]");
            if (condition.equals("AND")) {
                System.out.print("(");
                for (int i = 0; i < ruleOrGroup.getRules().size(); i++) {
                    RuleOrGroup child = ruleOrGroup.getRules().get(i);
                    applyAdvanedSearchQuery(child);
                    if (i < (ruleOrGroup.getRules().size() - 1)) {
                        System.out.print(" AND ");
                    }
                }
                System.out.print(")");
            } else if (condition.equals("OR")) {
                System.out.print("(");
                for (int i = 0; i < ruleOrGroup.getRules().size(); i++) {
                    RuleOrGroup child = ruleOrGroup.getRules().get(i);
                    applyAdvanedSearchQuery(child);
                    if (i < (ruleOrGroup.getRules().size() - 1)) {
                        System.out.print(" OR ");
                    }
                }
                System.out.print(")");
            }
        } else {
            // leaf rule node:
//            System.out.println("rule node [" + MvcHelper.deepToString(ruleOrGroup));
            System.out.print("(");
            System.out.print(ruleOrGroup.getField() + " " + ruleOrGroup.getOperator() + " " + ruleOrGroup.getValue());
            System.out.print(")");
        }

    }

}
