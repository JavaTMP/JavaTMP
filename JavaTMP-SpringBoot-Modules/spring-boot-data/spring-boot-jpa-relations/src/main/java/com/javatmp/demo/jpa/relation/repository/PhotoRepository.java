package com.javatmp.demo.jpa.relation.repository;

import com.javatmp.demo.jpa.relation.entity.Photo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PhotoRepository extends JpaRepository<Photo, Long> {
}
