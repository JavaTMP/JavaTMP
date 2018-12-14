package com.javatmp.module.fixedAsset;

import com.javatmp.module.fixedAsset.*;
import com.javatmp.module.fixedAsset.*;
import com.javatmp.util.JpaDaoHelper;
import com.javatmp.mvc.domain.table.DataTableColumnSpecs;
import com.javatmp.mvc.domain.table.DataTableRequest;
import com.javatmp.mvc.domain.table.DataTableResults;
import com.javatmp.mvc.domain.table.Order;
import java.text.ParseException;
import java.util.List;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.LockModeType;
import javax.persistence.PersistenceException;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaDelete;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

public class FixedAssetService {

    private final Logger logger = Logger.getLogger(getClass().getName());
    private final JpaDaoHelper jpaDaoHelper;

    public FixedAssetService(JpaDaoHelper jpaDaoHelper) {
        this.jpaDaoHelper = jpaDaoHelper;
    }

    public FixedAsset createNewFixedAsset(FixedAsset fixedAsset) {

        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            em.getTransaction().begin();
            em.persist(fixedAsset);
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
        return fixedAsset;
    }

    public int deleteFixedAsset(FixedAsset fixedAsset) {
        int deletedStatus = 0;
        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            em.getTransaction().begin();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<FixedAsset> cq = cb.createQuery(FixedAsset.class);
            Root<FixedAsset> from = cq.from(FixedAsset.class);
            cq.multiselect(from.get(FixedAsset_.id));
            cq.where(cb.equal(from.get(FixedAsset_.id), fixedAsset.getId()));
            TypedQuery<FixedAsset> query = em.createQuery(cq);
            query.setLockMode(LockModeType.PESSIMISTIC_WRITE);
            FixedAsset dbFixedAsset = query.getSingleResult();
            // here you can check for any pre delete code:

            // delete user first:
            CriteriaDelete<FixedAsset> deleteCriteria = cb.createCriteriaDelete(FixedAsset.class);
            Root<FixedAsset> userRoot = deleteCriteria.from(FixedAsset.class);
            deleteCriteria.where(cb.equal(userRoot.get(FixedAsset_.id), fixedAsset.getId()));
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

    public DataTableResults<FixedAsset> listAllFixedAssets(DataTableRequest<FixedAsset> tableRequest) throws ParseException {
        List<FixedAsset> retList = null;
        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<FixedAsset> cq = cb.createQuery(FixedAsset.class);
            Root<FixedAsset> from = cq.from(FixedAsset.class);
            cq.multiselect(from.get(FixedAsset_.id), from.get(FixedAsset_.name), from.get(FixedAsset_.creationDate));

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
                        predicate = cb.and(predicate, cb.equal(from.get(FixedAsset_.id), searchValue));
                    }
                    if (columnName.equals("userName")) {
                        String searchValue = new String(columnSearchValue);
                        predicate = cb.and(predicate, cb.equal(from.get(FixedAsset_.name), searchValue));
                    }
                }
            }
            cq.where(predicate);
            TypedQuery<FixedAsset> query = em.createQuery(cq);

            query.setFirstResult(tableRequest.getStart());
            query.setMaxResults(tableRequest.getLength());

            retList = query.getResultList();

            DataTableResults<FixedAsset> dataTableResult = new DataTableResults<>();
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
