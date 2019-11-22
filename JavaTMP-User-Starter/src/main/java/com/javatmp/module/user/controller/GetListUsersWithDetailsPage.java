package com.javatmp.module.user.controller;

import com.javatmp.module.country.entity.Country;
import com.javatmp.module.country.entity.Countrytranslation;
import com.javatmp.module.language.entity.Language;
import com.javatmp.module.language.entity.Languagetranslation;
import com.javatmp.module.theme.entity.Theme;
import com.javatmp.module.theme.entity.Themetranslation;
import com.javatmp.module.timezone.Timezone;
import com.javatmp.module.timezone.Timezonetranslation;
import com.javatmp.module.user.entity.User;
import com.javatmp.util.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;
import javax.servlet.ServletContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user/GetListUsersWithDetailsPage")
public class GetListUsersWithDetailsPage extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestPage = "/WEB-INF/pages/user/listUsersWithDetails.jsp";

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
        request.getRequestDispatcher(requestPage).forward(request, response);
    }
}
