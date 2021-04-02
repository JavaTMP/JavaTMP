package com.javatmp.demo.db.service;

import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

@Service
public class DateTimeService {

    public LocalDate getDate() {

        return LocalDate.now();
    }

    public LocalTime getTime() {

        return LocalTime.now();
    }

    public LocalDateTime getDateTime() {

        return LocalDateTime.now();
    }
}
