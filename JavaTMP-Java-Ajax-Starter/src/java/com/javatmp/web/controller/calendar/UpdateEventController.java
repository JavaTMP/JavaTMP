package com.javatmp.web.controller.calendar;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.domain.DiaryEvent;
import com.javatmp.mvc.ClassTypeAdapter;
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
        responseMessage.setMessage("Your Fake DB has been successfully populated with Random diary events");

        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm:ss").serializeNulls()
                .registerTypeAdapter(Class.class, new ClassTypeAdapter())
                //                .registerTypeAdapter(Date.class, new DateTypeAdapter())
                .create();

        DiaryEvent event = gson.fromJson(request.getReader(), DiaryEvent.class);
        System.out.println("Event read from request prior to update [" + MvcHelper.toString(event) + "]");
        boolean found = false;
        String msg = "Event id [" + event.getId() + "] not found";
        List<DiaryEvent> events = sf.getDiaryEventService().getDiaryEvents();
        for (DiaryEvent t : events) {
            if (t.getId().equals(event.getId())) {
                found = true;
                msg = "Event Id [" + event.getId() + "] Updated Successfully";
                System.out.println("Object event found [" + event.getId() + "]");
                t.setStart(event.getStart());
                t.setEnd(event.getEnd());
            }
        }
        responseMessage.setOverAllStatus(found);
        responseMessage.setMessage(msg);
        String json = gson.toJson(responseMessage);
        System.out.println("response [" + json + "]");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

}
