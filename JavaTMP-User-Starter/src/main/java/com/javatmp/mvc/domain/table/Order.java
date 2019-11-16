package com.javatmp.mvc.domain.table;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Order {

    private Integer column;
    private OrderDir dir;

    public Order() {
    }

    public Order(Integer column, OrderDir dir) {
        this.column = column;
        this.dir = dir;
    }
}
