package com.javatmp.timezones;

import com.javatmp.module.user.entity.Timezonetranslation;
import com.javatmp.module.user.repository.TimezoneRepository;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class GetTimezonesTest {

    @Autowired
    TimezoneRepository timezoneRepository;

    @Test
    void testGetTimezones() {
        List<Timezonetranslation> timezonetranslations = this.timezoneRepository.getTimezones("en");
        log.debug("count of timezone in database is {}", timezonetranslations.size());

    }

}
