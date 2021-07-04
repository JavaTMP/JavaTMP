package com.javatmp.demo.validation.service;

import com.javatmp.demo.validation.entity.Input;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import javax.validation.ConstraintViolationException;

import static org.junit.jupiter.api.Assertions.assertThrows;

@ExtendWith(SpringExtension.class)
@SpringBootTest
class ProgrammaticallyValidatingServiceTest {

    @Autowired
    private ProgrammaticallyValidatingService service;

    @Test
    void whenInputIsInvalid_thenThrowsException() {
        Input input = new Input();
        input.setNumberBetweenOneAndTen(0);
        input.setIpAddress("invalid");

        assertThrows(ConstraintViolationException.class, () -> {
            service.validateInput(input);
        });
    }

    @Test
    void givenInjectedValidator_whenInputIsInvalid_thenThrowsException() {
        Input input = new Input();
        input.setNumberBetweenOneAndTen(0);
        input.setIpAddress("invalid");

        assertThrows(ConstraintViolationException.class, () -> {
            service.validateInputWithInjectedValidator(input);
        });
    }

}