package com.javatmp.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

@Controller
public class HomeController {

    @RequestMapping({"/", ""})
    public String home(Model model) {
        model.addAttribute("now", new Date());
        return "index";
    }
}
