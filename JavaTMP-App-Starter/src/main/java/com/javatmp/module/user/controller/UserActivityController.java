package com.javatmp.module.user.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.module.user.service.UserActivityService;
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
public class UserActivityController {

    @Autowired
    UserActivityService activityService;

    @RequestMapping(value = "/GetAvgLoadTimePerHourController", method = RequestMethod.POST)
    public ResponseMessage getAvgLoadTimePerHourController(ResponseMessage responseMessage) {

        List<Object[]> results = activityService.avgPagesLoadTimePerHour();
        responseMessage.setOverAllStatus(true);
        responseMessage.setMessage(null);
        responseMessage.setData(results);

        return responseMessage;
    }

    @PostMapping("/GetUsersPageViewsPerHourCountController")
    public ResponseMessage getUsersPageViewsPerHourCountController(ResponseMessage responseMessage) {
        List<Object[]> results = activityService.userPageViewsActivitiesPerHour();
        responseMessage.setOverAllStatus(true);
        responseMessage.setMessage(null);
        responseMessage.setData(results);
        return responseMessage;
    }
}
