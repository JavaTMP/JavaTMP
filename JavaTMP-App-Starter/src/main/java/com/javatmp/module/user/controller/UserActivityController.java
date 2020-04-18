package com.javatmp.module.user.controller;

import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.entity.UserActivity;
import com.javatmp.module.user.repository.UserActivityRepository;
import com.javatmp.module.user.service.UserActivityService;

import java.text.ParseException;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/stats")
public class UserActivityController {

    @Autowired
    UserActivityService activityService;

    @Autowired
    UserActivityRepository userActivityRepository;

    @PostMapping("/getUserActivitiesCount")
    public Long getUserActivitiesCount(@RequestBody DataTableRequest tableRequest) throws ParseException {
        log.debug("get user count by {}", tableRequest);
        tableRequest.setClassType(UserActivity.class);
        return userActivityRepository.retrievePageRequestCount(tableRequest);
    }

    @RequestMapping(value = "/GetAvgLoadTimePerHourController", method = RequestMethod.POST)
    public List<Object[]> getAvgLoadTimePerHourController() {
        return activityService.avgPagesLoadTimePerHour();
    }

    @PostMapping("/GetUsersPageViewsPerHourCountController")
    public List<Object[]> getUsersPageViewsPerHourCountController() {
        return activityService.userPageViewsActivitiesPerHour();
    }
}
