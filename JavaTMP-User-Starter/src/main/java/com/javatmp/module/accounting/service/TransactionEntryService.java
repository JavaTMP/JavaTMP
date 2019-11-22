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
import com.javatmp.module.accounting.entity.TransactionEntry;
import com.javatmp.module.accounting.entity.TransactionEntry_;
import java.text.ParseException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

public class TransactionEntryService extends JpaRepository<TransactionEntry, Long> {

    private final Logger logger = Logger.getLogger(getClass().getName());

    public TransactionEntryService(EntityManagerFactory emf) {
        super(TransactionEntry.class, emf);
    }

    public DataTableResults<TransactionEntry> listAllTransactionEntry(DataTableRequest<TransactionEntry> tableRequest) throws ParseException {
        List<TransactionEntry> retList = null;
        EntityManager em = null;
        try {
            em = this.emf.createEntityManager();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<TransactionEntry> cq = cb.createQuery(TransactionEntry.class);
            Root<TransactionEntry> from = cq.from(TransactionEntry.class);
            cq.select(from);

            List<Order> orders = tableRequest.getOrder();
            if (orders != null && orders.size() > 0) {
                List<javax.persistence.criteria.Order> tableOrders = new LinkedList<>();
                for (Order order : orders) {
                    Integer columnIndex = order.getColumn();
                    DataTableColumn orderColumn = tableRequest.getColumns().get(columnIndex);

                    Path<?> sortPath = this.convertStringToPath(from, orderColumn.getData());
                    if (order.getDir().value().equals("desc")) {
                        tableOrders.add(cb.desc(sortPath));
                    } else {
                        tableOrders.add(cb.asc(sortPath));
                    }
                }
                cq.orderBy(tableOrders);
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
                        predicate = cb.and(predicate, cb.equal(from.get(TransactionEntry_.id), searchValue));
                    }
                    if (columnName.equals("transactionId")) {
                        String searchValue = new String(columnSearchValue);
                        predicate = cb.and(predicate, cb.equal(from.get(TransactionEntry_.transactionId), searchValue));
                    }
                    if (columnName.equals("accountId")) {
                        String searchValue = new String(columnSearchValue);
                        predicate = cb.and(predicate, cb.equal(from.get(TransactionEntry_.accountId), searchValue));
                    }
                }
            }
            cq.where(predicate);
            TypedQuery<TransactionEntry> query = em.createQuery(cq);

            query.setFirstResult(tableRequest.getStart());
            query.setMaxResults(tableRequest.getLength());

            retList = query.getResultList();

            DataTableResults<TransactionEntry> dataTableResult = new DataTableResults<>();
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
