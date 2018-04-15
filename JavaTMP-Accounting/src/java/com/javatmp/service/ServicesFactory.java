/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.service;

/**
 *
 * @author m_dar
 */
public class ServicesFactory {

    private final static ServicesFactory servicesFactory = new ServicesFactory();
    private AccountService accountService;

    public static ServicesFactory getInstance() {
        return servicesFactory;
    }

    private ServicesFactory() {
        this.accountService = new AccountService();
    }

    /**
     * @return the accountService
     */
    public AccountService getAccountService() {
        return accountService;
    }

    /**
     * @param accountService the accountService to set
     */
    public void setAccountService(AccountService accountService) {
        this.accountService = accountService;
    }

}
