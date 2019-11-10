package com.javatmp.module.activity;

import com.javatmp.util.JpaDaoHelper;
import com.javatmp.module.activity.Activity;
import java.util.List;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceException;
import javax.persistence.Query;
import javax.persistence.Tuple;

public class ActivityService {

    private final Logger logger = Logger.getLogger(getClass().getName());
    private final JpaDaoHelper jpaDaoHelper;

    public ActivityService(JpaDaoHelper jpaDaoHelper) {
        this.jpaDaoHelper = jpaDaoHelper;
    }

    public Activity createActivity(Activity activity) {

        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            em.getTransaction().begin();
            em.persist(activity);
            em.getTransaction().commit();
            return activity;
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
    }

    public Activity updateActivity(Activity activity) {

        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            em.getTransaction().begin();
            em.merge(activity);
            em.getTransaction().commit();
            return activity;
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
    }

    public List userPageViews() {
        EntityManager em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();

        Query query = em.createQuery(
                "SELECT YEAR(e.creationDate), MONTH(e.creationDate), DAY(e.creationDate), "
                + "HOUR(e.creationDate), MINUTE(e.creationDate), SECOND(e.creationDate) FROM Activity e",
                Tuple.class);
        List resultList = query.getResultList();
        System.out.println(resultList);
        em.close();
        return resultList;
    }

    public List userPageViewsActivitiesPerHour() {
        EntityManager em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();

        Query query = em.createQuery(
                "SELECT HOUR(e.creationDate) , count(*) FROM Activity e group by HOUR(e.creationDate)");
        List resultList = query.getResultList();
        em.close();
        return resultList;
    }

    public List avgPagesLoadTimePerHour() {
        EntityManager em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();

        Query query = em.createQuery(
                "SELECT HOUR(e.creationDate) , avg(e.timeLast) FROM Activity e group by HOUR(e.creationDate)");
        List resultList = query.getResultList();
        em.close();
        return resultList;
    }

}
