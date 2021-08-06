package com.javatmp.demo.authorization.method.filtering.jpa.repositories;

import com.javatmp.demo.authorization.method.filtering.jpa.entities.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.security.access.prepost.PostFilter;

import java.util.List;

public interface ProductRepository
        extends JpaRepository<Product, Integer> {

    @PostFilter("filterObject.owner == authentication.principal.username")
    List<Product> findProductByNameContains(String text);
}
