package com.javatmp.module.customer;

import com.javatmp.util.JpaDaoHelper;
import com.javatmp.module.dms.Document;
import com.javatmp.module.customer.Customer_;
import com.javatmp.mvc.domain.table.DataTableColumnSpecs;
import com.javatmp.mvc.domain.table.DataTableRequest;
import com.javatmp.mvc.domain.table.DataTableResults;
import com.javatmp.mvc.domain.table.Order;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.LockModeType;
import javax.persistence.PersistenceException;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaDelete;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

public class CustomerService {

    private final Logger logger = Logger.getLogger(getClass().getName());
    private final JpaDaoHelper jpaDaoHelper;

    public CustomerService(JpaDaoHelper jpaDaoHelper) {
        this.jpaDaoHelper = jpaDaoHelper;
    }

    public Customer createNewCustomer(Customer customer) {

        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            em.getTransaction().begin();
            em.persist(customer);
            em.getTransaction().commit();
        } catch (PersistenceException e) {
            if (em != null) {
                em.getTransaction().rollback();
            }
            throw e;
        } finally {
            if (em != null) {
                em.close();
            }
        }
        return customer;
    }

    public int deleteCustomer(Customer customer) {
        int deletedStatus = 0;
        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            em.getTransaction().begin();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<Customer> cq = cb.createQuery(Customer.class);
            Root<Customer> from = cq.from(Customer.class);
            cq.multiselect(from.get(Customer_.id));
            cq.where(cb.equal(from.get(Customer_.id), customer.getId()));
            TypedQuery<Customer> query = em.createQuery(cq);
            query.setLockMode(LockModeType.PESSIMISTIC_WRITE);
            Customer dbCustomer = query.getSingleResult();
            // here you can check for any pre delete code:

            // delete user first:
            CriteriaDelete<Customer> deleteCriteria = cb.createCriteriaDelete(Customer.class);
            Root<Customer> userRoot = deleteCriteria.from(Customer.class);
            deleteCriteria.where(cb.equal(userRoot.get(Customer_.id), customer.getId()));
            deletedStatus = em.createQuery(deleteCriteria).executeUpdate();

            // delete document second if user deleted:
            em.getTransaction().commit();
            return deletedStatus;
        } catch (PersistenceException e) {
            if (em != null) {
                em.getTransaction().rollback();
            }
            throw e;
        }
    }

    public DataTableResults<Customer> listAllCustomers(DataTableRequest<Customer> tableRequest) throws ParseException {
        List<Customer> retList = null;
        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<Customer> cq = cb.createQuery(Customer.class);
            Root<Customer> from = cq.from(Customer.class);
            cq.multiselect(from.get(Customer_.id), from.get(Customer_.name), from.get(Customer_.creationDate));

            List<Order> orders = tableRequest.getOrder();
            if (orders != null && orders.size() > 0) {
                for (Order order : orders) {
                    Integer columnIndex = order.getColumn();
                    DataTableColumnSpecs orderColumn = tableRequest.getColumns().get(columnIndex);

                    Path<?> sortPath = this.jpaDaoHelper.convertStringToPath(from, orderColumn.getData());
                    if (order.getDir().value().equals("desc")) {
                        cq.orderBy(cb.desc(sortPath));
                    } else {
                        cq.orderBy(cb.asc(sortPath));
                    }
                }
            }

            // where clouse:
            Predicate predicate = cb.conjunction();
            for (DataTableColumnSpecs column : tableRequest.getColumns()) {
                String columnName = column.getName();
                String columnSearchValue = column.getSearch().getValue().trim();
                logger.info("column name [" + columnName + "] search value [" + columnSearchValue + "]");
                if (columnSearchValue != null && !columnSearchValue.equals("")) {
                    //predicate = cb.and(predicate, cb.equal(from.get(columnName), columnSearchValue));
                    if (columnName.equals("id")) {
                        Long searchValue = new Long(columnSearchValue);
                        predicate = cb.and(predicate, cb.equal(from.get(Customer_.id), searchValue));
                    }
                    if (columnName.equals("userName")) {
                        String searchValue = new String(columnSearchValue);
                        predicate = cb.and(predicate, cb.equal(from.get(Customer_.name), searchValue));
                    }
                }
            }
            cq.where(predicate);
            TypedQuery<Customer> query = em.createQuery(cq);

            query.setFirstResult(tableRequest.getStart());
            query.setMaxResults(tableRequest.getLength());

            retList = query.getResultList();

            DataTableResults<Customer> dataTableResult = new DataTableResults<>();
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
