package com.javatmp.demo.jdbc;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;


@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Student implements Serializable {

	@EqualsAndHashCode.Include
    private String sno;
    private String name;
    private String sex;

}
