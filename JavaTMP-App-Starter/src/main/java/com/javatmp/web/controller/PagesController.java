package com.javatmp.web.controller;

import com.javatmp.module.user.entity.Countrytranslation;
import com.javatmp.module.user.service.CountryService;
import com.javatmp.module.user.entity.Languagetranslation;
import com.javatmp.module.user.service.LanguageService;
import com.javatmp.module.user.entity.Themetranslation;
import com.javatmp.module.user.service.ThemeService;
import com.javatmp.module.user.entity.Timezonetranslation;
import com.javatmp.module.user.service.TimezoneService;
import com.javatmp.module.user.entity.User;
import com.javatmp.fw.util.Constants;
import java.util.List;
import java.util.Optional;
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
    protected String doGet(@SessionAttribute ResourceBundle labels, @SessionAttribute(Constants.LOG_IN_USER_NAME) Optional<User> loggedInUser,
            HttpServletRequest request) {

        String requestUrl = request.getRequestURI();
        String requestPage = requestUrl + ".jsp";
        log.info("request url [" + requestUrl + "] Request Page [" + requestPage + "]");
        User user = new User(0L, labels.getString("global.language"));
        if (loggedInUser.isPresent()) {
            user = loggedInUser.get();
        }

        List<Timezonetranslation> timezones = this.timezoneService.getTimezones(user);
        List<Countrytranslation> countries = this.countryService.getCountries(user);
        List<Languagetranslation> languages = this.languageService.getLanguages(user);
        List<Themetranslation> themes = this.themeService.getThemes(user);

        request.setAttribute("themes", themes);
        request.setAttribute("languages", languages);
        request.setAttribute("countries", countries);
        request.setAttribute("timezones", timezones);

        return requestPage;
    }
}
