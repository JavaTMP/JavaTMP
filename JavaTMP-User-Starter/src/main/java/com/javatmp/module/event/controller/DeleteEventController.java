package com.javatmp.module.event.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.module.event.entity.Event;
import com.javatmp.module.event.service.EventService;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.io.IOException;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/calendar/deleteEvent")
public class DeleteEventController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        EventService eventService = sf.getEventService();

        ResponseMessage responseMessage = new ResponseMessage();
        responseMessage.setOverAllStatus(true);

        Event event = (Event) MvcHelper.readObjectFromRequest(request, Event.class);
        logger.info("Event read from request to be deleted [" + MvcHelper.toString(event) + "]");
        boolean found = false;
        responseMessage.setMessage("Event id [" + event.getId() + "] not found");
        eventService.delete(event);
        responseMessage.setOverAllStatus(found);
        responseMessage.setMessage("Object event found [" + event.getId() + "]");
        MvcHelper.sendMessageAsJson(response, responseMessage);
    }

}
