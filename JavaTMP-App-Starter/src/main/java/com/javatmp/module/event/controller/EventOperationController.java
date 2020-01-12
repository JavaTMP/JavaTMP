package com.javatmp.module.event.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.module.event.entity.Event;
import com.javatmp.module.event.service.EventService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
@RequestMapping("/calendar")
public class EventOperationController {

    @Autowired
    EventService eventService;

    @PostMapping("/addNewEvent")
    public @ResponseBody
    ResponseMessage addNewEvent(Event event, ResponseMessage responseMessage) {

        log.info("Event read from request prior to update [" + (event) + "]");

        this.eventService.save(event);
        responseMessage.setOverAllStatus(true);
        responseMessage.setMessage("Event id [" + event.getId() + "] Added Successfully");
        return responseMessage;
    }

    @PostMapping("/deleteEvent")
    public @ResponseBody
    ResponseMessage deleteEvent(@RequestBody Event event, HttpServletRequest request, HttpServletResponse response) {
        log.info("Event read from request to be deleted [" + (event) + "]");
        ResponseMessage responseMessage = new ResponseMessage();
        eventService.delete(event);
        responseMessage.setOverAllStatus(true);
        responseMessage.setMessage("Object event found [" + event.getId() + "]");
        return responseMessage;
    }

    @PostMapping("/updateEvent")
    public @ResponseBody
    ResponseMessage updateEvent(@RequestBody Event event, ResponseMessage responseMessage) {

        log.info("Event read from request prior to update [" + (event) + "]");

        responseMessage.setOverAllStatus(true);
        Event dbEvent = this.eventService.getOne(event.getId());
        dbEvent.setTitle(event.getTitle());
        dbEvent.setStartDate(event.getStartDate());
        dbEvent.setEndDate(event.getEndDate());
        eventService.merge(event);
        responseMessage.setOverAllStatus(true);
        responseMessage.setMessage("event update successfully");
        return responseMessage;
    }

    @PostMapping("/populateFakeDatabase")
    public @ResponseBody
    ResponseMessage populateFakeDatabase(HttpServletRequest request, HttpServletResponse response) {

        this.eventService.initialiseDiary();
        ResponseMessage responseMessage = new ResponseMessage();
        responseMessage.setOverAllStatus(true);
        responseMessage.setMessage("Your Fake DB has been successfully populated with Random diary events");
        return responseMessage;
    }

    @GetMapping("/ManageEventController")
    public String manageEventController(Event event, Model model) {
        log.info("Event read from request [" + (event) + "]");
        event = eventService.getOne(event.getId());
        log.info("Event read from Database [" + (event) + "]");
        model.addAttribute("event", event);
        return "/pages/event/ajax/manage-event.jsp";
    }

    @GetMapping("/getDiaryEvents")
    public @ResponseBody
    ResponseMessage getDiaryEvents(HttpServletRequest request, HttpServletResponse response) {
        List<Event> diaryEvents = this.eventService.findAll(0, Integer.MAX_VALUE);
        ResponseMessage message = new ResponseMessage();
        message.setOverAllStatus(true);
        message.setData(diaryEvents);
        return message;
    }

}
