package com.javatmp.service;

import com.javatmp.db.JpaDaoHelper;
import com.javatmp.domain.User;
import com.javatmp.domain.User_;
import java.util.List;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceException;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

public class UserStatsService {

    private final Logger logger = Logger.getLogger(getClass().getName());
    private final JpaDaoHelper jpaDaoHelper;

    public UserStatsService(JpaDaoHelper jpaDaoHelper) {
        this.jpaDaoHelper = jpaDaoHelper;
    }

    public List<Object[]> overallUsersStatuses() {
        List<Object[]> results;
        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<Object[]> query = cb.createQuery(Object[].class);
            Root<User> root = query.from(User.class);
            query.multiselect(root.get(User_.status), cb.count(root.get(User_.status)));
            query.groupBy(root.get(User_.status));
            results = em.createQuery(query).getResultList();

            return results;
        } catch (PersistenceException e) {
            Throwable t = e;
            String lastMsg = e.getMessage();
            while (t != null) {
                System.out.println("type [" + t.getClass().getName() + "]");
                System.out.println("e [" + t.getMessage() + "]");
                lastMsg = t.getMessage();
                t = t.getCause();

            }
            throw new PersistenceException(lastMsg, e);
        }
    }

    public List<Object[]> usersGenderGrouping() {
        List<Object[]> results;
        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<Object[]> query = cb.createQuery(Object[].class);
            Root<User> root = query.from(User.class);
            query.multiselect(root.get(User_.gender), cb.count(root.get(User_.gender)));
            query.groupBy(root.get(User_.gender));
            results = em.createQuery(query).getResultList();

            return results;
        } catch (PersistenceException e) {
            Throwable t = e;
            String lastMsg = e.getMessage();
            while (t != null) {
                System.out.println("type [" + t.getClass().getName() + "]");
                System.out.println("e [" + t.getMessage() + "]");
                lastMsg = t.getMessage();
                t = t.getCause();

            }
            throw new PersistenceException(lastMsg, e);
        }
    }

    public List<Object[]> usersBirthdayGroupingByMonth() {
        List<Object[]> results;
        EntityManager em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();

        Query query = em.createQuery(
                "SELECT MONTH(user.birthDate) , count(*) FROM User user group by MONTH(user.birthDate)");
        List resultList = query.getResultList();
        em.close();
        return resultList;
    }

}
