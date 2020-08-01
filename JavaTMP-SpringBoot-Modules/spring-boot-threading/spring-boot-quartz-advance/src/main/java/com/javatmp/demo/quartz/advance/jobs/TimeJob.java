package com.javatmp.demo.quartz.advance.jobs;

import lombok.extern.slf4j.Slf4j;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

@Slf4j
public class TimeJob extends QuartzJobBean {
    @Override
    protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
        log.info("start Time job");
        try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            log.error(e.getMessage(), e);
        }
        log.info("Time Job End");
    }
}
