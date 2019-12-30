/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.module.accounting.service;

import com.javatmp.fw.data.jpa.repository.JpaRepository;
import com.javatmp.fw.domain.table.DataTableColumn;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.fw.domain.table.Order;
import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.module.accounting.entity.AccountTransaction;
import com.javatmp.module.accounting.entity.Transaction;
import com.javatmp.module.accounting.entity.Transaction_;
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.List;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceException;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

/**
 *
 * @author m_dar
 */
public class TransactionService extends JpaRepository<Transaction, Long> {

    private final Logger logger = Logger.getLogger(getClass().getName());

    public TransactionService(EntityManagerFactory emf) {
        super(Transaction.class, emf);
    }

    public Transaction createNewTransaction(Transaction transaction) {

        EntityManager em = null;
        try {
            em = this.emf.createEntityManager();
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
                    System.out.println("Trans is [" + MvcHelper.deepToString(trans) + "]");
                    em.persist(trans);
                }
            }

            em.getTransaction().commit();
        } catch (PersistenceException e) {
            if (em != null) {
                em.getTransaction().rollback();
            }
            throw e;
        }
        return transaction;
    }

    public DataTableResults<Transaction> listAllTransactions(DataTableRequest<Transaction> tableRequest) throws ParseException {
        DataTableResults<Transaction> dataTableResult = new DataTableResults<>();
        List<Transaction> retList = null;
        EntityManager em = null;
        try {
            em = this.emf.createEntityManager();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<Transaction> cq = cb.createQuery(Transaction.class);
            Root<Transaction> from = cq.from(Transaction.class);
            cq.multiselect(
                    from.get(Transaction_.id),
                    from.get(Transaction_.code),
                    from.get(Transaction_.transactionDate),
                    from.get(Transaction_.note),
                    from.get(Transaction_.specialNumber),
                    from.get(Transaction_.entity),
                    from.get(Transaction_.status),
                    from.get(Transaction_.creationDate),
                    from.get(Transaction_.voucherTypeId)
            );

            List<Order> orders = tableRequest.getOrder();
            if (orders != null && orders.size() > 0) {
                for (Order order : orders) {
                    Integer columnIndex = order.getColumn();
                    DataTableColumn orderColumn = tableRequest.getColumns().get(columnIndex);

                    Path<?> sortPath = this.convertStringToPath(from, orderColumn.getData());
                    if (order.getDir().value().equals("desc")) {
                        cq.orderBy(cb.desc(sortPath));
                    } else {
                        cq.orderBy(cb.asc(sortPath));
                    }
                }
            }

            // where clouse:
            Predicate predicate = cb.conjunction();
            for (DataTableColumn column : tableRequest.getColumns()) {
                String columnName = column.getName();
                String columnSearchValue = column.getSearch().getValue().trim();
                logger.info("column name [" + columnName + "] search value [" + columnSearchValue + "]");
                if (columnSearchValue != null && !columnSearchValue.equals("")) {
                    //predicate = cb.and(predicate, cb.equal(from.get(columnName), columnSearchValue));
                    if (columnName.equals("id")) {
                        Long searchValue = new Long(columnSearchValue);
                        predicate = cb.and(predicate, cb.equal(from.get(Transaction_.id), searchValue));
                    }
                    if (columnName.equals("code")) {
                        String searchValue = new String(columnSearchValue);
                        predicate = cb.and(predicate, cb.equal(from.get(Transaction_.code), searchValue));
                    }
                }
            }
            cq.where(predicate);
            TypedQuery<Transaction> query = em.createQuery(cq);

            query.setFirstResult(tableRequest.getStart());
            query.setMaxResults(tableRequest.getLength());

            retList = query.getResultList();
            dataTableResult.setData(retList);

            CriteriaQuery<Long> cqLong = cb.createQuery(Long.class);
            from = cqLong.from(cq.getResultType());

            cqLong.select(cb.count(from));
            cqLong.where(predicate);
            Long allCount = em.createQuery(cqLong).getSingleResult();

            dataTableResult.setRecordsTotal(allCount);
            dataTableResult.setRecordsFiltered(allCount);
            dataTableResult.setDraw(tableRequest.getDraw());

            return dataTableResult;
        } finally {
            if (em != null) {
                em.close();
            }
        }

    }

}
