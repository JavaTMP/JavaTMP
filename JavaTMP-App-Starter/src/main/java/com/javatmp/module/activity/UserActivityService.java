package com.javatmp.module.activity;

import com.javatmp.fw.data.jpa.repository.JpaRepository;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceException;
import javax.persistence.Query;
import javax.persistence.Tuple;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class UserActivityService extends JpaRepository<Activity, Long> {

    public UserActivityService(EntityManagerFactory emf) {
        super(Activity.class, emf);
    }

    public List userPageViews() {
        EntityManager em = null;
        try {
            em = this.emf.createEntityManager();

            Query query = em.createQuery(
                    "SELECT YEAR(e.creationDate), MONTH(e.creationDate), DAY(e.creationDate), "
                    + "HOUR(e.creationDate), MINUTE(e.creationDate), SECOND(e.creationDate) FROM Activity e",
                    Tuple.class);
            List resultList = query.getResultList();
            System.out.println(resultList);
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

    public List userPageViewsActivitiesPerHour() {
        EntityManager em = null;
        try {
            em = this.emf.createEntityManager();
            Query query = em.createQuery(
                    "SELECT HOUR(e.creationDate) , count(*) FROM Activity e group by HOUR(e.creationDate)");
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
                    "SELECT HOUR(e.creationDate) , avg(e.timeLast) FROM Activity e group by HOUR(e.creationDate)");
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
