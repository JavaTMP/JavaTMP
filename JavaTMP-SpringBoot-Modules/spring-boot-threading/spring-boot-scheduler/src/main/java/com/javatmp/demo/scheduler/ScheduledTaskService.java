package com.javatmp.demo.scheduler;

import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.concurrent.TimeUnit;

@Service
@Slf4j
public class ScheduledTaskService {

    @Scheduled(fixedRate = 1000, initialDelay = 1000)
    public void fixedRateCurrentDate() throws InterruptedException {
        log.debug("Start fixed rate current date : {}", new Date());
        TimeUnit.SECONDS.sleep(3);
        log.debug("End fixed rate current date : {}", new Date());

    }

    @Scheduled(fixedDelay = 1000, initialDelay = 1000)
    public void fixedDelayCurrentDate() throws InterruptedException {
        log.debug("Start fixed delay current date : {}", new Date());
        TimeUnit.SECONDS.sleep(3);
        log.debug("End fixed delay current date : {}", new Date());
    }

    @Scheduled(cron="*/6 * * * * ?")
    private void process() throws InterruptedException {
        log.debug("Start cron process current date : {}", new Date());
        TimeUnit.SECONDS.sleep(3);
        log.debug("End cron process current date : {}", new Date());
    }


}
