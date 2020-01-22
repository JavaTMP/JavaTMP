package com.javatmp.module.user.service;

import com.javatmp.module.user.entity.Countrytranslation;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.repository.CountryRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CountryService {

    @Autowired
    private CountryRepository countryRepository;

    public List<Countrytranslation> getCountries(User localeUser) {
        return this.countryRepository.getCountries(localeUser.getLang());
    }
}
