/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.user;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.*;
import com.javatmp.module.user.User;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.adapter.ClassTypeAdapter;
import com.javatmp.mvc.adapter.OrderDirTypeAdapter;
import com.javatmp.mvc.domain.table.DataTableRequest;
import com.javatmp.mvc.domain.table.DataTableResults;
import com.javatmp.mvc.domain.table.OrderDir;
import com.javatmp.util.JpaDaoHelper;
import com.javatmp.module.user.UserService;
import java.sql.SQLException;
import java.text.ParseException;

/**
 *
 * @author JavaTMP
 */
public class TestingDynamicSelectUsers {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException, ParseException {
        JpaDaoHelper jpaDaoHelper;
        UserService userService;
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        userService = new UserService(jpaDaoHelper);

        String request = "{\"draw\":1,\"columns\":[{\"data\":\"id\",\"name\":\"id\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"userName\",\"name\":\"userName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"firstName\",\"name\":\"firstName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"lastName\",\"name\":\"lastName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"birthDate\",\"name\":\"birthDate\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"birthDate\",\"name\":\"age\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"email\",\"name\":\"email\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"status\",\"name\":\"status\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"countryId\",\"name\":\"countryId\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"address\",\"name\":\"address\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"lang\",\"name\":\"lang\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"theme\",\"name\":\"theme\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"timezone\",\"name\":\"timezone\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"creationDate\",\"name\":\"creationDate\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}}],\"order\":[{\"column\":0,\"dir\":\"asc\"}],\"start\":0,\"length\":10,\"search\":{\"value\":\"\",\"regex\":false},\"_ajaxGlobalBlockUI\":false}";
        request = "{\"draw\":2,\"columns\":[{\"data\":\"id\",\"name\":\"id\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"userName\",\"name\":\"userName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"firstName\",\"name\":\"firstName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"lastName\",\"name\":\"lastName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"birthDate\",\"name\":\"birthDate\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"birthDate\",\"name\":\"age\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"email\",\"name\":\"email\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"status\",\"name\":\"status\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"countryId\",\"name\":\"countryId\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"address\",\"name\":\"address\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"lang\",\"name\":\"lang\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"theme\",\"name\":\"theme\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"timezone\",\"name\":\"timezone\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"creationDate\",\"name\":\"creationDate\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}}],\"order\":[{\"column\":0,\"dir\":\"desc\"}],\"start\":0,\"length\":10,\"search\":{\"value\":\"\",\"regex\":false},\"_ajaxGlobalBlockUI\":false}";
        request = "{\"draw\":2,\"columns\":[{\"data\":\"id\",\"name\":\"id\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"8\",\"regex\":true}},{\"data\":\"userName\",\"name\":\"userName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"firstName\",\"name\":\"firstName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"lastName\",\"name\":\"lastName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"birthDate\",\"name\":\"birthDate\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"birthDate\",\"name\":\"age\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"email\",\"name\":\"email\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"status\",\"name\":\"status\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"countryId\",\"name\":\"countryId\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"address\",\"name\":\"address\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"lang\",\"name\":\"lang\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"theme\",\"name\":\"theme\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"timezone\",\"name\":\"timezone\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"creationDate\",\"name\":\"creationDate\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}}],\"order\":[{\"column\":0,\"dir\":\"asc\"}],\"start\":0,\"length\":10,\"search\":{\"value\":\"\",\"regex\":false},\"_ajaxGlobalBlockUI\":false}";
//        request = "{\"draw\":5,\"columns\":[{\"data\":\"id\",\"name\":\"id\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"8\",\"regex\":true}},{\"data\":\"userName\",\"name\":\"userName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"user1\",\"regex\":true}},{\"data\":\"firstName\",\"name\":\"firstName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"lastName\",\"name\":\"lastName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"birthDate\",\"name\":\"birthDate\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"birthDate\",\"name\":\"age\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"email\",\"name\":\"email\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"status\",\"name\":\"status\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"countryId\",\"name\":\"countryId\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"address\",\"name\":\"address\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"lang\",\"name\":\"lang\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"theme\",\"name\":\"theme\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"timezone\",\"name\":\"timezone\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"creationDate\",\"name\":\"creationDate\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}}],\"order\":[{\"column\":0,\"dir\":\"asc\"}],\"start\":0,\"length\":10,\"search\":{\"value\":\"\",\"regex\":false},\"_ajaxGlobalBlockUI\":false}";
//        request = "{\"draw\":3,\"columns\":[{\"data\":\"id\",\"name\":\"id\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"userName\",\"name\":\"userName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"firstName\",\"name\":\"firstName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"lastName\",\"name\":\"lastName\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"birthDate\",\"name\":\"birthDate\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"birthDate\",\"name\":\"age\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"60\",\"regex\":true}},{\"data\":\"email\",\"name\":\"email\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"status\",\"name\":\"status\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"countryId\",\"name\":\"countryId\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"address\",\"name\":\"address\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"lang\",\"name\":\"lang\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"theme\",\"name\":\"theme\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"timezone\",\"name\":\"timezone\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}},{\"data\":\"creationDate\",\"name\":\"creationDate\",\"searchable\":true,\"orderable\":true,\"search\":{\"value\":\"\",\"regex\":false}}],\"order\":[{\"column\":0,\"dir\":\"desc\"}],\"start\":0,\"length\":10,\"search\":{\"value\":\"\",\"regex\":false},\"_ajaxGlobalBlockUI\":false}";
        Gson gson = new GsonBuilder()
                .setDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX").serializeNulls()
                .registerTypeAdapter(Class.class, new ClassTypeAdapter())
                .registerTypeAdapter(OrderDir.class, new OrderDirTypeAdapter())
                .create();

        DataTableRequest<User> tableRequest = gson.fromJson(request, DataTableRequest.class);

        tableRequest.setStart(0);
        tableRequest.setLength(1);

        tableRequest.setSelects(new String[]{"id", "userName", "firstName", "lastName", "status",
            "birthDate", "creationDate", "email", "lang", "theme", "countryId", "address", "timezone",
            "profilePicDocumentId", "profilePicDocument.randomHash"});
        tableRequest.setClassType(User.class);
        DataTableResults<User> dataTableResult = jpaDaoHelper.retrievePageRequestDetails(tableRequest);

        System.out.println(MvcHelper.deepToString(dataTableResult));
        System.out.println(dataTableResult.getRecordsTotal());

    }

}