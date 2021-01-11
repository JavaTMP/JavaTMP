package com.javatmp.demo.web;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.LocaleResolver;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Locale;

@Slf4j
@RestController
@RequestMapping("/RestDefaultLocaleController")
public class RestDefaultLocaleController {

    @Autowired
    MessageSource messageSource;

    @Resource
    private LocaleResolver localeResolver;

    @GetMapping
    public String get(HttpServletRequest request,
                      HttpServletResponse response,
                      Locale locale,
                      HttpSession httpSession) {

        log.info("current local of request is : {}", locale);

        this.localeResolver.setLocale(request, response, Locale.getDefault());

        String returnMsg = null;
        returnMsg = "Current locale country : " + locale.getCountry() + ", language : " + locale.getLanguage() + "<br/>";
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
