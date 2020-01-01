package com.javatmp.module.stats.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.module.activity.ActivityService;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
@RequestMapping("/stats")
public class GetAvgLoadTimePerHourController {

    @Autowired
    ActivityService activityService;

    @RequestMapping(value = "/GetAvgLoadTimePerHourController", method = RequestMethod.POST)
    public @ResponseBody
    ResponseMessage doPost(HttpServletResponse response, ResponseMessage responseMessage) throws Exception {

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
}
