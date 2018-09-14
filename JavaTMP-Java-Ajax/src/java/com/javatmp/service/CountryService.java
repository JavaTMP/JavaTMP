package com.javatmp.service;

import com.javatmp.domain.Country;
import java.util.LinkedList;
import java.util.List;

public class CountryService {

    private final DBFaker dBFaker;

    public CountryService(DBFaker dBFaker) {
        this.dBFaker = dBFaker;
    }

    public Long getAllCount() {
        return Long.valueOf(this.dBFaker.getCountries().size());
    }

    public List<Country> getCountries() {
        return this.dBFaker.getCountries();
    }

    public List<Country> findCountriesByName(Country country) {
        List<Country> foundCountries = new LinkedList<>();
        List<Country> dbCountries = this.dBFaker.getCountries();
        for (Country c : dbCountries) {
            if (c.getCountryName().toLowerCase().startsWith(country.getCountryName().trim().toLowerCase())) {
                foundCountries.add(c);
            }
        }
        return foundCountries;
    }

}
