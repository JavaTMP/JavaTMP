package com.javatmp.demo.repository1;

import com.javatmp.demo.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository1 extends JpaRepository<User, Long> {

    Optional<User> findByUserName(String username);
}
