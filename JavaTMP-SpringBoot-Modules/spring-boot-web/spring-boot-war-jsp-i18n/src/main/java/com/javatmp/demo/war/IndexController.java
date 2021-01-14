package com.javatmp.demo.war;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.Locale;

@Slf4j
@Controller
@RequestMapping({"", "/"})
public class IndexController {

    @Autowired
    MessageSource messageSource;

    @GetMapping
    public String get(Model model, Locale locale, HttpSession httpSession) {
        log.info("page requested Controller");
        Enumeration<String> attributes = httpSession.getAttributeNames();
        while (attributes.hasMoreElements()) {
            String attribute = (String) attributes.nextElement();
            log.info("Session attribute:[{}],value[{}]", attribute, httpSession.getAttribute(attribute));
        }

        log.info("current local of request is : {}", locale);

        String returnMsg = null;
        returnMsg = "Current locale country : " + locale.getCountry() + ", language : " + locale.getLanguage()  + "<br/>";
        returnMsg += messageSource.getMessage(
                "global.welcome",
                null, locale);
        returnMsg += "<br/>";
        returnMsg += messageSource.getMessage(
                "global.welcome",
                null, LocaleContextHolder.getLocale());
        model.addAttribute("returnMsg", returnMsg);
        return "/index.jsp";
    }
}
