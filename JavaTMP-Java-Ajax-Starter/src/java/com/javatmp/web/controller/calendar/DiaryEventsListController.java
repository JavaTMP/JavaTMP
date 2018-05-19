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

@WebServlet("/calendar/getDiaryEvents")
public class DiaryEventsListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        List<DiaryEvent> diaryEvents = sf.getDiaryEventService().getDiaryEvents();
        ResponseMessage message = new ResponseMessage();
        message.setOverAllStatus(true);
        message.setData(diaryEvents);
        MvcHelper.sendMessageAsJson(response, message);
    }

}
