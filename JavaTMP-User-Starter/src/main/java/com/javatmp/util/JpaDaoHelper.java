package com.javatmp.util;

import com.javatmp.mvc.domain.table.DataTableColumnSpecs;
import com.javatmp.mvc.domain.table.DataTableRequest;
import com.javatmp.mvc.domain.table.DataTableResults;
import com.javatmp.mvc.domain.table.Order;
import com.javatmp.mvc.domain.table.RuleOrGroup;
import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

    public <T> Path<T> convertStringToPath(Root<T> from, String strPathName) {
        String[] attributes = strPathName.split("\\.");
        Path<T> retPath = from.get(attributes[0]);
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

    public <T> DataTableResults<T> retrievePageRequestDetails(DataTableRequest<T> page) throws ParseException {

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
                    if (column.getSearch() != null && column.getSearch().getValue() != null
                            && !column.getSearch().getValue().trim().equals("")) {
                        if ("olderThan".equals(column.getSearch().getOperatorType())) {
                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
                            Date searchDate = sdf.parse(column.getSearch().getValue());
                            predicate = cb.and(predicate, cb.lessThan(from.get(column.getName()), (Comparable) searchDate));
                        } else if ("newerThan".equals(column.getSearch().getOperatorType())) {
                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
                            Date searchDate = sdf.parse(column.getSearch().getValue());
                            predicate = cb.and(predicate, cb.greaterThan(from.get(column.getName()), (Comparable) searchDate));
                        } else if ("equalThan".equals(column.getSearch().getOperatorType())) {
                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
                            Date searchDate = sdf.parse(column.getSearch().getValue());
                            predicate = cb.and(predicate, cb.equal(from.get(column.getName()), (Comparable) searchDate));
                        } else {
                            predicate = cb.and(predicate, cb.equal(from.get(column.getName()), column.getSearch().getValue()));
                        }
                    }
                }
            }

            // apply advanced filtration using RuleOrGroup object:
            System.err.println("tableRequest.getAdvancedSearchQuery() [" + page.getAdvancedSearchQuery() + "]");
            if (page.getAdvancedSearchQuery() != null) {
                predicate = cb.and(predicate, applyAdvanedSearchQuery(page.getAdvancedSearchQuery(), cb, from));
                System.out.println();
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

    public <T> Predicate applyAdvanedSearchQuery(RuleOrGroup ruleOrGroup, CriteriaBuilder cb, Root<T> from) throws ParseException {
        Predicate retPredicate = null;
        String condition = ruleOrGroup.getCondition();
        if (condition != null) {
            // Group node:
//            System.out.println("Condition [" + condition + "] rule node of [" + ruleOrGroup.getRules().size() + "]");
            if (condition.equals("AND")) {
                retPredicate = cb.conjunction();
                System.out.print("(");
                for (int i = 0; i < ruleOrGroup.getRules().size(); i++) {
                    RuleOrGroup child = ruleOrGroup.getRules().get(i);
                    retPredicate = cb.and(retPredicate, applyAdvanedSearchQuery(child, cb, from));
                    if (i < (ruleOrGroup.getRules().size() - 1)) {
                        System.out.print(" AND ");
                    }
                }
                System.out.print(")");
            } else if (condition.equals("OR")) {
                retPredicate = cb.disjunction();
                System.out.print("(");
                for (int i = 0; i < ruleOrGroup.getRules().size(); i++) {
                    RuleOrGroup child = ruleOrGroup.getRules().get(i);
                    retPredicate = cb.or(retPredicate, applyAdvanedSearchQuery(child, cb, from));
                    if (i < (ruleOrGroup.getRules().size() - 1)) {
                        System.out.print(" OR ");
                    }
                }
                System.out.print(")");
            }
        } else {
            // leaf rule node:
//            System.out.println("rule node [" + MvcHelper.deepToString(ruleOrGroup));
            System.out.print("(");
            System.out.print(ruleOrGroup.getField() + " " + ruleOrGroup.getOperator() + " " + ruleOrGroup.getValue());
            System.out.print(")");
            String opt = ruleOrGroup.getOperator();

            Object value = ruleOrGroup.getValue();
            String type = ruleOrGroup.getType();

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat dateTimeFormatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");

            if (type.equals("date") && !opt.equals("between") && !opt.equals("not_between")) {
                value = sdf.parse(value.toString());
            }
            if (type.equals("datetime") && !opt.equals("between") && !opt.equals("not_between")) {
                value = dateTimeFormatter.parse(value.toString());
            }

            if (opt.equals("equal")) {
                retPredicate = cb.equal(convertStringToPath(from, ruleOrGroup.getField()), value);
            } else if (opt.equals("not_equal")) {
                retPredicate = cb.notEqual(convertStringToPath(from, ruleOrGroup.getField()), value);
            } else if (opt.equals("less")) {
                retPredicate = cb.lessThan((Expression<Comparable>) convertStringToPath(from, ruleOrGroup.getField()), (Comparable) value);
            } else if (opt.equals("less_or_equal")) {
                retPredicate = cb.lessThanOrEqualTo((Expression<Comparable>) convertStringToPath(from, ruleOrGroup.getField()), (Comparable) value);
            } else if (opt.equals("greater")) {
                retPredicate = cb.greaterThan((Expression<Comparable>) convertStringToPath(from, ruleOrGroup.getField()), (Comparable) value);
            } else if (opt.equals("greater_or_equal")) {
                retPredicate = cb.greaterThanOrEqualTo((Expression<Comparable>) convertStringToPath(from, ruleOrGroup.getField()), (Comparable) value);
            } else if (opt.equals("is_null")) {
                retPredicate = cb.isNull(convertStringToPath(from, ruleOrGroup.getField()));
            } else if (opt.equals("is_not_null")) {
                retPredicate = cb.isNotNull(convertStringToPath(from, ruleOrGroup.getField()));
            } else if (opt.equals("begins_with")) {
                retPredicate = cb.like((Expression<String>) convertStringToPath(from, ruleOrGroup.getField()), (String) value + "%");
            } else if (opt.equals("ends_with")) {
                retPredicate = cb.like((Expression<String>) convertStringToPath(from, ruleOrGroup.getField()), "%" + (String) value);
            } else if (opt.equals("contains")) {
                retPredicate = cb.like((Expression<String>) convertStringToPath(from, ruleOrGroup.getField()), "%" + (String) value + "%");
            } else if (opt.equals("not_begins_with")) {
                retPredicate = cb.notLike((Expression<String>) convertStringToPath(from, ruleOrGroup.getField()), (String) value + "%");
            } else if (opt.equals("not_ends_with")) {
                retPredicate = cb.notLike((Expression<String>) convertStringToPath(from, ruleOrGroup.getField()), "%" + (String) value);
            } else if (opt.equals("not_contains")) {
                retPredicate = cb.notLike((Expression<String>) convertStringToPath(from, ruleOrGroup.getField()), "%" + (String) value + "%");
            } else if (opt.equals("in")) {
                // we should split value for list of proper type
                retPredicate = cb.equal(convertStringToPath(from, ruleOrGroup.getField()), value);
            } else if (opt.equals("not_in")) {
                // we should split value for list of proper type
                retPredicate = cb.not(cb.equal(convertStringToPath(from, ruleOrGroup.getField()), value));
            } else if (opt.equals("between")) {
                // we should split value for list of proper type
                if (type.equals("date")) {
                    List temp = (List) value;
                    List<Date> valueList = new LinkedList<>();
                    for (Object t : temp) {
                        valueList.add(sdf.parse(t.toString()));
                    }
                    retPredicate = cb.between((Expression<Date>) convertStringToPath(from, ruleOrGroup.getField()), valueList.get(0), valueList.get(1));
                } else if (type.equals("datetime")) {
                    List temp = (List) value;
                    List<Date> valueList = new LinkedList<>();
                    for (Object t : temp) {
                        valueList.add(dateTimeFormatter.parse(t.toString()));
                    }
                    retPredicate = cb.between((Expression<Date>) convertStringToPath(from, ruleOrGroup.getField()), valueList.get(0), valueList.get(1));
                } else {
                    List<Double> valueList = (List) value;
                    retPredicate = cb.between((Expression<Double>) convertStringToPath(from, ruleOrGroup.getField()), valueList.get(0), valueList.get(1));
                }

            } else if (opt.equals("not_between")) {
                if (type.equals("date")) {
                    List temp = (List) value;
                    List<Date> valueList = new LinkedList<>();
                    for (Object t : temp) {
                        valueList.add(sdf.parse(t.toString()));
                    }
                    retPredicate = cb.not(cb.between((Expression<Date>) convertStringToPath(from, ruleOrGroup.getField()), valueList.get(0), valueList.get(1)));
                } else if (type.equals("datetime")) {
                    List temp = (List) value;
                    List<Date> valueList = new LinkedList<>();
                    for (Object t : temp) {
                        valueList.add(dateTimeFormatter.parse(t.toString()));
                    }
                    retPredicate = cb.not(cb.between((Expression<Date>) convertStringToPath(from, ruleOrGroup.getField()), valueList.get(0), valueList.get(1)));
                } else {
                    List<Double> valueList = (List) value;
                    retPredicate = cb.not(cb.between((Expression<Double>) convertStringToPath(from, ruleOrGroup.getField()), valueList.get(0), valueList.get(1)));
                }
            } else {
                retPredicate = cb.equal(convertStringToPath(from, ruleOrGroup.getField()), value);
            }

        }
        return retPredicate;
    }

    public EntityManagerFactory getEntityManagerFactory() {
        return emf;
    }
}
