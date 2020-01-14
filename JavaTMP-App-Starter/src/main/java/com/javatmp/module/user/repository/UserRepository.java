package com.javatmp.module.user.repository;

import com.javatmp.module.user.entity.User;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author JavaTMP
 */
public interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findByUserName(String email);
}
