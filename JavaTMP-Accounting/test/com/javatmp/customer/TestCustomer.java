/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.customer;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.module.accounting.Account;
import com.javatmp.module.accounting.AccountService;
import com.javatmp.module.accounting.Costcenter;
import com.javatmp.module.accounting.Module;
import com.javatmp.module.customer.Customer;
import com.javatmp.module.customer.CustomerService;
import com.javatmp.module.user.User;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.adapter.ByteArrayToBase64TypeAdapter;
import com.javatmp.mvc.adapter.ClassTypeAdapter;
import com.javatmp.mvc.adapter.OrderDirTypeAdapter;
import com.javatmp.mvc.domain.table.DataTableRequest;
import com.javatmp.mvc.domain.table.DataTableResults;
import com.javatmp.mvc.domain.table.OrderDir;
import com.javatmp.util.JpaDaoHelper;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

/**
 *
 * @author JavaTMP
 */
public class TestCustomer {

    private static final Gson gson = new GsonBuilder()
            .setDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX").serializeNulls()
            .registerTypeAdapter(Class.class, new ClassTypeAdapter())
            .registerTypeAdapter(OrderDir.class, new OrderDirTypeAdapter())
            .registerTypeHierarchyAdapter(byte[].class, new ByteArrayToBase64TypeAdapter())
            .create();

    public static void main(String[] args) throws SQLException, ParseException {
        JpaDaoHelper jpaDaoHelper;
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        CustomerService customerService = new CustomerService(jpaDaoHelper);

        List<Customer> customers = jpaDaoHelper.findAll(Customer.class);

        for (Customer acct : customers) {
            System.out.println(MvcHelper.toString(acct));
        }

        Customer cust1 = new Customer(null, "Grocery 1", new Date());
        cust1.setStatus((short) 1);
        jpaDaoHelper.create(cust1);

        // test fetch:
        String searchQuery = "{\n"
                + "                                _ajaxGlobalBlockUI: false,\n"
                + "                                start: 0,\n"
                + "                                length: 10000,\n"
                + "                                order: [\n"
                + "                                    {\"column\": 0, \"dir\": \"asc\"}\n"
                + "                                ],\n"
                + "                                columns: [{\n"
                + "                                        \"data\": \"id\",\n"
                + "                                        search: {value:''}\n"
                + "                                    },\n"
                + "                                    {\n"
                + "                                        \"data\": \"name\",\n"
                + "                                        search: {value:''}\n"
                + "                                    }\n"
                + "                                ]\n"
                + "                            }";

        DataTableRequest tableRequest = (DataTableRequest) gson.fromJson(searchQuery, DataTableRequest.class);
        DataTableResults<Customer> dataTableResult = customerService.listAllCustomers(tableRequest);
        System.out.println(MvcHelper.toString(dataTableResult));
    }

}
