package com.javatmp.demo.jdbc.converter;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

@Data
@Table
@AllArgsConstructor
class User {

  @Id
  private UserId id;
  private String name;

}
