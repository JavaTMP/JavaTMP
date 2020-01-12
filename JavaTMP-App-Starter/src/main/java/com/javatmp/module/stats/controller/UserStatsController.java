package com.javatmp.module.stats.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.module.stats.service.UserStatsService;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/stats")
public class UserStatsController {

    @Autowired
    UserStatsService userStatsService;

    @PostMapping("/GetRegisteredUsersStatusesController")
    public ResponseMessage GetRegisteredUsersStatusesController(ResponseMessage responseMessage) {

        List<Object[]> results = userStatsService.overallUsersStatuses();
        responseMessage.setOverAllStatus(true);
        responseMessage.setData(results);

        return responseMessage;

    }

    @RequestMapping(value = "/GetUsersLocationsCountController", method = RequestMethod.POST)
    public ResponseMessage getUsersLocationsCountController(ResponseMessage responseMessage) throws Exception {

        List<Object[]> results = userStatsService.usersCountriesGrouping();
        responseMessage.setOverAllStatus(true);
        responseMessage.setMessage(null);
        responseMessage.setData(results);

        return responseMessage;

    }

    @PostMapping(value = "/GetUsersBirthdayCountController")
    public ResponseMessage getUsersBirthdayCountController(ResponseMessage responseMessage) {

        List<Object[]> results = userStatsService.usersBirthdayGroupingByMonth();
        responseMessage.setOverAllStatus(true);
        responseMessage.setMessage(null);
        responseMessage.setData(results);

        return responseMessage;

    }

    @PostMapping("/GetVisitingUsersCountController")
    public ResponseMessage getVisitingUsersCountController(ResponseMessage responseMessage) {

        Long usersVisitingTodayCount = userStatsService.usersVistingToday();
        Long usersNotVisitingTodayCount = userStatsService.usersNotVistingToday();
        Long[] results = new Long[2];
        results[0] = usersVisitingTodayCount;
        results[1] = usersNotVisitingTodayCount;
        responseMessage.setOverAllStatus(true);
        responseMessage.setMessage(null);
        responseMessage.setData(results);

        return responseMessage;

    }

}
