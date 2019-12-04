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
import com.javatmp.module.accounting.Module;
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
import java.util.List;
import javax.persistence.PersistenceException;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author JavaTMP
 */
public class TestModuleWithType {

    public static void main(String[] args) throws SQLException, ParseException {
        try {
            JpaDaoHelper jpaDaoHelper;
            jpaDaoHelper = new JpaDaoHelper("AppPU");
            AccountService accountService = new AccountService(jpaDaoHelper);

            List<Module> modules = accountService.getModulesWithType();

            System.out.println("Transaction to be Created [" + MvcHelper.deepToString(modules) + "]");
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
