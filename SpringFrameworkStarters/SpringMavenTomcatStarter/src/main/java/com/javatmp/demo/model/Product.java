package com.javatmp.demo.model;

import java.math.BigDecimal;

public class Product {
    private String title;
    private BigDecimal price;

    public Product() { }

    public Product(String title, BigDecimal price) {
        this.title = title;
        this.price = price;
    }

    public String getTitle() {
        return title;
    }

    public BigDecimal getPrice() {
        return price;
    }
}
