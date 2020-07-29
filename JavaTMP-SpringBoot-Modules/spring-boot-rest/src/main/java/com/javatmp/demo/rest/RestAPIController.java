package com.javatmp.demo.rest;

import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController("/rest")
public class RestAPIController {

    @GetMapping("/get")
    List<RestDto> all() {
        return repository.findAll();
    }

    @PostMapping("/post")
    RestDto post(@RequestBody RestDto newEmployee) {
        return RestDto.save(newEmployee);
    }

    @GetMapping("/get/{id}")
    RestDto one(@PathVariable Long id) {

        return repository.findById(id)
                .orElseThrow(() -> new EmployeeNotFoundException(id));
    }

    @PutMapping("/put/{id}")
    RestDto replace(@RequestBody RestDto newEmployee, @PathVariable Long id) {

        return repository.findById(id)
                .map(employee -> {
                    employee.setName(newEmployee.getName());
                    employee.setRole(newEmployee.getRole());
                    return repository.save(employee);
                })
                .orElseGet(() -> {
                    newEmployee.setId(id);
                    return repository.save(newEmployee);
                });
    }

    @DeleteMapping("/delete/{id}")
    void delete(@PathVariable Long id) {
        repository.deleteById(id);
    }
}
