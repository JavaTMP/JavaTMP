package com.javatmp.module.user;

import com.javatmp.module.country.Country;
import com.javatmp.module.language.Language;
import com.javatmp.module.language.Languagetranslation;
import com.javatmp.module.theme.Theme;
import com.javatmp.module.theme.Themetranslation;
import com.javatmp.module.timezone.Timezone;
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
        List<Timezone> timezones = sf.getTimezoneService().getTimezones();
        List<Country> countries = sf.getCountryService().getCountries();
        List<Languagetranslation> languages = sf.getLanguageService().getLanguages(loggedInUser);
        List<Themetranslation> themes = sf.getThemeService().getThemes(loggedInUser);
        request.setAttribute("themes", themes);
        request.setAttribute("languages", languages);
        request.setAttribute("countries", countries);
        request.setAttribute("timezones", timezones);
        request.getRequestDispatcher(requestPage).forward(request, response);
    }
}
