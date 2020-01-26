package com.javatmp.module.user.service;

import com.javatmp.module.user.repository.UserActivityRepository;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.Tuple;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class UserActivityService {

    private UserActivityRepository userActivityRepository;

    private final EntityManager em;

    public UserActivityService(UserActivityRepository userActivityRepository, EntityManager entityManager) {
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
        Query query = em.createQuery(
                "SELECT HOUR(e.creationDate) , count(*) FROM UserActivity e group by HOUR(e.creationDate)");
        List resultList = query.getResultList();
        return resultList;

    }

    public List avgPagesLoadTimePerHour() {
        Query query = em.createQuery(
                "SELECT HOUR(e.creationDate) , avg(e.timeLast) FROM UserActivity e group by HOUR(e.creationDate)");
        List resultList = query.getResultList();
        return resultList;

    }

}
