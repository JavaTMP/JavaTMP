package com.javatmp.demo.war;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Locale;

@Slf4j
@RestController
public class IndexRestController {

    @Autowired
    MessageSource messageSource;

    @RequestMapping("/index")
    public String index(Locale locale) {
        log.info("current local of request is : {}", locale);

        String returnMsg = null;
        returnMsg = "Current locale country : " + locale.getCountry() + ", language : " + locale.getLanguage()  + "<br/>";
        returnMsg += messageSource.getMessage(
                "global.welcome",
                null, locale);
        returnMsg += "<br/>";
        returnMsg += messageSource.getMessage(
                "global.welcome",
                null, LocaleContextHolder.getLocale());

        return returnMsg;
    }
}
