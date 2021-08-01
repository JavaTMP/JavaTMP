package com.javatmp.demo.authorization.method.services;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class NameService {

    private Map<String, List<String>> secretNames;

    public NameService() {
        this.secretNames = new HashMap<>();
        this.secretNames.put("natalie", Arrays.asList("Energico", "Perfecto"));
        this.secretNames.put("emma", Arrays.asList("Fantastico"));
    }

    @PreAuthorize("#name == authentication.principal.username")
    public List<String> getSecretNames(String name) {
        return secretNames.get(name);
    }
    @PreAuthorize("hasAuthority('write')")
    public String getName() {
        return "Fantastico";
    }
}
