package com.javatmp;

import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@NoArgsConstructor
public class WelcomeService {

    public String getWelcomeMessage() {
        return "*** Welcome to first Message from this Module ***";
    }
}
