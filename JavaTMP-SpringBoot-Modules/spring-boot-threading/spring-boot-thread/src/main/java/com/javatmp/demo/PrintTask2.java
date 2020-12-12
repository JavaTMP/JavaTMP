package com.javatmp.demo;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Slf4j
@Component
@Scope("prototype")
public class PrintTask2 implements Runnable{

    String name;

    public void setName(String name){
        this.name = name;
    }

    @Override
    public void run() {

        log.debug("Start");
        try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        log.debug("End");
    }

}
