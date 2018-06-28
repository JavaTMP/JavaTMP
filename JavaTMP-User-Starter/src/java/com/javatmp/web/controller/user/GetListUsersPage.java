package com.javatmp.web.controller.user;

import com.javatmp.domain.Country;
import com.javatmp.domain.Language;
import com.javatmp.domain.Theme;
import com.javatmp.domain.Timezone;
import com.javatmp.service.ServicesFactory;
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

@WebServlet("/user/GetListUsersPage")
public class GetListUsersPage extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestPage = "/WEB-INF/pages/user/listUsers.jsp";

        ServletContext context = request.getServletContext();
        ServicesFactory sf = (ServicesFactory) context.getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        List<Timezone> timezones = sf.getTimezoneService().getTimezones();
        List<Country> countries = sf.getCountryService().getCountries();
        List<Language> languages = sf.getLanguageService().getLanguages();
        List<Theme> themes = sf.getThemeService().getThemes();
        request.setAttribute("themes", themes);
        request.setAttribute("languages", languages);
        request.setAttribute("countries", countries);
        request.setAttribute("timezones", timezones);
        request.getRequestDispatcher(requestPage).forward(request, response);
    }
}
