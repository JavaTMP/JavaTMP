/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.jpa;

import com.javatmp.module.dms.Document;
import com.javatmp.module.dms.Document_;
import com.javatmp.module.user.User;
import com.javatmp.module.user.User_;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.util.JpaDaoHelper;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;
import javax.persistence.EntityManager;
import javax.persistence.Tuple;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Order;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

/**
 *
 * @author JavaTMP
 */
public class TestTupleQuery {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException, ParseException {
        JpaDaoHelper jpaDaoHelper = new JpaDaoHelper("AppPU");
        EntityManager em = jpaDaoHelper.getEntityManagerFactory().createEntityManager();
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
        query.select(criteriaBuilder.tuple(document.get(Document_.contentType), criteriaBuilder.count(document.get(Document_.contentType))));
        query.groupBy(document.get(Document_.contentType));
        resultList = em.createQuery(query).setFirstResult(0).setMaxResults(10).getResultList();
        resultList.forEach(tuple -> {
            System.out.println("first name [" + tuple.getElements().get(0).getAlias() + "]");
//            System.out.println(MvcHelper.deepToString(tuple.getElements()));
            System.out.println(MvcHelper.toString(tuple));
        });

    }
}
