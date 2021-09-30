package com.javatmp.demo.jpa.relation.repository;

import com.javatmp.demo.jpa.relation.entity.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookRepository extends JpaRepository<Book, Long> {
}
