package com.javatmp.demo.validation.service;

import javax.validation.Valid;

import com.javatmp.demo.validation.entity.InputWithCustomValidator;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

@Service
@Validated
class ValidatingServiceWithGroups {

    @Validated(OnCreate.class)
    void validateForCreate(@Valid InputWithCustomValidator input){
      // do something
    }

    @Validated(OnUpdate.class)
    void validateForUpdate(@Valid InputWithCustomValidator input){
        // do something
    }

}
