package com.javatmp.module.user.controller;

import com.javatmp.module.country.entity.Countrytranslation;
import com.javatmp.module.language.entity.Languagetranslation;
import com.javatmp.module.theme.entity.Themetranslation;
import com.javatmp.module.timezone.entity.Timezonetranslation;
import com.javatmp.module.user.entity.User;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class GetListUsersPage {

    @GetMapping("/user/GetListUsersPage")
    public String doGet(HttpServletRequest request, HttpServletResponse response) {
        String requestPage = "/pages/user/listUsers.jsp";

        ServletContext context = request.getServletContext();
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("user");
        ServicesFactory sf = (ServicesFactory) context.getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        List<Timezonetranslation> timezones = sf.getTimezoneService().getTimezones(loggedInUser);
        List<Countrytranslation> countries = sf.getCountryService().getCountries(loggedInUser);
        List<Languagetranslation> languages = sf.getLanguageService().getLanguages(loggedInUser);
        List<Themetranslation> themes = sf.getThemeService().getThemes(loggedInUser);
        request.setAttribute("themes", themes);
        request.setAttribute("languages", languages);
        request.setAttribute("countries", countries);
        request.setAttribute("timezones", timezones);
        return requestPage;
    }
}
