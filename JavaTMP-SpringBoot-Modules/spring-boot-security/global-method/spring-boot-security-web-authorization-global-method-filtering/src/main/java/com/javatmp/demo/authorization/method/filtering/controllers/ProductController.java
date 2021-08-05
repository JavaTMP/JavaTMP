package com.javatmp.demo.authorization.method.filtering.controllers;

import com.javatmp.demo.authorization.method.filtering.model.Product;
import com.javatmp.demo.authorization.method.filtering.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@RestController
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping("/sell")
    public List<Product> sellProduct() {
        List<Product> products = new ArrayList<>();

        products.add(new Product("beer", "nikolai"));
        products.add(new Product("candy", "nikolai"));
        products.add(new Product("chocolate", "julien"));

        return productService.sellProducts(products);
    }

    @GetMapping("/sell-immutable")
    public List<Product> sellProductImmutable() {
        List<Product> products = new ArrayList<>();

        products.add(new Product("beer", "nikolai"));
        products.add(new Product("candy", "nikolai"));
        products.add(new Product("chocolate", "julien"));

        products = Collections.unmodifiableList(products);

        return productService.sellProducts(products);
    }

    @GetMapping("/find")
    public List<Product> findProducts() {
        return productService.findProducts();
    }

}
