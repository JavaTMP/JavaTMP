package com.javatmp.web.controller.user;

import com.javatmp.domain.Country;
import com.javatmp.domain.Language;
import com.javatmp.domain.Theme;
import com.javatmp.domain.Timezone;
import com.javatmp.domain.User;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.service.ServicesFactory;
import com.javatmp.service.UserService;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
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
        UserService userService = sf.getUserService();

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
                responseMessage.setMessage("User has registered successfully");
                responseMessage.setRedirectURL(request.getContextPath() + "/");
            } else {
                responseMessage.setOverAllStatus(false);
                responseMessage.setMessage("Wrong Characters typed from the captcha image");
            }

        } catch (PersistenceException e) {
            Throwable t = e;
            String msg = "";
            while (t.getCause() != null) {
                t = t.getCause();
            }
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage("error during connecting to database =>" + t.getMessage());
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
