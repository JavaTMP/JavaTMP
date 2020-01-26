package com.javatmp.module.user.repository;

import com.javatmp.fw.data.jpa.repository.ExtendedJpaRepository;
import com.javatmp.module.user.entity.UserActivity;
import java.util.List;
import javax.persistence.Tuple;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserActivityRepository extends ExtendedJpaRepository<UserActivity, Long> {

    @Query("SELECT YEAR(e.creationDate), MONTH(e.creationDate), DAY(e.creationDate), "
            + "HOUR(e.creationDate), MINUTE(e.creationDate), SECOND(e.creationDate) FROM UserActivity e")
    public List<Tuple> userPageViews();
}
