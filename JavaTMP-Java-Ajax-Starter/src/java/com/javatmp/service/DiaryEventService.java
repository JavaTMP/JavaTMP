/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.service;

import com.javatmp.domain.Account;
import com.javatmp.domain.DiaryEvent;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

/**
 *
 * @author m_dar
 */
public class DiaryEventService {

    private DBFaker dBFaker;

    public DiaryEventService(DBFaker dBFaker) {
        this.dBFaker = dBFaker;
    }

    public List<DiaryEvent> getDiaryEvents() {
        return dBFaker.getDiaryEvents();
    }

    public void initialiseDiary() {
        Random rnd = new Random(DBFaker.getNextCounter());
        for (int i = 0; i < 30; i++) {
            DiaryEvent item = new DiaryEvent();
            item.setId(DBFaker.getNextCounter());
            item.setTitle("Appt: " + i);
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
            System.out.println("Start [" + item.getStart() + "]");
            end.setTime(item.getStart());
            int add = (rnd.nextInt(4) + 1) * 15;

            System.out.println("end minute [" + end.get(Calendar.MINUTE) + "] added [" + add + "]");
            end.add(Calendar.MINUTE, add);
            item.setEnd(end.getTime());
            System.out.println("End [" + item.getEnd() + "]");
            this.dBFaker.addDiaryEvent(item);
        }
    }

    public static Date GetRandomAppointmentTime(boolean goBackwards, boolean today) {
        Random rnd = new Random(DBFaker.getNextCounter()); // set a new random seed each call
        Calendar baseDate = Calendar.getInstance();
        if (today) {
            baseDate.set(Calendar.HOUR_OF_DAY, rnd.nextInt(9) + 9);
            baseDate.set(Calendar.MINUTE, rnd.nextInt(4) * 15);
            baseDate.set(Calendar.SECOND, 0);
            baseDate.set(Calendar.MILLISECOND, 0);

        } else {
            int rndDays = rnd.nextInt(31) + 1;
            if (goBackwards) {
                rndDays = rndDays * -1; // make into negative number
            }
            baseDate.add(Calendar.DAY_OF_MONTH, rndDays);
            baseDate.set(Calendar.HOUR_OF_DAY, rnd.nextInt(9) + 9);
            baseDate.set(Calendar.MINUTE, rnd.nextInt(4) * 15);
            baseDate.set(Calendar.SECOND, 0);
            baseDate.set(Calendar.MILLISECOND, 0);
        }
        return baseDate.getTime();
    }

}
