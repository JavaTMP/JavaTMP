package com.javatmp.module.user.controller;

import com.javatmp.module.country.entity.Country;
import com.javatmp.module.country.entity.Countrytranslation;
import com.javatmp.module.language.entity.Language;
import com.javatmp.module.language.entity.Languagetranslation;
import com.javatmp.module.theme.entity.Theme;
import com.javatmp.module.theme.entity.Themetranslation;
import com.javatmp.module.timezone.entity.Timezone;
import com.javatmp.module.timezone.entity.Timezonetranslation;
import com.javatmp.module.user.entity.User;
import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.util.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user/GetUpdateUserPopupController")
public class GetUpdateUserPopupController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String requestPage = "/pages/user/updateCompleteUserPopup.jsp";

            ServletContext context = request.getServletContext();
            ServicesFactory sf = (ServicesFactory) context.getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
            User user = new User();
            MvcHelper.populateBeanByRequestParameters(request, user);
            logger.info("request user is [" + MvcHelper.deepToString(user) + "]");
            User dbUser = sf.getUserService().readCompleteUserById(user);
            logger.info("DB user to be Updated is [" + MvcHelper.deepToString(dbUser) + "]");

            HttpSession session = request.getSession();
            User loggedInUser = (User) session.getAttribute("user");

            List<Timezonetranslation> timezones = sf.getTimezoneService().getTimezones(loggedInUser);
            List<Countrytranslation> countries = sf.getCountryService().getCountries(loggedInUser);
            List<Languagetranslation> languages = sf.getLanguageService().getLanguages(loggedInUser);
            List<Themetranslation> themes = sf.getThemeService().getThemes(loggedInUser);

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
