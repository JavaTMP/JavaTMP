/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.module.accounting.service;

import com.javatmp.module.accounting.entity.AccountGroup;
import com.javatmp.module.accounting.repository.AccountGroupRepository;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class AccountGroupService {

    AccountGroupRepository accountGroupRepository;

    public AccountGroupService(AccountGroupRepository accountGroupRepository) {
        this.accountGroupRepository = accountGroupRepository;
    }

    public List<AccountGroup> findAll() {
        return this.accountGroupRepository.findAll();
    }

}
