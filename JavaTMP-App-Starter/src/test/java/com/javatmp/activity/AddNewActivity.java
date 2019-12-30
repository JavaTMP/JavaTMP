/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.activity;

import com.javatmp.module.activity.Activity;
import com.javatmp.module.activity.ActivityService;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.io.FileNotFoundException;
import java.text.ParseException;
import java.util.Date;
import java.util.TimeZone;

/**
 *
 * @author Mohamed
 */
public class AddNewActivity {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws ParseException, FileNotFoundException {
        TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
        ServicesFactory sf = new ServicesFactory(Constants.DEFAULT_PERSISTENT_UNIT_NAME);
        Activity activity = new Activity();
        ActivityService activityService = sf.getActivityService();
        activity.setCreationDate(new Date());
//        activity.setSessionId(UUID.randomUUID().toString().replace("-", ""));
        activityService.save(activity);
    }
}
