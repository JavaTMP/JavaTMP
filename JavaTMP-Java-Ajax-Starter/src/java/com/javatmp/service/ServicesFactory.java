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
    private UserService userService;

    public static ServicesFactory getInstance() {
        return servicesFactory;
    }

    private ServicesFactory() {
        this.userService = new UserService();
    }

    /**
     * @return the accountService
     */
    public UserService getAccountService() {
        return userService;
    }

    /**
     * @param accountService the accountService to set
     */
    public void setAccountService(UserService userService) {
        this.userService = userService;
    }

}
