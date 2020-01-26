/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.accounting;

import com.javatmp.module.accounting.entity.Account;
import com.javatmp.module.accounting.service.AccountService;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class accountServiceTests {

    @Autowired
    AccountService accountService;

    @Test
    void getChartOfAccountsReport() throws SQLException, ParseException {

        List<Account> accounts = accountService.getChartOfAccountsReport(2);

        for (Account acct : accounts) {
            System.out.println(String.format("%-3S", acct.getId())
                    + " " + String.format("%-14S", acct.getAccountCode())
                    + " " + String.format("%-40S", acct.getName())
                    + " " + String.format("%-15S", acct.getAccountGroup().getType().getDebitSign())
                    + " " + String.format("%-15S", acct.getAccountGroup().getType().getName())
                    + " " + String.format("%-22S", acct.getAccountGroup().getName())
                    + " " + String.format("%-10S", acct.getBalance()));
        }

    }

    @Test
    void getLeafAccountsForTrialBalance() throws SQLException, ParseException {

        List<Account> accounts = accountService.getLeafAccountsForTrialBalance();

        for (Account acct : accounts) {
            System.out.println(String.format("%-3S", acct.getId())
                    + " " + String.format("%-15S", acct.getAccountCode())
                    + " " + String.format("%-40S", acct.getName())
                    + " " + String.format("%-15S", acct.getAccountGroup().getType().getDebitSign())
                    + " " + String.format("%-15S", acct.getAccountGroup().getType().getName())
                    + " " + String.format("%-25S", acct.getAccountGroup().getName())
                    + " " + String.format("%-10S", acct.getBalance()));
        }

    }

}
