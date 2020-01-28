package com.javatmp.module.user.repository;

import com.javatmp.fw.data.jpa.repository.ExtendedJpaRepository;
import com.javatmp.module.user.entity.User;
import java.util.List;
import org.springframework.data.jpa.repository.Query;

public interface UserStatsRepository extends ExtendedJpaRepository<User, Long> {

    @Query("select MONTH(user.birthDate), count(*) FROM User user group by MONTH(user.birthDate)")
    public List<Object[]> getUsersBirthdayGroupingByMonth();

}
