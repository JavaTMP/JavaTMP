package com.javatmp.module.user.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.module.country.entity.Countrytranslation;
import com.javatmp.module.language.entity.Languagetranslation;
import com.javatmp.module.theme.entity.Themetranslation;
import com.javatmp.module.timezone.Timezonetranslation;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.ResourceBundle;
import java.util.logging.Logger;
import javax.persistence.PersistenceException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nl.captcha.Captcha;

@WebServlet("/register")
public class RegisterController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext context = request.getServletContext();
        HttpSession session = request.getSession();
        ResourceBundle labels = (ResourceBundle) session.getAttribute(Constants.LANGUAGE_ATTR_KEY);

        User loggedInUser = new User(0L, labels.getString("global.language"));
        ServicesFactory sf = (ServicesFactory) context.getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);

        List<Timezonetranslation> timezones = sf.getTimezoneService().getTimezones(loggedInUser);
        List<Countrytranslation> countries = sf.getCountryService().getCountries(loggedInUser);
        List<Languagetranslation> languages = sf.getLanguageService().getLanguages(loggedInUser);
        List<Themetranslation> themes = sf.getThemeService().getThemes(loggedInUser);

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
        UserService userService = sf.getUserService();
        ResourceBundle labels = (ResourceBundle) session.getAttribute(Constants.LANGUAGE_ATTR_KEY);

        User user = new User();
        ResponseMessage responseMessage = new ResponseMessage();
        try {
            String captchaAnswer = request.getParameter("captchaAnswer");
            Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
            if (captcha != null && captcha.isCorrect(captchaAnswer)) {
                MvcHelper.populateBeanByRequestParameters(request, user);
                logger.info("User to be Registerd [" + MvcHelper.deepToString(user) + "]");

                userService.createNewBasicUser(user);

                responseMessage.setOverAllStatus(true);
                responseMessage.setMessage(labels.getString("action.register.success"));
                responseMessage.setRedirectURL(request.getContextPath() + "/");
            } else {
                responseMessage.setOverAllStatus(false);
                responseMessage.setMessage(labels.getString("action.register.wrongCaptcha"));
            }

        } catch (PersistenceException e) {
            Throwable t = e;
            while (t.getCause() != null) {
                t = t.getCause();
            }
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(t.getMessage());
        } catch (IllegalAccessException | InvocationTargetException ex) {
            ex.printStackTrace();
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(labels.getString("action.register.exception"));
            throw new ServletException(ex);
        }

        MvcHelper.sendMessageAsJson(response, responseMessage);
    }

}
