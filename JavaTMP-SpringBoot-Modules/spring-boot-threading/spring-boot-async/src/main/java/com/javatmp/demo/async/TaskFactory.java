package com.javatmp.demo.async;

import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.AsyncResult;
import org.springframework.stereotype.Component;

import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

@Component
@Slf4j
public class TaskFactory {

    @Async
    public Future<Boolean> doAsyncTask(String taskName, Integer time) throws InterruptedException {
        doTask(taskName, time);
        return new AsyncResult<>(Boolean.TRUE);
    }



    public void doTask(String taskName, Integer time) throws InterruptedException {
        log.info("Task [{}] working by [{}]", taskName, Thread.currentThread().getName());
        TimeUnit.SECONDS.sleep(time);
        log.info("Task [{}] finished by [{}]", taskName, Thread.currentThread().getName());
    }
}
