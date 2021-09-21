package com.javatmp.demo.ms.simple;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Source {
    private int foo;
    private Long bar;
    private int qax;
    private Long baz;
    private int zip;
}
