package com.javatmp.web.controller.calendar;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.mvc.ClassTypeAdapter;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.ResponseMessage;
import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/calendar/populateFakeDatabase")
public class PopulateFakeDatabaseController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);

        sf.getDiaryEventService().initialiseDiary();

        ResponseMessage responseMessage = new ResponseMessage();
        responseMessage.setOverAllStatus(true);
        responseMessage.setMessage("Your Fake DB has been successfully populated with Random diary events");

        MvcHelper.sendMessageAsJson(response, responseMessage);
    }

}
