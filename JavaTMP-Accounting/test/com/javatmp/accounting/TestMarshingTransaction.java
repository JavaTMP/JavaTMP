/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.accounting;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.module.accounting.Account;
import com.javatmp.module.accounting.AccountService;
import com.javatmp.module.accounting.Accountgroup;
import com.javatmp.module.accounting.Transaction;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.adapter.ByteArrayToBase64TypeAdapter;
import com.javatmp.mvc.adapter.ClassTypeAdapter;
import com.javatmp.mvc.adapter.OrderDirTypeAdapter;
import com.javatmp.mvc.domain.table.OrderDir;
import com.javatmp.util.JpaDaoHelper;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import javax.persistence.PersistenceException;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author JavaTMP
 */
public class TestMarshingTransaction {

    private static final Gson gson = new GsonBuilder()
            .setDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX").serializeNulls()
            .registerTypeAdapter(Class.class, new ClassTypeAdapter())
            .registerTypeAdapter(OrderDir.class, new OrderDirTypeAdapter())
            .registerTypeHierarchyAdapter(byte[].class, new ByteArrayToBase64TypeAdapter())
            .create();

    public static void main(String[] args) throws SQLException, ParseException {
        try {
            JpaDaoHelper jpaDaoHelper;
            jpaDaoHelper = new JpaDaoHelper("AppPU");
            AccountService accountService = new AccountService(jpaDaoHelper);

            String transactionStr = "{\"code\":\"1\",\"entity\":null,\"transactionDate\":\"2018-12-08T00:00:00.000+04:00\",\"specialNumber\":null,\"note\":\"1\",\"accounttransactionList\":[{\"accountId\":\"10\",\"moduleId\":null,\"moduleRefId\":null,\"moduleTypeId\":null,\"costcenterList\":[{\"id\":\"3\"},{\"id\":\"5\"},{\"id\":\"6\"}],\"debit\":\"100\",\"credit\":\"0.00\",\"description\":null},{\"accountId\":\"13\",\"moduleId\":null,\"moduleRefId\":null,\"moduleTypeId\":null,\"costcenterList\":[{\"id\":\"5\"},{\"id\":\"10\"},{\"id\":\"11\"}],\"debit\":\"0.00\",\"credit\":\"100\",\"description\":null}],\"voucherTypeId\":1}";

            Transaction toBe = (Transaction) gson.fromJson(transactionStr, Transaction.class);
            System.out.println("Transaction to be Created [" + MvcHelper.deepToString(toBe) + "]");
            toBe.setCreationDate(new Date());
            toBe.setStatus((short) 1);
            accountService.createNewTransaction(toBe);
        } catch (PersistenceException e) {
            Throwable t = e;
            while (t.getCause() != null) {
                t = t.getCause();
            }
            t.printStackTrace();
            System.out.println(t.getMessage());
        }
    }

}
