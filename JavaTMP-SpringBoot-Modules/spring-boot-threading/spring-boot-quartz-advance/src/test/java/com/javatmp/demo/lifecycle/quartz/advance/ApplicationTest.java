package com.javatmp.demo.quartz.advance;

import com.javatmp.demo.quartz.advance.jobs.TimeJob;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.quartz.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
@Slf4j
public class ApplicationTest  {

    @Autowired
    private Scheduler scheduler;

    @Test
    public void test() throws Exception {

        JobDetail jobDetail = JobBuilder.newJob(TimeJob.class)
                .storeDurably(true)
                .build();

        Trigger trigger = TriggerBuilder.newTrigger()
                .forJob(jobDetail)
                .startNow()
                .build();

        scheduler.scheduleJob(jobDetail, trigger);

        Thread.sleep(5000);
        scheduler.shutdown(true);
    }
}
