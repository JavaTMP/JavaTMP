/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.accounting;

import com.javatmp.module.accounting.Account;
import com.javatmp.module.accounting.AccountService;
import com.javatmp.module.accounting.Costcenter;
import com.javatmp.module.accounting.Module;
import com.javatmp.module.accounting.Moduletype;
import com.javatmp.module.customer.Customer;
import com.javatmp.module.supplier.Supplier;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.util.JpaDaoHelper;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

/**
 *
 * @author JavaTMP
 */
public class GetBalanceSheetAccounts {

    public static void main(String[] args) throws SQLException, ParseException {
        JpaDaoHelper jpaDaoHelper;
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        AccountService accountService = new AccountService(jpaDaoHelper);

        List<Account> accounts = accountService.getChartOfAccountsReport(1);

        for (Account acct : accounts) {
            System.out.println(String.format("%-3S", acct.getId())
                    + " " + String.format("%-15S", acct.getAccountCode())
                    + " " + String.format("%-40S", acct.getName())
                    + " " + String.format("%-15S", acct.getAccountgroup().getType().getDebitSign())
                    + " " + String.format("%-15S", acct.getAccountgroup().getType().getName())
                    + " " + String.format("%-25S", acct.getAccountgroup().getName())
                    + " " + String.format("%-10S", acct.getBalance()));
        }

    }

}
