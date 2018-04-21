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

@WebServlet("/calendar/ManageEventController")
public class ManageEventController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);

            DiaryEvent event = new DiaryEvent();
            MvcHelper.populateBeanByRequestParameters(request, event);
            System.out.println("Event read from request [" + MvcHelper.toString(event) + "]");
            event = sf.getDiaryEventService().getEventById(event);
            System.out.println("Event read from Database [" + MvcHelper.toString(event) + "]");
            request.getRequestDispatcher("/WEB-INF/pages/plugins/calendar/ajax/manage-event.jsp").forward(request, response);
        } catch (InvocationTargetException ex) {
            Logger.getLogger(ManageEventController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(ManageEventController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
