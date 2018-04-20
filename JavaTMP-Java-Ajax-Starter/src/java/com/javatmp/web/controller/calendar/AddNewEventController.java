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
            responseMessage.setMessage("Your Fake DB has been successfully populated with Random diary events");

            Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").serializeNulls()
                    .registerTypeAdapter(Class.class, new ClassTypeAdapter())
                    //                .registerTypeAdapter(Date.class, new DateTypeAdapter())
                    .create();

            DiaryEvent event = new DiaryEvent();
            MvcHelper.populateBeanByRequestParameters(request, event);
            System.out.println("Event read from request prior to update [" + MvcHelper.toString(event) + "]");

            List<DiaryEvent> events = sf.getDiaryEventService().getDiaryEvents();
            events.add(event);
            event.setId(Long.valueOf(events.size()));
            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage("Event id [" + event.getId() + "] Added Successfully");
            String json = gson.toJson(responseMessage);
            System.out.println("response [" + json + "]");
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(AddNewEventController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvocationTargetException ex) {
            Logger.getLogger(AddNewEventController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
