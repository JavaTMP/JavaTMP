package com.javatmp.web.controller.calendar;

import com.javatmp.domain.DiaryEvent;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.ResponseMessage;
import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/calendar/addNewEvent")
public class AddNewEventController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);

            ResponseMessage responseMessage = new ResponseMessage();
            responseMessage.setOverAllStatus(true);

            DiaryEvent event = new DiaryEvent();
            MvcHelper.populateBeanByRequestParameters(request, event);
            System.out.println("Event read from request prior to update [" + MvcHelper.toString(event) + "]");

            List<DiaryEvent> events = sf.getDiaryEventService().getDiaryEvents();
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
