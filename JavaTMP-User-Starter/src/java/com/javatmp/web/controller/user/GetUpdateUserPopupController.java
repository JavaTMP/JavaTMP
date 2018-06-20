package com.javatmp.web.controller.user;

import com.javatmp.domain.Country;
import com.javatmp.domain.Language;
import com.javatmp.domain.Theme;
import com.javatmp.domain.Timezone;
import com.javatmp.domain.User;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/GetUpdateUserPopupController")
public class GetUpdateUserPopupController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String requestPage = "/WEB-INF/pages/user/updateUserPopup.jsp";

            ServletContext context = request.getServletContext();
            ServicesFactory sf = (ServicesFactory) context.getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
            User user = new User();
            MvcHelper.populateBeanByRequestParameters(request, user);
            logger.info("request user is [" + MvcHelper.deepToString(user) + "]");
            User dbUser = sf.getUserService().readUserByUserId(user);
            logger.info("DB user to be Updated is [" + MvcHelper.deepToString(dbUser) + "]");

            List<Timezone> timezones = sf.getTimezoneService().getTimezones();
            List<Country> countries = sf.getCountryService().getCountries();
            List<Language> languages = sf.getLanguageService().getLanguages();
            List<Theme> themes = sf.getThemeService().getThemes();
            request.setAttribute("themes", themes);
            request.setAttribute("languages", languages);
            request.setAttribute("countries", countries);
            request.setAttribute("user", dbUser);
            request.setAttribute("timezones", timezones);
            request.getRequestDispatcher(requestPage).forward(request, response);
        } catch (IllegalAccessException ex) {
            logger.log(Level.SEVERE, null, ex);
            throw new ServletException(ex);
        } catch (InvocationTargetException ex) {
            logger.log(Level.SEVERE, null, ex);
            throw new ServletException(ex);
        }
    }
}
