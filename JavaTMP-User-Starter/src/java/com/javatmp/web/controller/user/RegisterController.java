package com.javatmp.web.controller.user;

import com.javatmp.domain.Country;
import com.javatmp.domain.Language;
import com.javatmp.domain.Theme;
import com.javatmp.domain.Timezone;
import com.javatmp.web.controller.*;
import com.javatmp.domain.User;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import com.javatmp.util.MD5Util;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.logging.Logger;
import javax.persistence.NoResultException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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

        request.getRequestDispatcher("/WEB-INF/pages/system/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        ServletContext context = request.getServletContext();
        ServicesFactory sf = (ServicesFactory) context.getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);

        User user = new User();
        ResponseMessage responseMessage = new ResponseMessage();
        try {
            MvcHelper.populateBeanByRequestParameters(request, user);
            logger.info("Check User [" + MvcHelper.deepToString(user) + "]");
            User dbUser = sf.getUserService().readUserByUsername(user);

            if (dbUser.getPassword().equals(MD5Util.convertToMD5(user.getPassword()))) {
                // Authenticated user
                logger.info("User found [" + MvcHelper.deepToString(dbUser) + "]");

                Locale locale = Locale.forLanguageTag(dbUser.getLang());
                ResourceBundle bundle = ResourceBundle.getBundle(Constants.RESOURCE_BUNDLE_BASE_NAME, locale);
                session.setAttribute(Constants.LANGUAGE_ATTR_KEY, bundle);
                session.setAttribute("user", dbUser);

                responseMessage.setOverAllStatus(true);
                responseMessage.setMessage(request.getContextPath() + "/");
            } else {
                // un authenticated user
                responseMessage.setOverAllStatus(false);
                responseMessage.setMessage("kindly Check your username and password");
            }
        } catch (NoResultException ex) {
            // un authenticated user
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage("kindly Check your username and password");
        } catch (IllegalAccessException ex) {
            ex.printStackTrace();
            throw new ServletException(ex);
        } catch (InvocationTargetException ex) {
            ex.printStackTrace();
            throw new ServletException(ex);
        }

        MvcHelper.sendMessageAsJson(response, responseMessage);
    }

}
