/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.service;

import com.javatmp.domain.Account;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author m_dar
 */
public class AccountService {

    private DBFaker dBFaker;

    public AccountService(DBFaker dBFaker) {
        this.dBFaker = dBFaker;
    }

    public List<Account> getChartOfAccounts() {
        return this.dBFaker.getAccounts();
    }
}
