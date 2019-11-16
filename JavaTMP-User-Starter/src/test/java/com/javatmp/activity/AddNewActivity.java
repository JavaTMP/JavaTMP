/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.activity;

import com.javatmp.*;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.javatmp.module.activity.Activity;
import com.javatmp.module.dms.entity.Document;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.activity.ActivityService;
import com.javatmp.util.ServicesFactory;
import com.javatmp.util.Constants;
import com.javatmp.util.MD5Util;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Type;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import java.util.TimeZone;
import java.util.UUID;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

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
        activityService.createActivity(activity);
    }
}
