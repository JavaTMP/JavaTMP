package com.javatmp.web.controller;

import com.javatmp.module.country.entity.Countrytranslation;
import com.javatmp.module.country.service.CountryService;
import com.javatmp.module.language.entity.Languagetranslation;
import com.javatmp.module.language.service.LanguageService;
import com.javatmp.module.theme.entity.Themetranslation;
import com.javatmp.module.theme.service.ThemeService;
import com.javatmp.module.timezone.entity.Timezonetranslation;
import com.javatmp.module.timezone.service.TimezoneService;
import com.javatmp.module.user.entity.User;
import com.javatmp.util.Constants;
import java.util.List;
import java.util.ResourceBundle;
import javax.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Slf4j
@Controller
public class PagesController {

    @Autowired
    private TimezoneService timezoneService;
    @Autowired
    private ThemeService themeService;
    @Autowired
    private LanguageService languageService;
    @Autowired
    private CountryService countryService;

    @GetMapping("/pages/**")
    protected String doGet(@SessionAttribute ResourceBundle labels, @SessionAttribute(Constants.LOG_IN_USER_NAME) User loggedInUser,
            HttpServletRequest request) {

        String requestUrl = request.getRequestURI();
        String requestPage = requestUrl + ".jsp";
        log.info("request url [" + requestUrl + "] Request Page [" + requestPage + "]");

        if (loggedInUser == null) {
            loggedInUser = new User(0L, labels.getString("global.language"));
        }

        List<Timezonetranslation> timezones = this.timezoneService.getTimezones(loggedInUser);
        List<Countrytranslation> countries = this.countryService.getCountries(loggedInUser);
        List<Languagetranslation> languages = this.languageService.getLanguages(loggedInUser);
        List<Themetranslation> themes = this.themeService.getThemes(loggedInUser);

        request.setAttribute("themes", themes);
        request.setAttribute("languages", languages);
        request.setAttribute("countries", countries);
        request.setAttribute("timezones", timezones);

        return requestPage;
    }
}
