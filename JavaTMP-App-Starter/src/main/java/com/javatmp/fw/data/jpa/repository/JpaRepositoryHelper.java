package com.javatmp.fw.data.jpa.repository;

import com.javatmp.fw.domain.table.DataTableColumn;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.fw.domain.table.Order;
import com.javatmp.fw.domain.table.RuleOrGroup;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.function.Function;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.Selection;

public class JpaRepositoryHelper {

    public static <E> DataTableResults<E> getList(Function<EntityManager, DataTableResults<E>> operation, EntityManager em) {
        try {
            return operation.apply(em);
        } catch (Throwable t1) {
            try {
                em.getTransaction().rollback();
            } catch (Throwable t2) {
                t2.initCause(t1);
                throw t2;
            }
            throw t1;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public static <E> Path<E> convertStringToPath(Root<E> from, String strPathName) {
//        System.out.println("handling str [" + strPathName + "]");
        String[] attributes = strPathName.split("\\.");
        Path<E> retPath = from.get(attributes[0]);
        if (attributes.length > 1) {
            System.out.println("Try to get Alias :");
            Join<?, ?> join = null;
            for (Join j : from.getJoins()) {
                if (j.getAttribute().getName().equals(attributes[0])) {
                    join = j;
                    break;
                }
            }
            if (join == null) {
                System.out.println("join root with [" + attributes[0] + "]");
                join = from.join(attributes[0], JoinType.LEFT);
            }
            for (int i = 1; i < attributes.length; i++) {
                System.out.println("attr [" + attributes[i] + "] i [" + i + "] len [" + attributes.length + "]");
                retPath = retPath.get(attributes[i]);
                if (i < (attributes.length - 1)) {
                    boolean find = false;
                    for (Join j : join.getJoins()) {
                        System.out.println("is att [" + j.getAttribute().getName() + "] e [" + attributes[i] + "]");
                        if (j.getAttribute().getName().equals(attributes[i])) {
                            join = j;
                            System.out.println("find [" + attributes[i] + "] with [" + j.getAttribute().getName() + "]");
                            find = true;
                            break;
                        }
                    }
                    if (find == false) {
                        System.out.println("join [" + attributes[i - 1] + "] with [" + attributes[i] + "]");
                        join = join.join(attributes[i], JoinType.LEFT);
                    }
//                    join.getJoins().stream().forEach(ele -> {
//                        System.out.println("getAlias [" + ele.getAttribute().getName() + "]");
//                    });

                }
            }
        }
        return retPath;
    }

    public static <E> List<Selection<?>> convertArrToPaths(Root<E> from, String[] selectList) {
        List<Selection<?>> retLists = new LinkedList<Selection<?>>();
        for (String select : selectList) {
            retLists.add(JpaRepositoryHelper.convertStringToPath(from, select));
        }
        return retLists;
    }

    public static <E> DataTableResults<E> retrievePageRequestDetails(DataTableRequest<E> page, EntityManager em) throws ParseException {

        List retList = null;
        try {
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<E> cq = cb.createQuery(page.getClassType());
            Root<E> from = cq.from(page.getClassType());
            for (String pathStr : page.getSelects()) {
                String[] attributes = pathStr.split("\\.");
                if (attributes != null && attributes.length > 1) {
                    from.join(attributes[0], JoinType.LEFT);
                }
            }

            cq.multiselect(JpaRepositoryHelper.convertArrToPaths(from, page.getSelects()));

            List<Order> orders = page.getOrder();
            if (orders != null) {
                for (Order order : orders) {
                    Integer columnIndex = order.getColumn();
                    DataTableColumn orderColumn = page.getColumns().get(columnIndex);

                    Path<?> sortPath = JpaRepositoryHelper.convertStringToPath(from, orderColumn.getData());
                    if (order.getDir().value().equals("desc")) {
                        cq.orderBy(cb.desc(sortPath));
                    } else {
                        cq.orderBy(cb.asc(sortPath));
                    }
                }
            }

            Predicate predicate = cb.conjunction();

            if (page.getColumns() != null) {
                for (DataTableColumn column : page.getColumns()) {
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

            DataTableResults<E> dataTableResult = new DataTableResults<>();
            dataTableResult.setData(retList);

            CriteriaQuery<Long> cqLong = cb.createQuery(Long.class);
            Root<E> entity_ = cqLong.from(cq.getResultType());
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

            return (DataTableResults<E>) dataTableResult;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public static <E> Predicate applyAdvanedSearchQuery(RuleOrGroup ruleOrGroup, CriteriaBuilder cb, Root<E> from) throws ParseException {
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
//            System.out.println("rule node [" + (ruleOrGroup));
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

}
