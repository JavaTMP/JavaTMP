package com.javatmp.demo.jdbc;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Customer {

    @EqualsAndHashCode.Include
    private long id;
    private String firstName;
    private String lastName;

}
