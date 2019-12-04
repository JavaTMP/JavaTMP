/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.accounting;

import com.javatmp.module.accounting.Account;
import com.javatmp.module.accounting.AccountService;
import com.javatmp.module.accounting.Accountgroup;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.util.JpaDaoHelper;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import javax.persistence.PersistenceException;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author JavaTMP
 */
public class TestDeleteAccount {

    public static void main(String[] args) throws SQLException, ParseException {
        try {
            JpaDaoHelper jpaDaoHelper;
            jpaDaoHelper = new JpaDaoHelper("AppPU");
            AccountService accountService = new AccountService(jpaDaoHelper);
            System.out.println(accountService.deleteAccount(new Account(5L)));
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
