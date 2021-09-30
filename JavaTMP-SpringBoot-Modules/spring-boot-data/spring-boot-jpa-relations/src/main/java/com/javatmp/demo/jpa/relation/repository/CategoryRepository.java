package com.javatmp.demo.jpa.relation.repository;

import com.javatmp.demo.jpa.relation.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
}
