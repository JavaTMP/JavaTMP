package com.javatmp.module.stats.controller;

import com.javatmp.fw.data.jpa.repository.JpaRepository;
import com.javatmp.module.country.entity.Country;
import com.javatmp.module.country.entity.Country_;
import com.javatmp.module.country.entity.Countrytranslation;
import com.javatmp.module.country.entity.CountrytranslationPK_;
import com.javatmp.module.country.entity.Countrytranslation_;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.entity.User_;
import java.util.List;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceException;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.ListJoin;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

public class UserStatsService extends JpaRepository<Object[], Long> {

    private final Logger logger = Logger.getLogger(getClass().getName());

    public UserStatsService(EntityManagerFactory emf) {
        super(Object[].class, emf);
    }

    public List<Object[]> overallUsersStatuses() {
        List<Object[]> results;
        EntityManager em = null;
        try {
            em = this.emf.createEntityManager();
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
            em = this.emf.createEntityManager();
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
            throw new PersistenceException(lastMsg, t);
        }
    }

    public List<Object[]> usersCountriesGrouping() {
        List<Object[]> results;
        EntityManager em = null;
        try {
            em = this.emf.createEntityManager();
            Query query = em.createQuery("select ctr.countryName, count(ctr.countryName)\n"
                    + "from User u\n"
                    + "join Country c on u.countryId = c.countryId\n"
                    + "join Countrytranslation ctr on c.countryId = ctr.countrytranslationPK.countryId\n"
                    + "and ctr.countrytranslationPK.langId = 'en'\n"
                    + "group by u.countryId");
            results = query.getResultList();
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
            throw new PersistenceException(lastMsg, t);
        } finally {
            if (em != null) {
                em.close();
            }

        }
    }

    public List<Object[]> usersCountriesGroupingByCriteria() {
        List<Object[]> results;
        EntityManager em = null;
        try {
            em = this.emf.createEntityManager();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<Object[]> query = cb.createQuery(Object[].class);
            Root<User> root = query.from(User.class);
            Join<User, Country> userCountry = root.join(User_.country, JoinType.INNER);
            ListJoin<Country, Countrytranslation> countryTr = userCountry.join(Country_.countrytranslationList, JoinType.LEFT);
            query.multiselect(countryTr.get(Countrytranslation_.countryName), cb.count(countryTr.get(Countrytranslation_.countryName)));
            Predicate pr = cb.equal(countryTr.get(Countrytranslation_.countrytranslationPK).get(CountrytranslationPK_.langId), "en");
            query.where(pr);
            query.groupBy(root.get(User_.country).get(Country_.countryId));
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
            throw new PersistenceException(lastMsg, t);
        }
    }

    public List<Object[]> usersBirthdayGroupingByMonth() {
        List<Object[]> results;
        EntityManager em = this.emf.createEntityManager();

        Query query = em.createQuery(
                "SELECT MONTH(user.birthDate) , count(*) FROM User user group by MONTH(user.birthDate)");
        List resultList = query.getResultList();
        em.close();
        return resultList;
    }

    public Long usersVistingToday() {
        Long results;
        EntityManager em = this.emf.createEntityManager();

        Query query = em.createQuery(
                "SELECT count(*) FROM User user where user.lastAccessTime >= CURRENT_DATE");
        results = (Long) query.getSingleResult();
        em.close();
        return results;
    }

    public Long usersNotVistingToday() {
        Long results;
        EntityManager em = this.emf.createEntityManager();

        Query query = em.createQuery(
                "SELECT count(*) FROM User user where user.lastAccessTime < CURRENT_DATE or user.lastAccessTime is null");
        results = (Long) query.getSingleResult();
        em.close();
        return results;
    }

}
