package com.javatmp.util;

import com.javatmp.mvc.domain.table.DataTableColumnSpecs;
import com.javatmp.mvc.domain.table.DataTableRequest;
import com.javatmp.mvc.domain.table.DataTableResults;
import com.javatmp.mvc.domain.table.Order;
import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.Selection;
import javax.persistence.metamodel.SingularAttribute;

public class JpaDaoHelper {

    private EntityManagerFactory emf;

    public JpaDaoHelper(String persistentUnitName) {
        this.emf = Persistence.createEntityManagerFactory(persistentUnitName);
    }

    public JpaDaoHelper(String persistentUnitName, Properties properties) {
        this.emf = Persistence.createEntityManagerFactory(persistentUnitName, properties);
    }

    public <T> T create(T object) {

        EntityManager em = null;
        EntityTransaction tx = null;
        try {
            em = emf.createEntityManager();
            tx = em.getTransaction();
            tx.begin();
            em.persist(object);
            tx.commit();
            return object;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public <T> T merge(T object) {

        EntityManager em = null;
        EntityTransaction tx = null;
        try {
            em = emf.createEntityManager();
            tx = em.getTransaction();
            tx.begin();
            em.merge(object);
            tx.commit();
            return object;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public <T> T read(Class<T> clazz, Serializable id) {

        T retObject = null;

        EntityManager em = null;
        EntityTransaction tx = null;
        try {
            em = emf.createEntityManager();
            retObject = em.find(clazz, id);
            return retObject;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public <T> void delete(T object) {

        EntityManager em = null;
        EntityTransaction tx = null;
        try {
            em = emf.createEntityManager();
            tx = em.getTransaction();
            tx.begin();
            em.remove(object);
            tx.commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public <T> void update(T object) {
        EntityManager em = null;
        EntityTransaction tx = null;
        try {
            em = emf.createEntityManager();
            tx = em.getTransaction();
            tx.begin();
            em.merge(object);
            tx.commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public <T> List<T> findAll(Class<T> classObject, int start, int count) {

        EntityManager em = null;
        List<T> retList = null;
        try {
            em = emf.createEntityManager();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<T> cq = cb.createQuery(classObject);
            Root<T> root = cq.from(classObject);
            cq.select(root);
            TypedQuery<T> query = em.createQuery(cq);
            query.setFirstResult(start);
            query.setMaxResults(count);
            retList = query.getResultList();
            return retList;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public <T> List<T> findAll(Class classObject) {

        EntityManager em = null;
        List<T> retList = null;
        try {
            em = emf.createEntityManager();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<T> cq = cb.createQuery(classObject);
            Root<T> root = cq.from(classObject);
            cq.select(root);
            TypedQuery<T> query = em.createQuery(cq);
            retList = query.getResultList();
            return retList;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public Long getAllCount(Class classObject) {

        // from: http://stackoverflow.com/questions/2883887/in-jpa-2-using-a-criteriaquery-how-to-count-results
        EntityManager em = null;
        try {
            em = emf.createEntityManager();
            CriteriaBuilder qb = em.getCriteriaBuilder();
            CriteriaQuery<Long> cq = qb.createQuery(Long.class);
            cq.select(qb.count(cq.from(classObject)));
            cq.where(/*your stuff*/);
            return em.createQuery(cq).getSingleResult();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public <T> List<T> findByProperty(Class<T> clazz, String propertyName, Object value) {
        EntityManager em = null;
        List<T> retList = null;
        try {
            em = emf.createEntityManager();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<T> cq = cb.createQuery(clazz);
            Root<T> root = cq.from(clazz);
            cq.where(cb.equal(root.get(propertyName), value));
            retList = em.createQuery(cq).getResultList();
        } finally {
            if (em != null) {
                em.close();
            }
        }
        return retList;
    }

    public <T> List<T> findByProperty(Class<T> clazz, SingularAttribute<T, String> propertyName, Object value) {
        EntityManager em = null;
        List<T> retList = null;
        try {
            em = emf.createEntityManager();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<T> cq = cb.createQuery(clazz);
            Root<T> root = cq.from(clazz);
            cq.where(cb.equal(root.get(propertyName), value));
            retList = em.createQuery(cq).getResultList();
        } finally {
            if (em != null) {
                em.close();
            }
        }
        return retList;
    }

    public <T> List<T> findByProperty(Class<T> clazz, String propertyName,
            String value, String matchMode) {
        //convert the value String to lowercase
        value = value.toLowerCase();
        if ("START".equals(matchMode)) {
            value = value + "%";
        } else if ("END".equals(matchMode)) {
            value = "%" + value;
        } else if ("ANYWHERE".equals(matchMode)) {
            value = "%" + value + "%";
        }

        EntityManager em = null;
        em = emf.createEntityManager();

        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<T> cq = cb.createQuery(clazz);
        Root<T> root = cq.from(clazz);
        Expression<String> path = root.get(propertyName);
        cq.where(cb.like(cb.lower(path), value));

        return em.createQuery(cq).getResultList();
    }

    public <T> Path<?> convertStringToPath(Root<T> from, String strPathName) {
        String[] attributes = strPathName.split("\\.");
        Path<?> retPath = from.get(attributes[0]);
        for (int i = 1; i < attributes.length; i++) {
            retPath = retPath.get(attributes[i]);
        }
        return retPath;
    }

    public <T> List<Selection<?>> convertArrToPaths(Root<T> from, String[] selectList) {
        List<Selection<?>> retLists = new LinkedList<Selection<?>>();
        for (String select : selectList) {
            retLists.add(this.convertStringToPath(from, select));
        }
        return retLists;
    }

    public <T> DataTableResults<T> retrievePageRequestDetails(DataTableRequest<T> page) {

        EntityManager em = null;
        List retList = null;
        try {
            em = getEntityManagerFactory().createEntityManager();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<T> cq = cb.createQuery(page.getClassType());
            Root<T> from = cq.from(page.getClassType());
            for (String pathStr : page.getSelects()) {
                String[] attributes = pathStr.split("\\.");
                if (attributes != null && attributes.length > 1) {
                    from.join(attributes[0], JoinType.LEFT);
                }
            }

            cq.multiselect(this.convertArrToPaths(from, page.getSelects()));

            List<Order> orders = page.getOrder();
            if (orders != null) {
                for (Order order : orders) {
                    Integer columnIndex = order.getColumn();
                    DataTableColumnSpecs orderColumn = page.getColumns().get(columnIndex);

                    Path<?> sortPath = this.convertStringToPath(from, orderColumn.getData());
                    if (order.getDir().value().equals("desc")) {
                        cq.orderBy(cb.desc(sortPath));
                    } else {
                        cq.orderBy(cb.asc(sortPath));
                    }
                }
            }

            Predicate predicate = cb.conjunction();

            if (page.getColumns() != null) {
                for (DataTableColumnSpecs column : page.getColumns()) {
                    if (column.getSearch() != null) {
                        predicate = cb.and(predicate, cb.equal(from.get(column.getName()), column.getSearch().getValue()));
                    }
                }
            }

            cq.where(predicate);

            Query query = em.createQuery(cq);

            query.setFirstResult(page.getStart());
            query.setMaxResults(page.getLength());
            retList = query.getResultList();

            DataTableResults<T> dataTableResult = new DataTableResults<>();
            dataTableResult.setData(retList);

            CriteriaQuery<Long> cqLong = cb.createQuery(Long.class);
            Root<T> entity_ = cqLong.from(cq.getResultType());
            cqLong.select(cb.count(entity_));
            for (String pathStr : page.getSelects()) {
                String[] attributes = pathStr.split("\\.");
                if (attributes != null && attributes.length > 1) {
                    entity_.join(attributes[0], JoinType.LEFT);
                }
            }
            Predicate restriction = cq.getRestriction();
            if (restriction != null) {
                cqLong.where(restriction); // Copy restrictions
            }

            Long allCount = em.createQuery(cqLong).getSingleResult();

            dataTableResult.setRecordsTotal(allCount);
            dataTableResult.setRecordsFiltered(allCount);
            dataTableResult.setDraw(page.getDraw());

            return (DataTableResults<T>) dataTableResult;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public EntityManagerFactory getEntityManagerFactory() {
        return emf;
    }
}
