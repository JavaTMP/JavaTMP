package com.javatmp.demo.db.repository1;

import com.javatmp.demo.db.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository1 extends JpaRepository<User, Long> {

    Optional<User> findByUserName(String username);
}
