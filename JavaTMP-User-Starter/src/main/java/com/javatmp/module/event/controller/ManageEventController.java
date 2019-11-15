package com.javatmp.module.event.controller;

import com.javatmp.module.event.entity.Event;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/calendar/ManageEventController")
public class ManageEventController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);

            Event event = new Event();
            MvcHelper.populateBeanByRequestParameters(request, event);
            logger.info("Event read from request [" + MvcHelper.toString(event) + "]");
            event = sf.getEventService().getEventById(event);
            logger.info("Event read from Database [" + MvcHelper.toString(event) + "]");
            request.setAttribute("event", event);
            request.getRequestDispatcher("/WEB-INF/pages/event/ajax/manage-event.jsp").forward(request, response);
        } catch (InvocationTargetException ex) {
            Logger.getLogger(ManageEventController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(ManageEventController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
