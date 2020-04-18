package com.javatmp.module.user.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.module.dms.entity.Document_;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.entity.User_;
import com.javatmp.module.user.repository.UserStatsRepository;
import com.javatmp.module.user.service.UserStatsService;

import java.text.ParseException;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/stats")
public class UserStatsController {

    @Autowired
    UserStatsService userStatsService;

    @Autowired
    UserStatsRepository userStatsRepository;

    @PostMapping("/getUsersCount")
    public Long getUsersCount(@RequestBody DataTableRequest tableRequest) throws ParseException {
        log.debug("get user count by {}", tableRequest);
        tableRequest.setClassType(User.class);
        return userStatsRepository.retrievePageRequestCount(tableRequest);
    }

    @PostMapping("/GetRegisteredUsersStatusesController")
    public List<Object[]> GetRegisteredUsersStatusesController() {
        return userStatsService.overallUsersStatuses();
    }

    @RequestMapping(value = "/GetUsersLocationsCountController", method = RequestMethod.POST)
    public List<Object[]> getUsersLocationsCountController() throws Exception {
        return userStatsService.usersCountriesGrouping();
    }

    @PostMapping(value = "/GetUsersBirthdayCountController")
    public List<Object[]> getUsersBirthdayCountController(ResponseMessage responseMessage) {
        return userStatsService.usersBirthdayGroupingByMonth();
    }

    @PostMapping("/GetVisitingUsersCountController")
    public Long[] getVisitingUsersCountController() {
        Long usersVisitingTodayCount = userStatsService.usersVistingToday();
        Long usersNotVisitingTodayCount = userStatsService.usersNotVistingToday();
        Long[] results = new Long[2];
        results[0] = usersVisitingTodayCount;
        results[1] = usersNotVisitingTodayCount;
        return results;

    }

}
