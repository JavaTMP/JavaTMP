/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.module.accounting.service;

import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.module.accounting.entity.TransactionEntry;
import com.javatmp.module.accounting.repository.TransactionEntryRepository;
import java.text.ParseException;
import javax.persistence.EntityManager;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class TransactionEntryService {

    private EntityManager em;
    private TransactionEntryRepository transactionEntryRepository;

    public TransactionEntryService(EntityManager em, TransactionEntryRepository transactionEntryRepository) {
        this.em = em;
        this.transactionEntryRepository = transactionEntryRepository;

    }

    public DataTableResults<TransactionEntry> listAllTransactionEntry(DataTableRequest tableRequest) throws ParseException {
        return this.transactionEntryRepository.retrievePageRequestDetails(tableRequest);
    }
}
