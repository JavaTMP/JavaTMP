package com.javatmp.module.stats.controller;

import com.javatmp.fw.domain.ResponseMessage;
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
public class UserStatsController {

    @Autowired
    UserStatsService userStatsService;

    @PostMapping("/GetRegisteredUsersStatusesController")
    public @ResponseBody
    ResponseMessage GetRegisteredUsersStatusesController(ResponseMessage responseMessage) {

        List<Object[]> results = userStatsService.overallUsersStatuses();
        responseMessage.setOverAllStatus(true);
        responseMessage.setData(results);

        return responseMessage;

    }

    @RequestMapping(value = "/GetUsersLocationsCountController", method = RequestMethod.POST)
    public @ResponseBody
    ResponseMessage getUsersLocationsCountController(HttpServletRequest request, HttpServletResponse response) throws Exception {

        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        UserStatsService userStatsService = sf.getUserStatsService();

        try {
            List<Object[]> results = userStatsService.usersCountriesGrouping();
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

    @PostMapping(value = "/GetUsersBirthdayCountController")
    public @ResponseBody
    ResponseMessage getUsersBirthdayCountController(ResponseMessage responseMessage) {

        List<Object[]> results = userStatsService.usersBirthdayGroupingByMonth();
        responseMessage.setOverAllStatus(true);
        responseMessage.setMessage(null);
        responseMessage.setData(results);

        return responseMessage;

    }

}
