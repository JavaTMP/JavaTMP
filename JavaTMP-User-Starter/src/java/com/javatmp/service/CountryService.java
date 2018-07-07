package com.javatmp.service;

import com.javatmp.db.JpaDaoHelper;
import com.javatmp.domain.Country;
import java.util.List;

public class CountryService {

    private final JpaDaoHelper jpaDaoHelper;
    private List<Country> countries;

    public CountryService(JpaDaoHelper jpaDaoHelper) {
        this.jpaDaoHelper = jpaDaoHelper;
    }

    public List<Country> getCountries() {
        if (this.countries == null || this.countries.isEmpty()) {
            synchronized (this) {
                // Check if still empty and not populated before:
                if (this.countries == null || this.countries.isEmpty()) {
                    this.countries = this.jpaDaoHelper.findAll(Country.class);
                }
            }
        }
        return countries;
    }
}
