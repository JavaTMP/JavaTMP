/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.service;

import com.javatmp.domain.DiaryEvent;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;
import java.util.logging.Logger;

public class DiaryEventService {

    private final Logger logger = Logger.getLogger(getClass().getName());
    private DBFaker dBFaker;

    public DiaryEventService(DBFaker dBFaker) {
        this.dBFaker = dBFaker;
    }

    public List<DiaryEvent> getDiaryEvents() {
        return dBFaker.getDiaryEvents();
    }

    public void initialiseDiary() {
        for (int i = 0; i < 50; i++) {
            DiaryEvent item = new DiaryEvent();
            item.setId(DBFaker.getNextCounter());
            item.setStatus(ThreadLocalRandom.current().nextInt(0, 3));
            if (i <= 5) // create ten appointments for todays date
            {
                item.setStart(GetRandomAppointmentTime(false, true));
            } else {  // rest of appointments on previous and future dates
                if (i % 2 == 0) {
                    item.setStart(GetRandomAppointmentTime(true, false));
                } // flip/flop between date ahead of today and behind today
                else {
                    item.setStart(GetRandomAppointmentTime(false, false));
                }
            }

            Calendar end = Calendar.getInstance();
            logger.info("Start [" + item.getStart() + "]");
            end.setTime(item.getStart());
            int add = (ThreadLocalRandom.current().nextInt(4) + 1) * 15;

            logger.info("end minute [" + end.get(Calendar.MINUTE) + "] added [" + add + "]");
            end.add(Calendar.MINUTE, add);
            item.setEnd(end.getTime());
            logger.info("End [" + item.getEnd() + "]");
            this.dBFaker.addDiaryEvent(item);
            item.setTitle("Appt: " + item.getId());
        }
    }

    public DiaryEvent getEventById(DiaryEvent event) {
        List<DiaryEvent> events = dBFaker.getDiaryEvents();
        for (DiaryEvent t : events) {
            if (t.getId().equals(event.getId())) {
                return t;
            }
        }
        return null;
    }

    public static Date GetRandomAppointmentTime(boolean goBackwards, boolean today) {
        Calendar baseDate = Calendar.getInstance();
        if (today) {
            baseDate.set(Calendar.HOUR_OF_DAY, ThreadLocalRandom.current().nextInt(24));
            baseDate.set(Calendar.MINUTE, ThreadLocalRandom.current().nextInt(4) * 15);
            baseDate.set(Calendar.SECOND, 0);
            baseDate.set(Calendar.MILLISECOND, 0);

        } else {
            int rndDays = ThreadLocalRandom.current().nextInt(31) + 1;
            if (goBackwards) {
                rndDays = rndDays * -1; // make into negative number
            }
            baseDate.add(Calendar.DAY_OF_MONTH, rndDays);
            baseDate.set(Calendar.HOUR_OF_DAY, ThreadLocalRandom.current().nextInt(24));
            baseDate.set(Calendar.MINUTE, ThreadLocalRandom.current().nextInt(4) * 15);
            baseDate.set(Calendar.SECOND, 0);
            baseDate.set(Calendar.MILLISECOND, 0);
        }
        return baseDate.getTime();
    }

}
