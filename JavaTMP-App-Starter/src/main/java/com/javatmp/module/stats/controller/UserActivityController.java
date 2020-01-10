package com.javatmp.module.stats.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.module.activity.UserActivityService;
import com.javatmp.module.stats.service.UserStatsService;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
@RequestMapping("/stats")
public class UserActivityController {

    @Autowired
    UserActivityService activityService;

    @RequestMapping(value = "/GetAvgLoadTimePerHourController", method = RequestMethod.POST)
    public @ResponseBody
    ResponseMessage getAvgLoadTimePerHourController(HttpServletResponse response, ResponseMessage responseMessage) {

        try {
            List<Object[]> results = activityService.avgPagesLoadTimePerHour();
            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage(null);
            responseMessage.setData(results);
        } catch (IllegalArgumentException e) {
            log.error(e.getMessage(), e);
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(e.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            responseMessage.setStatusCode(HttpServletResponse.SC_BAD_REQUEST);
        }
        return responseMessage;
    }

    @PostMapping("/GetVisitingUsersCountController")
    public @ResponseBody
    ResponseMessage getVisitingUsersCountController(HttpServletRequest request, HttpServletResponse response) throws Exception {

        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        UserStatsService userStatsService = sf.getUserStatsService();

        try {
            Long usersVisitingTodayCount = userStatsService.usersVistingToday();
            Long usersNotVisitingTodayCount = userStatsService.usersNotVistingToday();
            Long[] results = new Long[2];
            results[0] = usersVisitingTodayCount;
            results[1] = usersNotVisitingTodayCount;
            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage(null);
            responseMessage.setData(results);
        } catch (IllegalArgumentException e) {
            log.error(e.getMessage(), e);
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(e.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            responseMessage.setStatusCode(HttpServletResponse.SC_BAD_REQUEST);
        }

        return responseMessage;

    }

    @PostMapping("/GetUsersPageViewsPerHourCountController")
    public @ResponseBody
    ResponseMessage getUsersPageViewsPerHourCountController(HttpServletRequest request, HttpServletResponse response) throws Exception {

        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        UserActivityService activityService = sf.getActivityService();

        try {
            List<Object[]> results = activityService.userPageViewsActivitiesPerHour();
            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage(null);
            responseMessage.setData(results);
        } catch (IllegalArgumentException e) {
            log.error(e.getMessage(), e);
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(e.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            responseMessage.setStatusCode(HttpServletResponse.SC_BAD_REQUEST);
        }

        return responseMessage;

    }
}
