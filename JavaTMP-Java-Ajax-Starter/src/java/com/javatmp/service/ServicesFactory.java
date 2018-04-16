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

    private DBFaker dbFaker;
    private UserService userService;

    public ServicesFactory() {
        this.dbFaker = new DBFaker();
        this.userService = new UserService(this.dbFaker);
    }

    public void destroy() {
        this.userService = null;
        this.dbFaker = null;
    }

    /**
     * @return the userService
     */
    public UserService getUserService() {
        return userService;
    }

}
