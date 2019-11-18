package com.javatmp.module.event.controller;

import com.javatmp.module.event.entity.Event;
import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/calendar/getDiaryEvents")
public class DiaryEventsListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        List<Event> diaryEvents = sf.getEventService().getEvents();
        ResponseMessage message = new ResponseMessage();
        message.setOverAllStatus(true);
        message.setData(diaryEvents);
        MvcHelper.sendMessageAsJson(response, message);
    }

}
