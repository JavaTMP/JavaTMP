package com.javatmp.module.stats.controller;

import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.module.activity.ActivityService;
import com.javatmp.util.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/stats/GetUsersPageViewsPerHourCountController")
public class GetUsersPageViewsPerHourCountController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        ActivityService activityService = sf.getActivityService();

        try {
            List<Object[]> results = activityService.userPageViewsActivitiesPerHour();
            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage(null);
            responseMessage.setData(results);
        } catch (IllegalArgumentException e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(e.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            responseMessage.setStatusCode(HttpServletResponse.SC_BAD_REQUEST);
        }

        MvcHelper.sendMessageAsJson(response, responseMessage);

    }
}