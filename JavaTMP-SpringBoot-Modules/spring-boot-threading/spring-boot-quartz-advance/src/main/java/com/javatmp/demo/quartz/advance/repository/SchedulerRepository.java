package com.javatmp.demo.quartz.advance.repository;

import com.javatmp.demo.quartz.advance.enitiy.SchedulerJobInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SchedulerRepository extends JpaRepository<SchedulerJobInfo, Long> {

}
