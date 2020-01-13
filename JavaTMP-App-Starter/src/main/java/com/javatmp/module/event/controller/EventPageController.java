package com.javatmp.module.event.controller;

import com.javatmp.module.event.entity.Event;
import com.javatmp.module.event.service.EventService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/calendar")
public class EventPageController {

    @Autowired
    EventService eventService;

    @GetMapping("/ManageEventController")
    public String manageEventController(Event event, Model model) {
        log.info("Event read from request [" + (event) + "]");
        event = eventService.getOne(event.getId());
        log.info("Event read from Database [" + (event) + "]");
        model.addAttribute("event", event);
        return "/pages/event/ajax/manage-event.jsp";
    }
}
