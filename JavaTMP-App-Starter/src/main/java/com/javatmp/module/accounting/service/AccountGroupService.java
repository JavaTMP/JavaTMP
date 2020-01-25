/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.module.accounting.service;

import com.javatmp.fw.data.jpa.repository.JpaRepository;
import com.javatmp.module.accounting.entity.AccountGroup;
import javax.persistence.EntityManager;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.jpa.repository.support.JpaEntityInformation;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class AccountGroupService extends JpaRepository<AccountGroup, Integer> {

    private EntityManager em;

    public AccountGroupService(JpaEntityInformation<AccountGroup, Integer> entityInformation, EntityManager em) {
        super(entityInformation, em);
        this.em = em;
    }

}
