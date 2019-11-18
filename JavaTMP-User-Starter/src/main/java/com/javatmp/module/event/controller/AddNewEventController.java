package com.javatmp.module.event.controller;

import com.javatmp.module.event.entity.Event;
import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/calendar/addNewEvent")
public class AddNewEventController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ServletContext context = request.getServletContext();
            ServicesFactory sf = (ServicesFactory) context.getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);

            ResponseMessage responseMessage = new ResponseMessage();
            responseMessage.setOverAllStatus(true);

            Event event = new Event();
            MvcHelper.populateBeanByRequestParameters(request, event);
            logger.info("Event read from request prior to update [" + MvcHelper.toString(event) + "]");

            List<Event> events = sf.getEventService().getEvents();
            events.add(event);
            event.setId(Long.valueOf(events.size()));
            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage("Event id [" + event.getId() + "] Added Successfully");

            MvcHelper.sendMessageAsJson(response, responseMessage);

        } catch (IllegalAccessException ex) {
            Logger.getLogger(AddNewEventController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvocationTargetException ex) {
            Logger.getLogger(AddNewEventController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
