package com.javatmp.module.user.controller;

import com.javatmp.module.country.entity.Countrytranslation;
import com.javatmp.module.country.service.CountryService;
import com.javatmp.module.language.entity.Languagetranslation;
import com.javatmp.module.language.service.LanguageService;
import com.javatmp.module.theme.entity.Themetranslation;
import com.javatmp.module.theme.service.ThemeService;
import com.javatmp.module.timezone.entity.Timezonetranslation;
import com.javatmp.module.timezone.service.TimezoneService;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import com.javatmp.util.Constants;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Slf4j
@Controller
public class GetUpdateUserPopupController {

    @Autowired
    UserService userService;
    @Autowired
    private TimezoneService timezoneService;
    @Autowired
    private ThemeService themeService;
    @Autowired
    private LanguageService languageService;
    @Autowired
    private CountryService countryService;

    @GetMapping("/user/GetUpdateUserPopupController")
    protected String doGet(@SessionAttribute(Constants.LOG_IN_USER_NAME) User loggedInUser,
            User user, HttpServletRequest request, HttpServletResponse response) {

        log.info("request user is [" + (user) + "]");
        User dbUser = this.userService.readCompleteUserById(user);
        log.info("DB user to be Updated is [" + (dbUser) + "]");

        List<Timezonetranslation> timezones = this.timezoneService.getTimezones(loggedInUser);
        List<Countrytranslation> countries = this.countryService.getCountries(loggedInUser);
        List<Languagetranslation> languages = this.languageService.getLanguages(loggedInUser);
        List<Themetranslation> themes = this.themeService.getThemes(loggedInUser);

        request.setAttribute("themes", themes);
        request.setAttribute("languages", languages);
        request.setAttribute("countries", countries);
        request.setAttribute("user", dbUser);
        request.setAttribute("timezones", timezones);
        return "/pages/user/updateCompleteUserPopup.jsp";
    }
}
