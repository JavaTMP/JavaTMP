package com.javatmp.module.user.service;

import com.javatmp.module.user.entity.Country;
import com.javatmp.module.user.entity.Country_;
import com.javatmp.module.user.entity.Countrytranslation;
import com.javatmp.module.user.entity.CountrytranslationPK_;
import com.javatmp.module.user.entity.Countrytranslation_;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.entity.User_;
import com.javatmp.module.user.repository.UserStatsRepository;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.ListJoin;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class UserStatsService {

    private EntityManager em;
    private UserStatsRepository userStatsRepository;

    public UserStatsService(EntityManager entityManager, UserStatsRepository userStatsRepository) {
        this.em = entityManager;
        this.userStatsRepository = userStatsRepository;
    }

    public List<Object[]> overallUsersStatuses() {
        List<Object[]> results;

        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = cb.createQuery(Object[].class);
        Root<User> root = query.from(User.class);
        query.multiselect(root.get(User_.status), cb.count(root.get(User_.status)));
        query.groupBy(root.get(User_.status));
        results = em.createQuery(query).getResultList();
        return results;

    }

    public List<Object[]> usersGenderGrouping() {
        List<Object[]> results;

        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = cb.createQuery(Object[].class);
        Root<User> root = query.from(User.class);
        query.multiselect(root.get(User_.gender), cb.count(root.get(User_.gender)));
        query.groupBy(root.get(User_.gender));
        results = em.createQuery(query).getResultList();

        return results;

    }

    public List<Object[]> usersCountriesGrouping() {
        List<Object[]> results;

        Query query = em.createQuery("select ctr.countryName, count(ctr.countryName)\n"
                + "from User u\n"
                + "join Country c on u.countryId = c.countryId\n"
                + "join Countrytranslation ctr on c.countryId = ctr.countrytranslationPK.countryId\n"
                + "and ctr.countrytranslationPK.langId = 'en'\n"
                + "group by u.countryId");
        results = query.getResultList();
        return results;

    }

    public List<Object[]> usersCountriesGroupingByCriteria() {
        List<Object[]> results;
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

    }

    public List<Object[]> usersBirthdayGroupingByMonth() {
        List<Object[]> results;

        Query query = em.createQuery(
                "SELECT MONTH(user.birthDate) , count(*) FROM User user group by MONTH(user.birthDate)");
        List resultList = query.getResultList();
        return resultList;
    }

    public Long usersVistingToday() {
        Long results;

        Query query = em.createQuery(
                "SELECT count(*) FROM User user where user.lastAccessTime >= CURRENT_DATE");
        results = (Long) query.getSingleResult();
        return results;
    }

    public Long usersNotVistingToday() {
        Long results;

        Query query = em.createQuery(
                "SELECT count(*) FROM User user where user.lastAccessTime < CURRENT_DATE or user.lastAccessTime is null");
        results = (Long) query.getSingleResult();
        return results;
    }

}
