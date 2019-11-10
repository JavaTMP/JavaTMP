package com.javatmp.module.event;

import com.javatmp.util.JpaDaoHelper;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;
import java.util.logging.Logger;

public class EventService {

    private final Logger logger = Logger.getLogger(getClass().getName());
    final JpaDaoHelper jpaDaoHelper;

    public EventService(final JpaDaoHelper jpaDaoHelper) {
        this.jpaDaoHelper = jpaDaoHelper;

    }

    public Long getAllEventCount() {
        return this.jpaDaoHelper.getAllCount(Event.class);
    }

    public synchronized void addDiaryEvent(Event event) {
        this.jpaDaoHelper.create(event);
    }

    public List<Event> getEvents() {
        return this.jpaDaoHelper.findAll(Event.class);
    }

    public void initialiseDiary() {
        for (int i = 0; i < 50; i++) {
            Event item = new Event();
            item.setStatus(ThreadLocalRandom.current().nextInt(0, 3));
            if (i <= 5) // create ten appointments for todays date
            {
                item.setStartDate(GetRandomAppointmentTime(false, true));
            } else {  // rest of appointments on previous and future dates
                if (i % 2 == 0) {
                    item.setStartDate(GetRandomAppointmentTime(true, false));
                } // flip/flop between date ahead of today and behind today
                else {
                    item.setStartDate(GetRandomAppointmentTime(false, false));
                }
            }

            Calendar end = Calendar.getInstance();
            logger.info("Start [" + item.getStartDate() + "]");
            end.setTime(item.getStartDate());
            int add = (ThreadLocalRandom.current().nextInt(4) + 1) * 15;

            logger.info("end minute [" + end.get(Calendar.MINUTE) + "] added [" + add + "]");
            end.add(Calendar.MINUTE, add);
            item.setEndDate(end.getTime());
            logger.info("End [" + item.getEndDate() + "]");
            item.setCreationDate(new Date());
            item.setTitle("Event Title");
            item.setDescription("Event Description");
            this.addDiaryEvent(item);
            item.setTitle("Appt: " + item.getId());
        }
    }

    public Event getEventById(Event event) {
        return this.jpaDaoHelper.read(Event.class, event.getId());
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
