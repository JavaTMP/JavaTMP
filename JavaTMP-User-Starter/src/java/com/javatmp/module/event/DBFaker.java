package com.javatmp.module.event;

import com.javatmp.module.dms.Document;
import com.javatmp.util.MD5Util;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;
import java.util.logging.Logger;

public class DBFaker {

    private final Logger logger = Logger.getLogger(getClass().getName());

    private List<DiaryEvent> diaryEvents = new LinkedList<>();
    private List<Document> documents = new LinkedList<>();
    private static Long counter = 0L;

    public static synchronized Long getNextCounter() {
        return ++counter;
    }

    public DBFaker() {
    }

    public synchronized void addDiaryEvent(DiaryEvent event) {
        this.getDiaryEvents().add(event);
        event.setId(Long.valueOf(this.diaryEvents.size()));
    }

    /**
     * @return the diaryEvents
     */
    public List<DiaryEvent> getDiaryEvents() {
        return diaryEvents;
    }

    /**
     * @return the documents
     */
    public List<Document> getDocuments() {
        return documents;
    }

    public static void main(String[] args) {
        DBFaker faker = new DBFaker();

    }
}
