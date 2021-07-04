package com.javatmp.demo.async;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

@SpringBootTest
@Slf4j
class DemoApplicationTests {

    @Autowired
    private TaskFactory task;

    @Test
    public void asyncTaskTest() throws InterruptedException, ExecutionException {
        long start = System.currentTimeMillis();
        Future<Boolean> asyncTask1 = task.doAsyncTask("Task 1", 1);
        Future<Boolean> asyncTask2 = task.doAsyncTask("Task 2", 2);
        Future<Boolean> asyncTask3 = task.doAsyncTask("Task 3", 3);

        asyncTask1.get();
        asyncTask2.get();
        asyncTask3.get();
        long end = System.currentTimeMillis();
        log.info("Time between start and end ：{} ", (end - start));
    }

    @Test
    public void taskTest() throws InterruptedException {
        long start = System.currentTimeMillis();
        task.doTask("Task 1", 1);
        task.doTask("Task 2", 2);
        task.doTask("Task 3", 3);
        long end = System.currentTimeMillis();
        log.info("Time between start and end ：{} ", (end - start));
    }
}
