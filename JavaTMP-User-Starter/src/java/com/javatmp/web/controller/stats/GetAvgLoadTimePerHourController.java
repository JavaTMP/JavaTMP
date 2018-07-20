package com.javatmp.web.controller.stats;

import com.javatmp.web.controller.user.*;
import com.javatmp.domain.User;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.service.ActivityService;
import com.javatmp.service.DocumentService;
import com.javatmp.service.ServicesFactory;
import com.javatmp.service.UserService;
import com.javatmp.service.UserStatsService;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/stats/GetAvgLoadTimePerHourController")
public class GetAvgLoadTimePerHourController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        ActivityService activityService = sf.getActivityService();

        try {
            List<Object[]> results = activityService.avgPagesLoadTimePerHour();
            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage(null);
            responseMessage.setData(results);
        } catch (IllegalArgumentException e) {
            logger.log(Level.SEVERE, "Error", e);
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(e.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            responseMessage.setStatusCode(HttpServletResponse.SC_BAD_REQUEST);
        }

        MvcHelper.sendMessageAsJson(response, responseMessage);

    }
}
