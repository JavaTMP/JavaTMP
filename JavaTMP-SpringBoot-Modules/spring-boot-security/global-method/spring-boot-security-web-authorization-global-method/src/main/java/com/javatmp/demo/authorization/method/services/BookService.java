package com.javatmp.demo.authorization.method.services;

import com.javatmp.demo.authorization.method.model.Employee;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@Service
public class BookService {

    private Map<String, Employee> records;

    public BookService() {
        this.records = new HashMap<>();
        this.records.put("emma",
                new Employee("Emma Thompson",
                        Arrays.asList("Karamazov Brothers"),
                        Arrays.asList("accountant", "reader"))
        );
        this.records.put("natalie",new Employee("Natalie Parker",
                Arrays.asList("Beautiful Paris"),
                Arrays.asList("researcher"))
        );

    }

    @PostAuthorize("returnObject.roles.contains('reader')")
    public Employee getBookDetails(String name) {
        return records.get(name);
    }
}
