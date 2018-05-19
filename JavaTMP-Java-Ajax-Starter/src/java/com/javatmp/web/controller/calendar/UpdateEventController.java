package com.javatmp.web.controller.calendar;

import com.javatmp.domain.DiaryEvent;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.ResponseMessage;
import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/calendar/updateEvent")
public class UpdateEventController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);

        ResponseMessage responseMessage = new ResponseMessage();
        responseMessage.setOverAllStatus(true);

        DiaryEvent event = (DiaryEvent) MvcHelper.readObjectFromRequest(request, DiaryEvent.class);
        System.out.println("Event read from request prior to update [" + MvcHelper.toString(event) + "]");
        boolean found = false;
        String msg = "Event id [" + event.getId() + "] not found";
        List<DiaryEvent> events = sf.getDiaryEventService().getDiaryEvents();
        for (DiaryEvent t : events) {
            if (t.getId().equals(event.getId())) {
                found = true;
                msg = "Event Id [" + event.getId() + "] Updated Successfully";
                System.out.println("Object event found [" + event.getId() + "]");
                t.setTitle(event.getTitle());
                t.setStart(event.getStart());
                t.setEnd(event.getEnd());
            }
        }
        responseMessage.setOverAllStatus(found);
        responseMessage.setMessage(msg);
        MvcHelper.sendMessageAsJson(response, responseMessage);
    }

}
