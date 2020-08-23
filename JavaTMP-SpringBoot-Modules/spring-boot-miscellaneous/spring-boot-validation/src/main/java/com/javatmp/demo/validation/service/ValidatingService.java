package com.javatmp.demo.validation.service;

import javax.validation.Valid;

import com.javatmp.demo.validation.entity.Input;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

@Service
@Validated
class ValidatingService {

    void validateInput(@Valid Input input){
      // do something
    }

}
