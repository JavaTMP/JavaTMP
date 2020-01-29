package com.javatmp.module.user.repository;

import com.javatmp.fw.data.jpa.repository.ExtendedJpaRepository;
import com.javatmp.module.user.entity.User;
import java.util.Optional;

/**
 *
 * @author JavaTMP
 */
public interface UserRepository extends ExtendedJpaRepository<User, Long> {

    Optional<User> findByUserName(String username);
}
