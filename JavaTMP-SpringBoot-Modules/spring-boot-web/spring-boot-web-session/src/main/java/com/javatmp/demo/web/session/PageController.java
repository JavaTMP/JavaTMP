package com.javatmp.demo.web.session;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.UUID;

@Controller
@RequestMapping("/page")
public class PageController {

    @GetMapping("/index")
    public ModelAndView index(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        String token = (String) request.getSession().getAttribute(Constants.SESSION_KEY);
        mv.setViewName("index");
        mv.addObject("token", token);
        return mv;
    }

    @GetMapping("/login")
    public ModelAndView login(Boolean redirect) {
        ModelAndView mv = new ModelAndView();

        if (redirect != null && redirect == true) {
            mv.addObject("message", "Welcome To Login Page");
        }
        mv.setViewName("login");
        return mv;
    }

    @GetMapping("/doLogin")
    public String doLogin(HttpSession session) {
        session.setAttribute(Constants.SESSION_KEY, UUID.randomUUID().toString());

        return "redirect:/page/index";
    }
}
