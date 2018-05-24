package com.javatmp.service;

import com.javatmp.domain.Account;
import java.util.List;

public class AccountService {

    private DBFaker dBFaker;

    public AccountService(DBFaker dBFaker) {
        this.dBFaker = dBFaker;
    }

    public List<Account> getChartOfAccounts() {
        return this.dBFaker.getAccounts();
    }
}
