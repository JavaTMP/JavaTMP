/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.module.accounting.service;

import com.javatmp.fw.data.jpa.repository.JpaRepository;
import com.javatmp.module.accounting.entity.AccountGroup;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author m_dar
 */
public class AccountGroupService extends JpaRepository<AccountGroup, Integer> {

    private final Logger logger = Logger.getLogger(getClass().getName());

    public AccountGroupService(EntityManagerFactory emf) {
        super(AccountGroup.class, emf);
    }
}
