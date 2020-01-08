package com.javatmp.module.user.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.module.country.entity.Countrytranslation;
import com.javatmp.module.language.entity.Languagetranslation;
import com.javatmp.module.theme.entity.Themetranslation;
import com.javatmp.module.timezone.entity.Timezonetranslation;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.util.Enumeration;
import java.util.List;
import java.util.ResourceBundle;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import nl.captcha.Captcha;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

@Slf4j
@Controller
public class RegisterController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
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

        Enumeration<String> enums = context.getAttributeNames();
        while (enums.hasMoreElements()) {
            String currentName = enums.nextElement();
            log.info("Context Name is [" + currentName + "] type [" + context.getAttribute(currentName).getClass() + "]");
        }

        return "/pages/system/register.jsp";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public @ResponseBody
    ResponseMessage doPost(User user, @SessionAttribute ResourceBundle labels, HttpSession session,
            ResponseMessage responseMessage, HttpServletRequest request) {

        log.info("User to be Registerd {}", user);

        String captchaAnswer = request.getParameter("captchaAnswer");
        Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
        if (captcha != null && captcha.isCorrect(captchaAnswer)) {
            userService.createNewBasicUser(user);
            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage(labels.getString("action.register.success"));
            responseMessage.setRedirectURL(request.getContextPath() + "/");
        } else {
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(labels.getString("action.register.wrongCaptcha"));
        }
        return responseMessage;
    }

}
