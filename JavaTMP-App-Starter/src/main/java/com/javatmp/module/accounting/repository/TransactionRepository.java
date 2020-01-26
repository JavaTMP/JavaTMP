package com.javatmp.module.accounting.repository;

import com.javatmp.fw.data.jpa.repository.ExtendedJpaRepository;
import com.javatmp.module.accounting.entity.Transaction;

/**
 *
 * @author JavaTMP
 */
public interface TransactionRepository extends ExtendedJpaRepository<Transaction, Long> {

}
