package com.javatmp.demo.jpa.repository;

import com.javatmp.demo.jpa.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> {

}
