package com.javatmp.demo.validation.repository;

import com.javatmp.demo.validation.InputWithCustomValidator;
import org.springframework.data.repository.CrudRepository;

public interface ValidatingRepositoryWithCustomValidator extends CrudRepository<InputWithCustomValidator, Long> {
}
