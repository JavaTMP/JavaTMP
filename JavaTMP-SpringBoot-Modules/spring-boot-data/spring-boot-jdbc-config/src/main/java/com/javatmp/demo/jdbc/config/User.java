package com.javatmp.demo.jdbc.config;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDate;

@Data
@Table
@AllArgsConstructor
class User {
  @Id
  private Long id;
  private String name;
  private LocalDate birthOfDate;
}
