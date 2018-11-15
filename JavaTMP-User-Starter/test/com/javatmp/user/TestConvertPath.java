/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.user;

import com.javatmp.module.user.User;
import com.javatmp.domain.User_;
import com.javatmp.util.JpaDaoHelper;
import com.javatmp.module.user.UserService;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceException;
import javax.persistence.Query;
import javax.persistence.Tuple;
import javax.persistence.TupleElement;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Root;

/**
 *
 * @author JavaTMP
 */
public class TestConvertPath {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        JpaDaoHelper jpaDaoHelper;
        UserService userService;
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        userService = new UserService(jpaDaoHelper);
        EntityManager em = null;
        try {
            em = jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            CriteriaBuilder cb = em.getCriteriaBuilder();
//            CriteriaQuery<User> cq = cb.createQuery(User.class);
            CriteriaQuery<Tuple> cq = cb.createTupleQuery();
            Root<User> from = cq.from(User.class);
            from.join(User_.profilePicDocument, JoinType.LEFT);

            cq.multiselect(jpaDaoHelper.convertArrToPaths(from, new String[]{
                "id", "userName", "firstName", "lastName",
                "profilePicDocument.documentId", "profilePicDocument.randomHash"}));
            Path<?> sortPath = jpaDaoHelper.convertStringToPath(from, "id");
            String sortOrder = "asc";
            if (sortOrder.equals("asc")) {
                cq.orderBy(cb.asc(sortPath));
            } else {
                cq.orderBy(cb.desc(sortPath));
            }

            Query query = em.createQuery(cq);
            query.setFirstResult(0);
            query.setMaxResults(1);
            List<Tuple> retList = query.getResultList();
            for (Tuple tuple : retList) {
                for (TupleElement<?> e : tuple.getElements()) {
                    System.out.println(tuple.get(e));
                }

            }
        } catch (PersistenceException e) {
            Throwable t = e;
            while (t != null) {
                System.out.println("type [" + e.getClass().getName() + "]");
                System.out.println("e [" + e.getMessage() + "]");
                t = t.getCause();
            }
        }

    }

}
