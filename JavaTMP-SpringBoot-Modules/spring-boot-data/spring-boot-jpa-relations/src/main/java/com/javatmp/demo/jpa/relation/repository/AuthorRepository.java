package com.javatmp.demo.jpa.relation.repository;

import com.javatmp.demo.jpa.relation.entity.Author;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthorRepository extends JpaRepository<Author, Long> {
}
