package com.javatmp.module.activity;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ActivityServiceNew extends JpaRepository<Activity, Long> {

}
