package com.javatmp.module.stats;

import com.javatmp.util.JpaDaoHelper;
import com.javatmp.module.country.Country_;
import com.javatmp.module.user.User;
import com.javatmp.module.user.User_;
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

    public List<Object[]> usersCountriesGrouping() {
        List<Object[]> results;
        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<Object[]> query = cb.createQuery(Object[].class);
            Root<User> root = query.from(User.class);
//            Join<User, Country> join1 = root.join(User_.country, JoinType.LEFT);
            query.multiselect(root.get(User_.country).get(Country_.countryName), cb.count(root.get(User_.country).get(Country_.countryName)));
            query.groupBy(root.get(User_.country).get(Country_.countryName));
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

    public Long usersVistingToday() {
        Long results;
        EntityManager em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();

        Query query = em.createQuery(
                "SELECT count(*) FROM User user where user.lastAccessTime >= CURRENT_DATE");
        results = (Long) query.getSingleResult();
        em.close();
        return results;
    }

    public Long usersNotVistingToday() {
        Long results;
        EntityManager em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();

        Query query = em.createQuery(
                "SELECT count(*) FROM User user where user.lastAccessTime < CURRENT_DATE or user.lastAccessTime is null");
        results = (Long) query.getSingleResult();
        em.close();
        return results;
    }

}
