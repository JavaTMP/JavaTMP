package com.javatmp.module.accounting.service;

import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.module.accounting.entity.AccountTransaction;
import com.javatmp.module.accounting.entity.Transaction;
import com.javatmp.module.accounting.entity.Transaction_;
import com.javatmp.module.accounting.repository.TransactionRepository;
import java.math.BigDecimal;
import java.text.ParseException;
import javax.persistence.EntityManager;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class TransactionService {

    private EntityManager em;
    private TransactionRepository transactionRepository;

    public TransactionService(EntityManager em, TransactionRepository transactionRepository) {
        this.em = em;
        this.transactionRepository = transactionRepository;
    }

    public Transaction createNewTransaction(Transaction transaction) {

        em.getTransaction().begin();
        em.persist(transaction);
        if (transaction.getAccounttransactionList() != null) {
            for (AccountTransaction trans : transaction.getAccounttransactionList()) {
                trans.setTransactionId(transaction.getId());
                trans.setStatus((short) 1);
                System.out.println("debit is [" + trans.getDebit() + "] , credit is [" + trans.getCredit() + "]");
                if (trans.getDebit() != null && trans.getDebit().compareTo(BigDecimal.ZERO) > 0) {
                    trans.setAmount(trans.getDebit());
                } else if (trans.getCredit() != null && trans.getCredit().compareTo(BigDecimal.ZERO) > 0) {
                    trans.setAmount(trans.getCredit().negate());
                } else {
                    // throw exception or set amount to zero:
                    trans.setAmount(BigDecimal.ZERO);
                }
                System.out.println("Trans is [" + (trans) + "]");
                em.persist(trans);
            }
        }

        em.getTransaction().commit();

        return transaction;
    }

    public DataTableResults<Transaction> listAllTransactions(DataTableRequest tableRequest) throws ParseException {
        tableRequest.setSelects(new String[]{
            Transaction_.ID, Transaction_.CODE,
            Transaction_.TRANSACTION_DATE, Transaction_.NOTE,
            Transaction_.SPECIAL_NUMBER, Transaction_.ENTITY,
            Transaction_.STATUS, Transaction_.CREATION_DATE,
            Transaction_.VOUCHER_TYPE_ID});

        return this.transactionRepository.retrievePageRequestDetails(tableRequest);
    }

}
