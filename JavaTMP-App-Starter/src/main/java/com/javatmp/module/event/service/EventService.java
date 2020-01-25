package com.javatmp.module.event.service;

import com.javatmp.module.event.entity.Event;
import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.ThreadLocalRandom;
import javax.persistence.EntityManager;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.jpa.repository.support.JpaEntityInformation;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class EventService extends SimpleExtendedJpaRepository<Event, Long> {

    private EntityManager em;

    public EventService(JpaEntityInformation<Event, Long> entityInformation, EntityManager entityManager) {
        super(entityInformation, entityManager);
        this.em = entityManager;
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
            log.info("Start [" + item.getStartDate() + "]");
            end.setTime(item.getStartDate());
            int add = (ThreadLocalRandom.current().nextInt(4) + 1) * 15;

            log.info("end minute [" + end.get(Calendar.MINUTE) + "] added [" + add + "]");
            end.add(Calendar.MINUTE, add);
            item.setEndDate(end.getTime());
            log.info("End [" + item.getEndDate() + "]");
            item.setCreationDate(new Date());
            item.setTitle("Event Title");
            item.setDescription("Event Description");
            this.save(item);
            item.setTitle("Appt: " + item.getId());
        }
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
