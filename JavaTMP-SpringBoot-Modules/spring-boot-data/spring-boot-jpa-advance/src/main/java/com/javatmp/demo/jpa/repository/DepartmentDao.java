package com.javatmp.demo.jpa.repository;

import com.javatmp.demo.jpa.entity.Department;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DepartmentDao extends JpaRepository<Department, Long> {

    List<Department> findDepartmentsByLevels(Integer level);
}
