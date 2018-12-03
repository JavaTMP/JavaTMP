/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.accounting;

import com.javatmp.module.accounting.Account;
import com.javatmp.module.accounting.AccountService;
import com.javatmp.module.accounting.Module;
import com.javatmp.module.accounting.Transactiontype;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.util.JpaDaoHelper;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

/**
 *
 * @author JavaTMP
 */
public class TestingGetsAccounting {

    public static void main(String[] args) throws SQLException, ParseException {
        JpaDaoHelper jpaDaoHelper;
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        AccountService accountService = new AccountService(jpaDaoHelper);

        List<Account> accounts = accountService.getChartOfAccounts();

        for (Account acct : accounts) {
            System.out.println(MvcHelper.toString(acct));
        }

        List<Transactiontype> transactiontypes = accountService.getTransactionTypes();

        for (Transactiontype t : transactiontypes) {
            System.out.println(MvcHelper.toString(t));
        }

        List<Module> modules = accountService.getModules();

        for (Module t : modules) {
            System.out.println(MvcHelper.toString(t));
        }

        List<Account> leafs = accountService.getLeafAccounts();
        for (Account t : leafs) {
            System.out.println(MvcHelper.toString(t));
        }

    }

}
