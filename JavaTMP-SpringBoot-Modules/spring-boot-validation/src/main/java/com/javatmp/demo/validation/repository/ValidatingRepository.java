package com.javatmp.demo.validation.repository;

import com.javatmp.demo.validation.Input;
import org.springframework.data.repository.CrudRepository;

public interface ValidatingRepository extends CrudRepository<Input, Long> {
}
