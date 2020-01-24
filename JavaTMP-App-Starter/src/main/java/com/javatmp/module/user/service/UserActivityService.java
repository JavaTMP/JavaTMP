package com.javatmp.module.user.service;

import com.javatmp.module.user.entity.UserActivity;
import com.javatmp.module.user.repository.UserActivityRepository;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceException;
import javax.persistence.Query;
import javax.persistence.Tuple;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.jpa.repository.support.JpaEntityInformation;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class UserActivityService extends SimpleJpaRepository<UserActivity, Long> {

    private UserActivityRepository userActivityRepository;

    private final EntityManager em;

    public UserActivityService(UserActivityRepository userActivityRepository, JpaEntityInformation<UserActivity, Long> entityInformation, EntityManager entityManager) {
        super(entityInformation, entityManager);
        this.em = entityManager;
    }

    public List userPageViews() {

        Query query = em.createQuery(
                "SELECT YEAR(e.creationDate), MONTH(e.creationDate), DAY(e.creationDate), "
                + "HOUR(e.creationDate), MINUTE(e.creationDate), SECOND(e.creationDate) FROM UserActivity e",
                Tuple.class);
        List resultList = query.getResultList();
        System.out.println(resultList);
        return resultList;

    }

    public List userPageViewsActivitiesPerHour() {
        EntityManager em = null;
        try {
            em = this.emf.createEntityManager();
            Query query = em.createQuery(
                    "SELECT HOUR(e.creationDate) , count(*) FROM UserActivity e group by HOUR(e.creationDate)");
            List resultList = query.getResultList();
            return resultList;
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
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List avgPagesLoadTimePerHour() {
        EntityManager em = null;
        try {
            em = this.emf.createEntityManager();
            Query query = em.createQuery(
                    "SELECT HOUR(e.creationDate) , avg(e.timeLast) FROM UserActivity e group by HOUR(e.creationDate)");
            List resultList = query.getResultList();
            return resultList;
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
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

}
