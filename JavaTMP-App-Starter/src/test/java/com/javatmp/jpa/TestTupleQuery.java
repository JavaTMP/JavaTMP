/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.jpa;

import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.module.dms.entity.Document;
import com.javatmp.module.dms.entity.Document_;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.entity.User_;
import com.javatmp.module.user.service.UserService;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.Tuple;
import javax.persistence.TupleElement;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

public class TestTupleQuery {

    public static void main(String[] args) throws SQLException, ParseException, InstantiationException, IllegalAccessException, NoSuchMethodException, InvocationTargetException {
        UserService userService;
        userService = new UserService(Persistence.createEntityManagerFactory("AppPU"));
        EntityManager em = userService.getEntityManagerFactory().createEntityManager();
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Tuple> query = criteriaBuilder.createTupleQuery();
        Root<User> user = query.from(User.class);
        query.select(criteriaBuilder.tuple(user.get(User_.firstName), user.get(User_.lastName),
                user.get(User_.profilePicDocument).get(Document_.documentId),
                user.get(User_.profilePicDocument).get(Document_.documentName)));
        List<Tuple> resultList = em.createQuery(query).setFirstResult(0).setMaxResults(1).getResultList();
        resultList.forEach(tuple -> {
            System.out.println("first name [" + tuple.getElements().get(0).getAlias() + "]");
//            System.out.println(MvcHelper.deepToString(tuple.getElements()));
            System.out.println(MvcHelper.toString(tuple));
        });

        query = criteriaBuilder.createTupleQuery();
        Root<Document> document = query.from(Document.class);
        query.select(criteriaBuilder.tuple(document.get(Document_.documentName).alias(Document_.documentName.getName()),
                document.get(Document_.contentType).alias(Document_.contentType.getName()),
                document.get(Document_.status).alias(Document_.status.getName())));
//        query.groupBy(document.get(Document_.contentType));
        resultList = em.createQuery(query).setFirstResult(0).setMaxResults(10).getResultList();
        resultList.forEach(tuple -> {

            List<TupleElement<?>> cols = tuple.getElements();

            for (TupleElement col : cols) {
                System.out.println("[" + col.getAlias() + "] = " + tuple.get(col));
            }

            System.out.println("first name [" + tuple.getElements().get(0).getAlias() + "]");
//            System.out.println(MvcHelper.deepToString(tuple.getElements()));
            System.out.println(MvcHelper.toString(tuple));
        });

        List<Document> auto = createEntityFromTuple(resultList, Document.class);

        query = criteriaBuilder.createTupleQuery();
        document = query.from(Document.class);
        query.select(criteriaBuilder.tuple(document.alias("document")));
//        query.groupBy(document.get(Document_.contentType));
        resultList = em.createQuery(query).setFirstResult(0).setMaxResults(10).getResultList();
        resultList.forEach(tuple -> {

            List<TupleElement<?>> cols = tuple.getElements();

            for (TupleElement col : cols) {
                System.out.println("[" + col.getAlias() + "] = " + tuple.get(col));
            }

            System.out.println("first name [" + tuple.getElements().get(0).getAlias() + "]");
//            System.out.println(MvcHelper.deepToString(tuple.getElements()));
            System.out.println(MvcHelper.toString(tuple));
        });

//        auto = createEntityFromTuple(resultList, Document.class);
//
//        auto.forEach(doc -> {
//            System.out.println(MvcHelper.toString(doc));
//        });
    }

    private static <T> List<T> createEntityFromTuple(List<Tuple> tuples, Class<T> entity) throws InstantiationException, IllegalAccessException, NoSuchMethodException, InvocationTargetException {

        List<T> entities = new ArrayList<>();
        for (Tuple t : tuples) {
            T el;
            try {
                el = entity.getConstructor().newInstance();
            } catch (InstantiationException | IllegalAccessException
                    | NoSuchMethodException | InvocationTargetException e) {
                throw e;
            }
            for (TupleElement<?> te : t.getElements()) {

                Object o = t.get(te);
                System.out.println("object class [" + o.getClass() + "] object [" + o + "]");
                System.out.println(MvcHelper.toString(o));
                try {
                    Field f = getFieldFromEntity(entity, te.getAlias());
                    f.setAccessible(true);
                    f.set(el, o);
                } catch (NoSuchFieldException | IllegalAccessException e1) {

                    throw new NoSuchEntityFieldException(e1.getMessage(), te.getAlias(), entity.getSimpleName());
                }
            }

            entities.add(el);
        }

        return entities;
    }

    private static Field getFieldFromEntity(Class entity, String fieldName) throws
            NoSuchFieldException {

        try {
            return entity.getDeclaredField(fieldName);
        } catch (NoSuchFieldException e) {

            if (entity.getSuperclass() == null) {
                throw e;
            }

            return getFieldFromEntity(entity.getSuperclass(), fieldName);
        }
    }

}

class NoSuchEntityFieldException extends IllegalArgumentException {

    private String field;
    private String entity;

    public NoSuchEntityFieldException(String msg, String field, String entity) {

        super(msg);

        this.field = field;
        this.entity = entity;
    }

    public String getField() {
        return field;
    }

    public String getEntity() {
        return entity;
    }
}
