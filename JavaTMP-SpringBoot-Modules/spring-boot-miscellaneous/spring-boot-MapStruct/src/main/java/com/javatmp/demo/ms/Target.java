package com.javatmp.demo.ms;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Target {
    private Long foo;
    private int bar;
    private Long baz;
    private int qax;
    private String zip;
}
